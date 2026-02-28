import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:the_sci_calc/application/calculator/calculator_cubit.dart';
import 'package:the_sci_calc/application/calculator/calculator_state.dart';
import 'package:the_sci_calc/domain/entities/calculation_result.dart';
import 'package:the_sci_calc/domain/entities/expression_node.dart';
import 'package:the_sci_calc/infrastructure/evaluation/expression_evaluator.dart';

// Helper: build a fresh cubit using the real evaluator.
CalculatorCubit makeCubit() => CalculatorCubit(const ExpressionEvaluator());

void main() {
  group('CalculatorCubit initial state', () {
    test('expressionRoot is a PlaceholderNode', () {
      final cubit = makeCubit();
      expect(cubit.state.expressionRoot, isA<PlaceholderNode>());
    });

    test('showingResult is false', () {
      final cubit = makeCubit();
      expect(cubit.state.showingResult, isFalse);
    });

    test('lastResult is null', () {
      final cubit = makeCubit();
      expect(cubit.state.lastResult, isNull);
    });
  });

  group('appendDigit', () {
    blocTest<CalculatorCubit, CalculatorState>(
      'appendDigit("3") sets expressionRoot to NumberNode with raw="3"',
      build: makeCubit,
      act: (cubit) => cubit.appendDigit('3'),
      verify: (cubit) {
        final root = cubit.state.expressionRoot;
        expect(root, isA<NumberNode>());
        expect((root as NumberNode).raw, equals('3'));
      },
    );

    blocTest<CalculatorCubit, CalculatorState>(
      'appendDigit("3") then appendDigit("7") gives raw="37"',
      build: makeCubit,
      act: (cubit) {
        cubit.appendDigit('3');
        cubit.appendDigit('7');
      },
      verify: (cubit) {
        final root = cubit.state.expressionRoot;
        expect(root, isA<NumberNode>());
        expect((root as NumberNode).raw, equals('37'));
      },
    );

    blocTest<CalculatorCubit, CalculatorState>(
      'duplicate decimal point is ignored',
      build: makeCubit,
      act: (cubit) {
        cubit.appendDigit('3');
        cubit.appendDigit('.');
        cubit.appendDigit('.');
      },
      verify: (cubit) {
        final root = cubit.state.expressionRoot;
        expect((root as NumberNode).raw, equals('3.'));
      },
    );
  });

  group('insertBinaryOp', () {
    blocTest<CalculatorCubit, CalculatorState>(
      'appendDigit("3") then insertBinaryOp(add) creates BinaryOpNode',
      build: makeCubit,
      act: (cubit) {
        cubit.appendDigit('3');
        cubit.insertBinaryOp(OperatorType.add);
      },
      verify: (cubit) {
        final root = cubit.state.expressionRoot;
        expect(root, isA<BinaryOpNode>());
        final binaryOp = root as BinaryOpNode;
        expect(binaryOp.op, equals(OperatorType.add));
        expect(binaryOp.left, isA<NumberNode>());
        expect((binaryOp.left as NumberNode).raw, equals('3'));
        expect(binaryOp.right, isA<PlaceholderNode>());
      },
    );

    blocTest<CalculatorCubit, CalculatorState>(
      'cursor moves to right placeholder after insertBinaryOp',
      build: makeCubit,
      act: (cubit) {
        cubit.appendDigit('3');
        cubit.insertBinaryOp(OperatorType.add);
      },
      verify: (cubit) {
        final root = cubit.state.expressionRoot as BinaryOpNode;
        final rightId = root.right.id;
        expect(cubit.state.cursor.focusedNodeId, equals(rightId));
      },
    );
  });

  group('evaluate', () {
    blocTest<CalculatorCubit, CalculatorState>(
      '3 + 4 evaluates to value=7.0',
      build: makeCubit,
      act: (cubit) {
        cubit.appendDigit('3');
        cubit.insertBinaryOp(OperatorType.add);
        cubit.appendDigit('4');
        cubit.evaluate();
      },
      verify: (cubit) {
        final result = cubit.state.lastResult;
        expect(result, isA<CalculationResultValue>());
        expect((result as CalculationResultValue).value, closeTo(7.0, 1e-10));
        expect(cubit.state.showingResult, isTrue);
      },
    );

    blocTest<CalculatorCubit, CalculatorState>(
      'evaluating a PlaceholderNode yields an error result',
      build: makeCubit,
      act: (cubit) => cubit.evaluate(),
      verify: (cubit) {
        final result = cubit.state.lastResult;
        expect(result, isA<CalculationResultError>());
        expect(cubit.state.showingResult, isTrue);
      },
    );
  });

  group('clear', () {
    blocTest<CalculatorCubit, CalculatorState>(
      'clear() resets expressionRoot to PlaceholderNode',
      build: makeCubit,
      act: (cubit) {
        cubit.appendDigit('3');
        cubit.insertBinaryOp(OperatorType.add);
        cubit.appendDigit('4');
        cubit.evaluate();
        cubit.clear();
      },
      verify: (cubit) {
        expect(cubit.state.expressionRoot, isA<PlaceholderNode>());
        expect(cubit.state.lastResult, isNull);
        expect(cubit.state.showingResult, isFalse);
      },
    );

    blocTest<CalculatorCubit, CalculatorState>(
      'clear() resets cursor to the new PlaceholderNode id',
      build: makeCubit,
      act: (cubit) {
        cubit.appendDigit('9');
        cubit.clear();
      },
      verify: (cubit) {
        final rootId = cubit.state.expressionRoot.id;
        expect(cubit.state.cursor.focusedNodeId, equals(rootId));
      },
    );
  });
}
