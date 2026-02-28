import '../../domain/entities/expression_node.dart';

/// Sealed hierarchy of all possible key actions.
sealed class KeyAction {
  const KeyAction();
}

final class DigitAction extends KeyAction {
  const DigitAction(this.digit);
  final String digit;
}

final class DecimalAction extends KeyAction {
  const DecimalAction();
}

final class BinaryOpAction extends KeyAction {
  const BinaryOpAction(this.op);
  final OperatorType op;
}

final class FractionAction extends KeyAction {
  const FractionAction();
}

final class PowerAction extends KeyAction {
  const PowerAction();
}

final class SquareAction extends KeyAction {
  const SquareAction();
}

final class SqrtAction extends KeyAction {
  const SqrtAction();
}

final class NthRootAction extends KeyAction {
  const NthRootAction();
}

final class TrigAction extends KeyAction {
  const TrigAction(this.func);
  final TrigFunctionType func;
}

final class LogAction extends KeyAction {
  const LogAction(this.logType);
  final LogType logType;
}

final class ConstantAction extends KeyAction {
  const ConstantAction(this.constant);
  final ConstantType constant;
}

final class AbsAction extends KeyAction {
  const AbsAction();
}

final class NegateAction extends KeyAction {
  const NegateAction();
}

final class ParenAction extends KeyAction {
  const ParenAction();
}

final class ReciprocalAction extends KeyAction {
  const ReciprocalAction();
}

final class DeleteAction extends KeyAction {
  const DeleteAction();
}

final class ClearAction extends KeyAction {
  const ClearAction();
}

final class EvaluateAction extends KeyAction {
  const EvaluateAction();
}

final class MoveCursorLeftAction extends KeyAction {
  const MoveCursorLeftAction();
}

final class MoveCursorRightAction extends KeyAction {
  const MoveCursorRightAction();
}

/// Visual style for a button.
enum ButtonStyle {
  digit,
  operator,
  function,
  equals,
  utility,
  navigation,
}

class ButtonDefinition {
  const ButtonDefinition({
    required this.label,
    required this.action,
    required this.style,
    this.secondaryLabel,
    this.flex = 1,
  });

  final String label;
  final String? secondaryLabel;
  final KeyAction action;
  final ButtonStyle style;
  final int flex;
}

