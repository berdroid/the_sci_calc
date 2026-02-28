import 'package:flutter_test/flutter_test.dart';
import 'package:rational/rational.dart';
import 'package:the_sci_calc/domain/entities/calculation_result.dart';
import 'package:the_sci_calc/domain/enums/display_format.dart';
import 'package:the_sci_calc/infrastructure/evaluation/result_formatter.dart';

void main() {
  const formatter = ResultFormatter();

  CalculationResult value(double v, {Rational? exact}) =>
      CalculationResult.value(value: v, exact: exact);

  CalculationResult error(String msg) =>
      CalculationResult.error(message: msg);

  group('decimal format', () {
    test('integer 42 formats as "42"', () {
      expect(formatter.format(value(42.0), DisplayFormat.decimal), equals('42'));
    });

    test('3.14 formats as "3.14"', () {
      expect(formatter.format(value(3.14), DisplayFormat.decimal), equals('3.14'));
    });

    test('0 formats as "0"', () {
      expect(formatter.format(value(0.0), DisplayFormat.decimal), equals('0'));
    });

    test('trailing zeros are stripped: 1.50 -> "1.5"', () {
      expect(formatter.format(value(1.5), DisplayFormat.decimal), equals('1.5'));
    });
  });

  group('scientific format', () {
    test('1234567 contains "× 10"', () {
      final result = formatter.format(value(1234567.0), DisplayFormat.scientific);
      expect(result, contains('× 10'));
    });

    test('1234567 exponent is ⁶', () {
      final result = formatter.format(value(1234567.0), DisplayFormat.scientific);
      expect(result, contains('⁶'));
    });

    test('1234567 mantissa starts with "1."', () {
      final result = formatter.format(value(1234567.0), DisplayFormat.scientific);
      expect(result, startsWith('1.'));
    });

    test('0 formats as "0 × 10⁰"', () {
      expect(
        formatter.format(value(0.0), DisplayFormat.scientific),
        equals('0 × 10⁰'),
      );
    });
  });

  group('engineering format', () {
    test('exponent is a multiple of 3 for 1234567', () {
      final result = formatter.format(value(1234567.0), DisplayFormat.engineering);
      // Engineering format uses exponent 6 here.
      expect(result, contains('× 10'));
      expect(result, contains('⁶'));
    });

    test('exponent is a multiple of 3 for 0.001', () {
      final result = formatter.format(value(0.001), DisplayFormat.engineering);
      expect(result, contains('× 10'));
      // exponent should be -3
      expect(result, contains('⁻'));
      expect(result, contains('³'));
    });

    test('10000 uses exponent ³ (multiple of 3)', () {
      // 10000 -> log10 floor = 4, engineering snaps to exp 3.
      final result = formatter.format(value(10000.0), DisplayFormat.engineering);
      expect(result, contains('× 10'));
      expect(result, contains('³'));
    });
  });

  group('DMS format', () {
    test('1.5 degrees formats as 1° 30\' 0"', () {
      final result = formatter.format(value(1.5), DisplayFormat.dms);
      expect(result, contains('1°'));
      expect(result, contains("30'"));
      // seconds should be 0
      expect(result, contains('0"'));
    });

    test('0 degrees formats as 0° 0\' 0"', () {
      final result = formatter.format(value(0.0), DisplayFormat.dms);
      expect(result, contains("0°"));
    });

    test('negative value has minus sign', () {
      final result = formatter.format(value(-1.5), DisplayFormat.dms);
      expect(result, startsWith('-'));
    });
  });

  group('rational format', () {
    test('exact 1/3 displays as "1/3"', () {
      final exact = Rational(BigInt.one, BigInt.from(3));
      final result = formatter.format(value(1 / 3, exact: exact), DisplayFormat.rational);
      expect(result, equals('1/3'));
    });

    test('exact 2/1 displays as "2"', () {
      final exact = Rational(BigInt.from(2), BigInt.one);
      final result = formatter.format(value(2.0, exact: exact), DisplayFormat.rational);
      expect(result, equals('2'));
    });

    test('exact 3/4 displays as "3/4"', () {
      final exact = Rational(BigInt.from(3), BigInt.from(4));
      final result = formatter.format(value(0.75, exact: exact), DisplayFormat.rational);
      expect(result, equals('3/4'));
    });

    test('0 displays as "0"', () {
      final result = formatter.format(value(0.0), DisplayFormat.rational);
      expect(result, equals('0'));
    });
  });

  group('error result', () {
    test('formats with "Error:" prefix', () {
      final result = formatter.format(error('Division by zero'), DisplayFormat.decimal);
      expect(result, startsWith('Error:'));
    });

    test('includes the error message text', () {
      const msg = 'Missing value';
      final result = formatter.format(error(msg), DisplayFormat.decimal);
      expect(result, contains(msg));
    });
  });
}
