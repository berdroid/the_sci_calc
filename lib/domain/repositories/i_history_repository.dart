import '../entities/history_entry.dart';

abstract interface class IHistoryRepository {
  Future<List<HistoryEntry>> loadAll();
  Future<void> add(HistoryEntry entry);
  Future<void> remove(String id);
  Future<void> reorder(List<HistoryEntry> entries);
  Future<void> clear();
}
