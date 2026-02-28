import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/calculator/calculator_cubit.dart';
import '../../application/history/history_cubit.dart';
import '../../domain/entities/calculation_result.dart';
import '../../domain/entities/history_entry.dart';
import '../../infrastructure/evaluation/result_formatter.dart';
import '../../infrastructure/service_locator.dart';

class HistoryEntryTile extends StatelessWidget {
  const HistoryEntryTile({
    super.key,
    required this.entry,
    required this.isSelected,
  });

  final HistoryEntry entry;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final formatter = sl<ResultFormatter>();
    final colorScheme = Theme.of(context).colorScheme;

    final resultText = formatter.format(entry.result, entry.displayFormat);
    final isError = entry.result is CalculationResultError;

    return GestureDetector(
      onTap: () => context.read<HistoryCubit>().selectEntry(entry.id),
      onDoubleTap: () {
        context.read<CalculatorCubit>().loadExpression(entry.root);
        context.read<HistoryCubit>().clearSelection();
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? colorScheme.primaryContainer
              : Colors.transparent,
          border: Border(
            bottom: BorderSide(color: colorScheme.outlineVariant, width: 0.5),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Expression label (simplified text representation).
            Text(
              _expressionText(entry),
              style: TextStyle(
                fontSize: 13,
                color: colorScheme.onSurfaceVariant,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 2),
            // Result
            Text(
              '= $resultText',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: isError ? colorScheme.error : colorScheme.primary,
              ),
              textAlign: TextAlign.right,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 2),
            // Timestamp + angle unit
            Row(
              children: [
                Text(
                  entry.angleUnit.label,
                  style: TextStyle(
                    fontSize: 10,
                    color: colorScheme.outline,
                  ),
                ),
                const Spacer(),
                Text(
                  _formatTime(entry.timestamp),
                  style: TextStyle(
                    fontSize: 10,
                    color: colorScheme.outline,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Very simple text representation of the expression root for history display.
  String _expressionText(HistoryEntry entry) {
    return _nodeText(entry.root);
  }

  String _nodeText(dynamic node) {
    // Use the toString-like approach via pattern matching.
    final n = node;
    try {
      return n.when(
        placeholder: (id) => '□',
        number: (id, raw) => raw,
        constant: (id, c) => c.symbol,
        binaryOp: (id, op, left, right) =>
            '${_nodeText(left)} ${op.symbol} ${_nodeText(right)}',
        unaryOp: (id, op, operand) => '${op.symbol}(${_nodeText(operand)})',
        fraction: (id, numer, den) =>
            '(${_nodeText(numer)})/(${_nodeText(den)})',
        root: (id, radicand, index) => index != null
            ? '${_nodeText(index)}√(${_nodeText(radicand)})'
            : '√(${_nodeText(radicand)})',
        power: (id, base, exp) =>
            '(${_nodeText(base)})^(${_nodeText(exp)})',
        trigFunction: (id, func, arg) => '${func.name}(${_nodeText(arg)})',
        logFunction: (id, logType, arg, base) => base != null
            ? '${logType.label}(${_nodeText(arg)}, base=${_nodeText(base)})'
            : '${logType.label}(${_nodeText(arg)})',
        parenthesized: (id, inner) => '(${_nodeText(inner)})',
      );
    } catch (_) {
      return '…';
    }
  }

  String _formatTime(DateTime dt) {
    final now = DateTime.now();
    final diff = now.difference(dt);
    if (diff.inMinutes < 1) return 'just now';
    if (diff.inHours < 1) return '${diff.inMinutes}m ago';
    if (diff.inDays < 1) return '${diff.inHours}h ago';
    return '${dt.day}/${dt.month}/${dt.year}';
  }
}
