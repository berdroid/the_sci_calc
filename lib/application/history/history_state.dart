import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/history_entry.dart';

part 'history_state.freezed.dart';

@freezed
sealed class HistoryState with _$HistoryState {
  const factory HistoryState.loading() = HistoryStateLoading;

  const factory HistoryState.loaded({
    required List<HistoryEntry> entries,
    String? selectedEntryId,
  }) = HistoryStateLoaded;

  const factory HistoryState.error({
    required String message,
  }) = HistoryStateError;
}
