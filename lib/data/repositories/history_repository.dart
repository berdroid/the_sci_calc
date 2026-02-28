import 'package:shared_preferences/shared_preferences.dart';

import '../../core/constants/app_constants.dart';
import '../../domain/entities/history_entry.dart';
import '../../domain/repositories/i_history_repository.dart';
import '../mappers/history_mapper.dart';

class HistoryRepository implements IHistoryRepository {
  HistoryRepository(this._prefs, this._mapper);

  final SharedPreferences _prefs;
  final HistoryMapper _mapper;

  static const _key = 'calculator_history';

  @override
  Future<List<HistoryEntry>> loadAll() async {
    final raw = _prefs.getStringList(_key) ?? [];
    final entries = <HistoryEntry>[];
    for (final s in raw) {
      try {
        entries.add(_mapper.entryFromJsonString(s));
      } catch (_) {
        // Skip corrupt entries.
      }
    }
    return entries;
  }

  @override
  Future<void> add(HistoryEntry entry) async {
    final entries = await loadAll();
    entries.insert(0, entry);
    final trimmed = entries.take(AppConstants.maxHistoryEntries).toList();
    await _save(trimmed);
  }

  @override
  Future<void> remove(String id) async {
    final entries = await loadAll();
    entries.removeWhere((e) => e.id == id);
    await _save(entries);
  }

  @override
  Future<void> reorder(List<HistoryEntry> entries) => _save(entries);

  @override
  Future<void> clear() => _prefs.remove(_key);

  Future<void> _save(List<HistoryEntry> entries) async {
    final raw = entries.map(_mapper.entryToJsonString).toList();
    await _prefs.setStringList(_key, raw);
  }
}