/// Full keypad grid (rows of columns). Null entries are spacers.
final List<List<ButtonDefinition?>> keypadGrid = [
  // Row 0: Navigation + utility
  [
    const ButtonDefinition(
      label: '◀',
      action: MoveCursorLeftAction(),
      style: ButtonStyle.navigation,
    ),
    const ButtonDefinition(
      label: '▶',
      action: MoveCursorRightAction(),
      style: ButtonStyle.navigation,
    ),
    const ButtonDefinition(
      label: '⌫',
      action: DeleteAction(),
      style: ButtonStyle.utility,
    ),
    const ButtonDefinition(
      label: 'AC',
      action: ClearAction(),
      style: ButtonStyle.utility,
    ),
  ],

  // Row 1: Scientific functions
  [
    const ButtonDefinition(
      label: 'sin',
      action: TrigAction(TrigFunctionType.sin),
      style: ButtonStyle.function,
    ),
    const ButtonDefinition(
      label: 'cos',
      action: TrigAction(TrigFunctionType.cos),
      style: ButtonStyle.function,
    ),
    const ButtonDefinition(
      label: 'tan',
      action: TrigAction(TrigFunctionType.tan),
      style: ButtonStyle.function,
    ),
    const ButtonDefinition(
      label: 'ln',
      action: LogAction(LogType.natural),
      style: ButtonStyle.function,
    ),
  ],

  // Row 2: Inverse trig + log
  [
    const ButtonDefinition(
      label: 'sin⁻¹',
      action: TrigAction(TrigFunctionType.asin),
      style: ButtonStyle.function,
    ),
    const ButtonDefinition(
      label: 'cos⁻¹',
      action: TrigAction(TrigFunctionType.acos),
      style: ButtonStyle.function,
    ),
    const ButtonDefinition(
      label: 'tan⁻¹',
      action: TrigAction(TrigFunctionType.atan),
      style: ButtonStyle.function,
    ),
    const ButtonDefinition(
      label: 'log',
      action: LogAction(LogType.base10),
      style: ButtonStyle.function,
    ),
  ],

  // Row 3: Constants + structured
  [
    const ButtonDefinition(
      label: 'π',
      action: ConstantAction(ConstantType.pi),
      style: ButtonStyle.function,
    ),
    const ButtonDefinition(
      label: 'e',
      action: ConstantAction(ConstantType.e),
      style: ButtonStyle.function,
    ),
    const ButtonDefinition(
      label: 'x²',
      action: SquareAction(),
      style: ButtonStyle.function,
    ),
    const ButtonDefinition(
      label: '√',
      action: SqrtAction(),
      style: ButtonStyle.function,
    ),
  ],

  // Row 4: Fraction + power + parens + negate
  [
    const ButtonDefinition(
      label: 'a/b',
      action: FractionAction(),
      style: ButtonStyle.function,
    ),
    const ButtonDefinition(
      label: 'xʸ',
      action: PowerAction(),
      style: ButtonStyle.function,
    ),
    const ButtonDefinition(
      label: '( )',
      action: ParenAction(),
      style: ButtonStyle.function,
    ),
    const ButtonDefinition(
      label: '±',
      action: NegateAction(),
      style: ButtonStyle.function,
    ),
  ],

  // Row 5: 7 8 9 ÷
  [
    const ButtonDefinition(label: '7', action: DigitAction('7'), style: ButtonStyle.digit),
    const ButtonDefinition(label: '8', action: DigitAction('8'), style: ButtonStyle.digit),
    const ButtonDefinition(label: '9', action: DigitAction('9'), style: ButtonStyle.digit),
    const ButtonDefinition(
      label: '÷',
      action: BinaryOpAction(OperatorType.divide),
      style: ButtonStyle.operator,
    ),
  ],

  // Row 6: 4 5 6 ×
  [
    const ButtonDefinition(label: '4', action: DigitAction('4'), style: ButtonStyle.digit),
    const ButtonDefinition(label: '5', action: DigitAction('5'), style: ButtonStyle.digit),
    const ButtonDefinition(label: '6', action: DigitAction('6'), style: ButtonStyle.digit),
    const ButtonDefinition(
      label: '×',
      action: BinaryOpAction(OperatorType.multiply),
      style: ButtonStyle.operator,
    ),
  ],

  // Row 7: 1 2 3 −
  [
    const ButtonDefinition(label: '1', action: DigitAction('1'), style: ButtonStyle.digit),
    const ButtonDefinition(label: '2', action: DigitAction('2'), style: ButtonStyle.digit),
    const ButtonDefinition(label: '3', action: DigitAction('3'), style: ButtonStyle.digit),
    const ButtonDefinition(
      label: '−',
      action: BinaryOpAction(OperatorType.subtract),
      style: ButtonStyle.operator,
    ),
  ],

  // Row 8: 0 . = +
  [
    const ButtonDefinition(
      label: '0',
      action: DigitAction('0'),
      style: ButtonStyle.digit,
      flex: 2,
    ),
    const ButtonDefinition(label: '.', action: DecimalAction(), style: ButtonStyle.digit),
    const ButtonDefinition(
      label: '+',
      action: BinaryOpAction(OperatorType.add),
      style: ButtonStyle.operator,
    ),
  ],

  // Row 9: Equals (full width)
  [
    const ButtonDefinition(
      label: '=',
      action: EvaluateAction(),
      style: ButtonStyle.equals,
      flex: 4,
    ),
  ],
];
