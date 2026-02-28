import 'package:bloc/bloc.dart';

import '../../domain/entities/history_entry.dart';
import '../../domain/repositories/i_history_repository.dart';
import 'history_state.dart';

class HistoryCubit extends Cubit<HistoryState> {
  HistoryCubit(this._repository) : super(const HistoryState.loading());

  final IHistoryRepository _repository;

  Future<void> load() async {
    emit(const HistoryState.loading());
    try {
      final entries = await _repository.loadAll();
      emit(HistoryState.loaded(entries: entries));
    } catch (e) {
      emit(HistoryState.error(message: e.toString()));
    }
  }

  Future<void> addEntry(HistoryEntry entry) async {
    await _repository.add(entry);
    final current = state;
    if (current is HistoryStateLoaded) {
      final entries = [entry, ...current.entries];
      emit(HistoryState.loaded(
        entries: entries.length > 20 ? entries.take(20).toList() : entries,
      ));
    }
  }

  void selectEntry(String id) {
    final current = state;
    if (current is HistoryStateLoaded) {
      emit(HistoryState.loaded(
        entries: current.entries,
        selectedEntryId: id,
      ));
    }
  }

  void clearSelection() {
    final current = state;
    if (current is HistoryStateLoaded) {
      emit(HistoryState.loaded(entries: current.entries));
    }
  }

  Future<void> deleteSelected() async {
    final current = state;
    if (current is HistoryStateLoaded && current.selectedEntryId != null) {
      await _repository.remove(current.selectedEntryId!);
      final entries = current.entries
          .where((e) => e.id != current.selectedEntryId)
          .toList();
      emit(HistoryState.loaded(entries: entries));
    }
  }

  Future<void> reorder(int oldIndex, int newIndex) async {
    final current = state;
    if (current is! HistoryStateLoaded) return;

    final entries = List<HistoryEntry>.from(current.entries);
    final item = entries.removeAt(oldIndex);
    entries.insert(newIndex > oldIndex ? newIndex - 1 : newIndex, item);
    emit(HistoryState.loaded(entries: entries));
    await _repository.reorder(entries);
  }

  Future<void> clear() async {
    await _repository.clear();
    emit(const HistoryState.loaded(entries: []));
  }
}
