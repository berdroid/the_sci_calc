import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/calculator/calculator_cubit.dart';
import '../../application/calculator/calculator_state.dart';
import '../../application/settings/settings_cubit.dart';
import '../../domain/entities/calculation_result.dart';
import '../../domain/enums/display_format.dart';
import '../../infrastructure/evaluation/result_formatter.dart';
import '../../infrastructure/service_locator.dart';

class ResultDisplay extends StatelessWidget {
  const ResultDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    final formatter = sl<ResultFormatter>();

    return BlocBuilder<CalculatorCubit, CalculatorState>(
      builder: (context, state) {
        if (!state.showingResult || state.lastResult == null) {
          return const SizedBox.shrink();
        }

        final result = state.lastResult!;
        final isError = result is CalculationResultError;
        final colorScheme = Theme.of(context).colorScheme;

        return AnimatedSlide(
          offset: const Offset(0, 0),
          duration: const Duration(milliseconds: 200),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: isError
                ? colorScheme.errorContainer
                : colorScheme.primaryContainer.withValues(alpha: 0.5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('= ', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w300)),
                Expanded(
                  child: Text(
                    formatter.format(result, state.displayFormat),
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                      color: isError
                          ? colorScheme.error
                          : colorScheme.primary,
                    ),
                    textAlign: TextAlign.right,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 8),
                // Format cycle button
                if (!isError)
                  _FormatCycleButton(
                    current: state.displayFormat,
                    onCycle: () => _cycleFormat(context, state.displayFormat),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _cycleFormat(BuildContext context, DisplayFormat current) {
    final formats = DisplayFormat.values;
    final next = formats[(formats.indexOf(current) + 1) % formats.length];
    context.read<CalculatorCubit>().setDisplayFormat(next);
    context.read<SettingsCubit>().setDisplayFormat(next);
  }
}

class _FormatCycleButton extends StatelessWidget {
  const _FormatCycleButton({required this.current, required this.onCycle});

  final DisplayFormat current;
  final VoidCallback onCycle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onCycle,
      borderRadius: BorderRadius.circular(6),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).colorScheme.outline),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          current.label,
          style: TextStyle(
            fontSize: 11,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
