import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/calculator/calculator_cubit.dart';
import 'button_definitions.dart';
import 'calculator_button.dart';

class KeypadGrid extends StatelessWidget {
  const KeypadGrid({super.key});

  // All rows have 4 flex units total (verified in button_definitions.dart).
  static const _flexUnitsPerRow = 4;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Each button's height = total height / number of rows.
        final buttonHeight = constraints.maxHeight / keypadGrid.length;
        // Limit width so no button exceeds 2× its height.
        final maxWidth = buttonHeight * 2 * _flexUnitsPerRow;

        return Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: maxWidth),
            child: Column(
              children:
                  keypadGrid.map((row) => _buildRow(context, row)).toList(),
            ),
          ),
        );
      },
    );
  }

  Widget _buildRow(BuildContext context, List<ButtonDefinition?> row) {
    return Expanded(
      child: Row(
        children: row.map((def) {
          if (def == null) return const Spacer();
          return Expanded(
            flex: def.flex,
            child: CalculatorButton(
              definition: def,
              onPressed: () => _handleAction(context, def.action),
            ),
          );
        }).toList(),
      ),
    );
  }

  void _handleAction(BuildContext context, KeyAction action) {
    final cubit = context.read<CalculatorCubit>();
    switch (action) {
      case DigitAction(:final digit):
        cubit.appendDigit(digit);
      case DecimalAction():
        cubit.appendDecimalPoint();
      case BinaryOpAction(:final op):
        cubit.insertBinaryOp(op);
      case FractionAction():
        cubit.insertFraction();
      case PowerAction():
        cubit.insertPower();
      case SquareAction():
        cubit.insertSquare();
      case SqrtAction():
        cubit.insertSquareRoot();
      case NthRootAction():
        cubit.insertNthRoot();
      case TrigAction(:final func):
        cubit.insertTrigFunction(func);
      case LogAction(:final logType):
        cubit.insertLogFunction(logType);
      case ConstantAction(:final constant):
        cubit.insertConstant(constant);
      case AbsAction():
        cubit.insertAbsoluteValue();
      case NegateAction():
        cubit.insertNegate();
      case ParenAction():
        cubit.insertParentheses();
      case ReciprocalAction():
        cubit.insertReciprocal();
      case DeleteAction():
        cubit.deleteAtCursor();
      case ClearAction():
        cubit.clear();
      case EvaluateAction():
        cubit.evaluate();
      case MoveCursorLeftAction():
        cubit.moveCursorLeft();
      case MoveCursorRightAction():
        cubit.moveCursorRight();
    }
  }
}
