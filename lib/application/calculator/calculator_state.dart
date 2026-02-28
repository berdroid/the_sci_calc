import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/calculation_result.dart';
import '../../domain/entities/cursor_position.dart';
import '../../domain/entities/expression_node.dart';
import '../../domain/enums/angle_unit.dart';
import '../../domain/enums/display_format.dart';

part 'calculator_state.freezed.dart';

@freezed
class CalculatorState with _$CalculatorState {
  const factory CalculatorState({
    required ExpressionNode expressionRoot,
    required CursorPosition cursor,
    SelectionRange? selection,
    CalculationResult? lastResult,
    @Default(false) bool showingResult,
    @Default(AngleUnit.degrees) AngleUnit angleUnit,
    @Default(DisplayFormat.decimal) DisplayFormat displayFormat,
  }) = _CalculatorState;
}
