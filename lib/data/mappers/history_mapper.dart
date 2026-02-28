import 'dart:convert';

import '../../domain/entities/calculation_result.dart';
import '../../domain/entities/history_entry.dart';
import '../../domain/enums/angle_unit.dart';
import '../../domain/enums/display_format.dart';
import 'expression_mapper.dart';

class HistoryMapper {
  const HistoryMapper(this._expressionMapper);

  final ExpressionMapper _expressionMapper;

  Map<String, dynamic> entryToJson(HistoryEntry entry) {
    final resultJson = switch (entry.result) {
      CalculationResultValue(:final value) => {
          'type': 'value',
          'value': value,
          'exact': switch (entry.result) {
            CalculationResultValue(:final exact) => exact != null
                ? '${exact.numerator}/${exact.denominator}'
                : null,
            _ => null,
          },
        },
      CalculationResultError(:final message) => {
          'type': 'error',
          'message': message,
        },
    };

    return {
      'id': entry.id,
      'root': _expressionMapper.nodeToJson(entry.root),
      'result': resultJson,
      'angleUnit': entry.angleUnit.name,
      'displayFormat': entry.displayFormat.name,
      'timestamp': entry.timestamp.toIso8601String(),
    };
  }

  HistoryEntry entryFromJson(Map<String, dynamic> json) {
    final resultJson = json['result'] as Map<String, dynamic>;
    final CalculationResult result;
    if (resultJson['type'] == 'value') {
      result = CalculationResult.value(
        value: (resultJson['value'] as num).toDouble(),
      );
    } else {
      result = CalculationResult.error(
        message: resultJson['message'] as String,
      );
    }

    return HistoryEntry(
      id: json['id'] as String,
      root: _expressionMapper.nodeFromJson(
        json['root'] as Map<String, dynamic>,
      ),
      result: result,
      angleUnit: AngleUnit.values.byName(json['angleUnit'] as String),
      displayFormat: DisplayFormat.values.byName(json['displayFormat'] as String),
      timestamp: DateTime.parse(json['timestamp'] as String),
    );
  }

  String entryToJsonString(HistoryEntry entry) =>
      jsonEncode(entryToJson(entry));

  HistoryEntry entryFromJsonString(String s) =>
      entryFromJson(jsonDecode(s) as Map<String, dynamic>);
}
