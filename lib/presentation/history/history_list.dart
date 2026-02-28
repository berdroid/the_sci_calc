import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/history/history_cubit.dart';
import '../../application/history/history_state.dart';
import 'history_entry_tile.dart';

class HistoryList extends StatelessWidget {
  const HistoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryCubit, HistoryState>(
      builder: (context, state) {
        return switch (state) {
          HistoryStateLoading() => const Center(child: CircularProgressIndicator()),
          HistoryStateError(:final message) => Center(
              child: Text(
                'Failed to load history:\n$message',
                textAlign: TextAlign.center,
              ),
            ),
          HistoryStateLoaded(:final entries, :final selectedEntryId) =>
            entries.isEmpty
                ? Center(
                    child: Text(
                      'No history yet.\nResults appear here after evaluation.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.outline,
                        fontSize: 13,
                      ),
                    ),
                  )
                : Column(
                    children: [
                      // Header
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        child: Row(
                          children: [
                            Text(
                              'History',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            const Spacer(),
                            if (selectedEntryId != null)
                              IconButton(
                                icon: const Icon(Icons.delete_outline, size: 18),
                                tooltip: 'Delete',
                                onPressed: () =>
                                    context.read<HistoryCubit>().deleteSelected(),
                              ),
                            IconButton(
                              icon: const Icon(Icons.clear_all, size: 18),
                              tooltip: 'Clear all',
                              onPressed: () =>
                                  context.read<HistoryCubit>().clear(),
                            ),
                          ],
                        ),
                      ),
                      const Divider(height: 1),
                      Expanded(
                        child: ReorderableListView.builder(
                          itemCount: entries.length,
                          onReorder: (oldIndex, newIndex) {
                            context
                                .read<HistoryCubit>()
                                .reorder(oldIndex, newIndex);
                          },
                          itemBuilder: (context, index) {
                            final entry = entries[index];
                            return HistoryEntryTile(
                              key: ValueKey(entry.id),
                              entry: entry,
                              isSelected: entry.id == selectedEntryId,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
        };
      },
    );
  }
}
