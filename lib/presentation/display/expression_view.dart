import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/calculator/calculator_cubit.dart';
import '../../application/calculator/calculator_state.dart';
import 'node_renderer.dart';

class ExpressionView extends StatelessWidget {
  const ExpressionView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculatorCubit, CalculatorState>(
      builder: (context, state) {
        final cubit = context.read<CalculatorCubit>();
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Center(
            child: NodeRenderer(
              node: state.expressionRoot,
              cubit: cubit,
              cursor: state.showingResult ? null : state.cursor,
              fontSize: 26,
            ),
          ),
        );
      },
    );
  }
}
