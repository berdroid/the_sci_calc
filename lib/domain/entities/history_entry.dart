import 'package:freezed_annotation/freezed_annotation.dart';

import '../enums/angle_unit.dart';
import '../enums/display_format.dart';
import 'calculation_result.dart';
import 'expression_node.dart';

part 'history_entry.freezed.dart';

@freezed
class HistoryEntry with _$HistoryEntry {
  const factory HistoryEntry({
    required String id,
    required ExpressionNode root,
    required CalculationResult result,
    required AngleUnit angleUnit,
    required DisplayFormat displayFormat,
    required DateTime timestamp,
  }) = _HistoryEntry;
}
