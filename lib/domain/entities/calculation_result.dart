import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rational/rational.dart';

part 'calculation_result.freezed.dart';

@freezed
sealed class CalculationResult with _$CalculationResult {
  const factory CalculationResult.value({
    /// Exact rational value when available (e.g. 1/3 for 0.333...).
    Rational? exact,

    /// Double representation used for all display formats.
    required double value,
  }) = CalculationResultValue;

  const factory CalculationResult.error({
    required String message,
    String? culpritNodeId,
  }) = CalculationResultError;
}
