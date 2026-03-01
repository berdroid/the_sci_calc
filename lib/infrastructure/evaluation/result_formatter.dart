import 'dart:math' as math;

import 'package:rational/rational.dart';

import '../../core/constants/app_constants.dart';
import '../../domain/entities/calculation_result.dart';
import '../../domain/enums/display_format.dart';

/// Converts a [CalculationResult] to a human-readable string in one of the
/// five display formats.
class ResultFormatter {
  const ResultFormatter();

  String format(CalculationResult result, DisplayFormat fmt) {
    return switch (result) {
      CalculationResultError(:final message) => 'Error: $message',
      CalculationResultValue(:final exact, :final value) =>
        _formatValue(value, exact, fmt),
    };
  }

  String _formatValue(double value, Rational? exact, DisplayFormat fmt) {
    if (value.isNaN) return 'Not a number';
    if (value.isInfinite) return value > 0 ? '∞' : '-∞';

    // Values below 1e-15 in magnitude are indistinguishable from zero at
    // 15 significant figures — they represent floating-point rounding noise
    // from transcendental functions (e.g. sin(π) ≈ 1.22×10⁻¹⁶ instead of 0).
    // The rational formatter already applies the same threshold via its
    // continued-fraction algorithm; snap here to keep all formats consistent.
    if (value.abs() < 1e-15) value = 0.0;

    return switch (fmt) {
      DisplayFormat.decimal => _decimal(value),
      DisplayFormat.scientific => _scientific(value),
      DisplayFormat.engineering => _engineering(value),
      DisplayFormat.dms => _dms(value),
      DisplayFormat.rational => _rational(value, exact),
    };
  }

  // ── Decimal ──────────────────────────────────────────────────────────────────

  String _decimal(double value) {
    if (value == 0) return '0';
    final s = value.toStringAsPrecision(AppConstants.maxSignificantDigits);
    if (s.contains('e') || s.contains('E')) {
      return _scientific(value);
    }
    return _stripTrailingZeros(s);
  }

  // ── Scientific ───────────────────────────────────────────────────────────────

  String _scientific(double value) {
    if (value == 0) return '0 × 10⁰';
    final exp = _exponent(value);
    final mantissa = value / math.pow(10, exp);
    final mStr = _stripTrailingZeros(mantissa.toStringAsPrecision(14));
    return '$mStr × 10${_superscript(exp)}';
  }

  // ── Engineering ───────────────────────────────────────────────────────────────

  String _engineering(double value) {
    if (value == 0) return '0 × 10⁰';
    int exp = _exponent(value);
    final remainder = exp % 3;
    if (remainder < 0) {
      exp = exp - (3 + remainder);
    } else {
      exp = exp - remainder;
    }
    final mantissa = value / math.pow(10, exp);
    final mStr = _stripTrailingZeros(mantissa.toStringAsPrecision(14));
    return '$mStr × 10${_superscript(exp)}';
  }

  // ── DMS ───────────────────────────────────────────────────────────────────────

  String _dms(double value) {
    final isNegative = value < 0;
    final abs = value.abs();
    final degrees = abs.floor();
    final minutesDecimal = (abs - degrees) * 60;
    final minutes = minutesDecimal.floor();
    final seconds = (minutesDecimal - minutes) * 60;

    final sign = isNegative ? '-' : '';
    final secStr = _stripTrailingZeros(seconds.toStringAsPrecision(10));
    return "$sign$degrees° $minutes' $secStr\"";
  }

  // ── Rational ──────────────────────────────────────────────────────────────────

  String _rational(double value, Rational? exact) {
    if (value == 0) return '0';

    if (exact != null) {
      return _formatRational(exact);
    }

    final approx = _continuedFraction(value, AppConstants.maxRationalDenominator);
    if (approx != null) {
      return _formatRational(approx);
    }

    return _decimal(value);
  }

  String _formatRational(Rational r) {
    if (r.denominator == BigInt.one) {
      return r.numerator.toString();
    }

    // Compute the integer (whole) part.
    final wholeInt = r.numerator ~/ r.denominator; // BigInt truncated division
    final wholeRational = Rational(wholeInt, BigInt.one);
    final remainder = r - wholeRational;

    if (wholeInt != BigInt.zero && remainder.numerator != BigInt.zero) {
      final num = remainder.numerator.abs();
      final den = remainder.denominator;
      return '$wholeInt $num/$den';
    }
    return '${r.numerator}/${r.denominator}';
  }

  Rational? _continuedFraction(double value, int maxDenominator) {
    final isNegative = value < 0;
    final abs = value.abs();

    if (abs > 1e15) return null;

    final a0 = abs.floor();
    double r = abs - a0;

    if (r < 1e-15) {
      final n = isNegative ? BigInt.from(-a0) : BigInt.from(a0);
      return Rational(n, BigInt.one);
    }

    int h0 = 1;
    int h1 = a0;
    int k0 = 0;
    int k1 = 1;

    while (true) {
      if (r < 1e-15) break;
      final inv = 1 / r;
      final a = inv.floor();
      r = inv - a;

      final h2 = a * h1 + h0;
      final k2 = a * k1 + k0;

      if (k2 > maxDenominator) break;

      h0 = h1;
      k0 = k1;
      h1 = h2;
      k1 = k2;
    }

    final num = BigInt.from(isNegative ? -h1 : h1);
    final den = BigInt.from(k1);
    return Rational(num, den);
  }

  // ── Utilities ─────────────────────────────────────────────────────────────────

  String _stripTrailingZeros(String s) {
    if (!s.contains('.')) return s;
    s = s.replaceAll(RegExp(r'0+$'), '');
    if (s.endsWith('.')) s = s.substring(0, s.length - 1);
    return s;
  }

  int _exponent(double value) {
    if (value == 0) return 0;
    return math.log(value.abs()) ~/ math.ln10;
  }

  String _superscript(int n) {
    const digits = ['⁰', '¹', '²', '³', '⁴', '⁵', '⁶', '⁷', '⁸', '⁹'];
    final isNeg = n < 0;
    final abs = n.abs();
    final result =
        abs.toString().split('').map((d) => digits[int.parse(d)]).join();
    return isNeg ? '⁻$result' : result;
  }
}
