import 'dart:math' as math;

import 'package:flutter_test/flutter_test.dart';
import 'package:the_sci_calc/domain/entities/calculation_result.dart';
import 'package:the_sci_calc/domain/entities/expression_node.dart';
import 'package:the_sci_calc/domain/enums/angle_unit.dart';
import 'package:the_sci_calc/infrastructure/evaluation/expression_evaluator.dart';

void main() {
  const evaluator = ExpressionEvaluator();

  // Helper: evaluate with degrees (default for most tests).
  CalculationResult eval(ExpressionNode node, {AngleUnit unit = AngleUnit.degrees}) =>
      evaluator.evaluate(node, unit);

  // Convenience accessors so tests stay concise.
  double valueOf(CalculationResult r) => (r as CalculationResultValue).value;
  bool isError(CalculationResult r) => r is CalculationResultError;

  group('NumberNode', () {
    test('integer 42 evaluates to 42.0', () {
      final node = ExpressionNode.number(id: '1', raw: '42');
      final result = eval(node);
      expect(valueOf(result), equals(42.0));
    });

    test('decimal 3.14 evaluates to 3.14', () {
      final node = ExpressionNode.number(id: '1', raw: '3.14');
      final result = eval(node);
      expect(valueOf(result), closeTo(3.14, 1e-10));
    });
  });

  group('PlaceholderNode', () {
    test('evaluates to an error result', () {
      final node = ExpressionNode.placeholder(id: '1');
      final result = eval(node);
      expect(isError(result), isTrue);
      expect((result as CalculationResultError).culpritNodeId, equals('1'));
    });
  });

  group('BinaryOpNode', () {
    test('add: 3 + 4 = 7', () {
      final node = ExpressionNode.binaryOp(
        id: '1',
        op: OperatorType.add,
        left: ExpressionNode.number(id: '2', raw: '3'),
        right: ExpressionNode.number(id: '3', raw: '4'),
      );
      expect(valueOf(eval(node)), equals(7.0));
    });

    test('subtract: 10 - 3 = 7', () {
      final node = ExpressionNode.binaryOp(
        id: '1',
        op: OperatorType.subtract,
        left: ExpressionNode.number(id: '2', raw: '10'),
        right: ExpressionNode.number(id: '3', raw: '3'),
      );
      expect(valueOf(eval(node)), equals(7.0));
    });

    test('multiply: 6 × 7 = 42', () {
      final node = ExpressionNode.binaryOp(
        id: '1',
        op: OperatorType.multiply,
        left: ExpressionNode.number(id: '2', raw: '6'),
        right: ExpressionNode.number(id: '3', raw: '7'),
      );
      expect(valueOf(eval(node)), equals(42.0));
    });

    test('divide by zero returns error', () {
      final node = ExpressionNode.binaryOp(
        id: '1',
        op: OperatorType.divide,
        left: ExpressionNode.number(id: '2', raw: '5'),
        right: ExpressionNode.number(id: '3', raw: '0'),
      );
      expect(isError(eval(node)), isTrue);
    });

    test('divide: 10 ÷ 4 = 2.5', () {
      final node = ExpressionNode.binaryOp(
        id: '1',
        op: OperatorType.divide,
        left: ExpressionNode.number(id: '2', raw: '10'),
        right: ExpressionNode.number(id: '3', raw: '4'),
      );
      expect(valueOf(eval(node)), closeTo(2.5, 1e-10));
    });
  });

  group('TrigFunctionNode', () {
    test('sin(0°) == 0', () {
      final node = ExpressionNode.trigFunction(
        id: '1',
        func: TrigFunctionType.sin,
        argument: ExpressionNode.number(id: '2', raw: '0'),
      );
      expect(valueOf(eval(node, unit: AngleUnit.degrees)), closeTo(0.0, 1e-10));
    });

    test('sin(90°) == 1', () {
      final node = ExpressionNode.trigFunction(
        id: '1',
        func: TrigFunctionType.sin,
        argument: ExpressionNode.number(id: '2', raw: '90'),
      );
      expect(valueOf(eval(node, unit: AngleUnit.degrees)), closeTo(1.0, 1e-10));
    });

    test('sin(π/2 rad) == 1', () {
      final piOver2 = (math.pi / 2).toString();
      final node = ExpressionNode.trigFunction(
        id: '1',
        func: TrigFunctionType.sin,
        argument: ExpressionNode.number(id: '2', raw: piOver2),
      );
      expect(valueOf(eval(node, unit: AngleUnit.radians)), closeTo(1.0, 1e-10));
    });

    test('cos(0°) == 1', () {
      final node = ExpressionNode.trigFunction(
        id: '1',
        func: TrigFunctionType.cos,
        argument: ExpressionNode.number(id: '2', raw: '0'),
      );
      expect(valueOf(eval(node, unit: AngleUnit.degrees)), closeTo(1.0, 1e-10));
    });
  });

  group('PowerNode', () {
    test('2^3 = 8', () {
      final node = ExpressionNode.power(
        id: '1',
        base: ExpressionNode.number(id: '2', raw: '2'),
        exponent: ExpressionNode.number(id: '3', raw: '3'),
      );
      expect(valueOf(eval(node)), closeTo(8.0, 1e-10));
    });

    test('10^0 = 1', () {
      final node = ExpressionNode.power(
        id: '1',
        base: ExpressionNode.number(id: '2', raw: '10'),
        exponent: ExpressionNode.number(id: '3', raw: '0'),
      );
      expect(valueOf(eval(node)), closeTo(1.0, 1e-10));
    });
  });

  group('FractionNode', () {
    test('1/2 = 0.5', () {
      final node = ExpressionNode.fraction(
        id: '1',
        numerator: ExpressionNode.number(id: '2', raw: '1'),
        denominator: ExpressionNode.number(id: '3', raw: '2'),
      );
      expect(valueOf(eval(node)), closeTo(0.5, 1e-10));
    });

    test('divide by zero returns error', () {
      final node = ExpressionNode.fraction(
        id: '1',
        numerator: ExpressionNode.number(id: '2', raw: '3'),
        denominator: ExpressionNode.number(id: '3', raw: '0'),
      );
      expect(isError(eval(node)), isTrue);
    });
  });

  group('RootNode', () {
    test('square root of 4 = 2', () {
      final node = ExpressionNode.root(
        id: '1',
        radicand: ExpressionNode.number(id: '2', raw: '4'),
      );
      expect(valueOf(eval(node)), closeTo(2.0, 1e-10));
    });

    test('square root of 9 = 3', () {
      final node = ExpressionNode.root(
        id: '1',
        radicand: ExpressionNode.number(id: '2', raw: '9'),
      );
      expect(valueOf(eval(node)), closeTo(3.0, 1e-10));
    });
  });

  group('UnaryOpNode', () {
    test('negate 5 gives -5', () {
      final node = ExpressionNode.unaryOp(
        id: '1',
        op: UnaryOperatorType.negate,
        operand: ExpressionNode.number(id: '2', raw: '5'),
      );
      expect(valueOf(eval(node)), closeTo(-5.0, 1e-10));
    });

    test('absolute value of -3 gives 3', () {
      final node = ExpressionNode.unaryOp(
        id: '1',
        op: UnaryOperatorType.absoluteValue,
        operand: ExpressionNode.number(id: '2', raw: '-3'),
      );
      expect(valueOf(eval(node)), closeTo(3.0, 1e-10));
    });
  });

  group('ConstantNode', () {
    test('pi evaluates to approximately 3.14159', () {
      final node = ExpressionNode.constant(
        id: '1',
        constant: ConstantType.pi,
      );
      expect(valueOf(eval(node)), closeTo(3.14159, 1e-5));
    });

    test('e evaluates to approximately 2.71828', () {
      final node = ExpressionNode.constant(
        id: '1',
        constant: ConstantType.e,
      );
      expect(valueOf(eval(node)), closeTo(2.71828, 1e-5));
    });
  });

  group('ParenthesizedNode', () {
    test('(3) evaluates to 3', () {
      final node = ExpressionNode.parenthesized(
        id: '1',
        inner: ExpressionNode.number(id: '2', raw: '3'),
      );
      expect(valueOf(eval(node)), equals(3.0));
    });

    test('(3 + 4) evaluates to 7', () {
      final node = ExpressionNode.parenthesized(
        id: '1',
        inner: ExpressionNode.binaryOp(
          id: '2',
          op: OperatorType.add,
          left: ExpressionNode.number(id: '3', raw: '3'),
          right: ExpressionNode.number(id: '4', raw: '4'),
        ),
      );
      expect(valueOf(eval(node)), equals(7.0));
    });
  });
}
