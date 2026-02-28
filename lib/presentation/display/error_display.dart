import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/calculator/calculator_cubit.dart';
import '../../application/calculator/calculator_state.dart';
import '../../domain/entities/calculation_result.dart';

class ErrorDisplay extends StatelessWidget {
  const ErrorDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculatorCubit, CalculatorState>(
      buildWhen: (prev, curr) =>
          prev.lastResult != curr.lastResult ||
          prev.showingResult != curr.showingResult,
      builder: (context, state) {
        if (!state.showingResult) return const SizedBox.shrink();
        final result = state.lastResult;
        if (result is! CalculationResultError) return const SizedBox.shrink();

        final colorScheme = Theme.of(context).colorScheme;
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          color: colorScheme.errorContainer,
          child: Row(
            children: [
              Icon(Icons.error_outline, size: 16, color: colorScheme.error),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  result.message,
                  style: TextStyle(color: colorScheme.error, fontSize: 13),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
