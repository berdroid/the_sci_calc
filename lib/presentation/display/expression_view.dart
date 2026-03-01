import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/calculator/calculator_cubit.dart';
import '../../application/calculator/calculator_state.dart';
import '../../domain/entities/expression_node.dart';
import 'node_renderer.dart';

class ExpressionView extends StatefulWidget {
  const ExpressionView({super.key});

  @override
  State<ExpressionView> createState() => _ExpressionViewState();
}

class _ExpressionViewState extends State<ExpressionView> {
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculatorCubit, CalculatorState>(
      builder: (context, state) {
        final cubit = context.read<CalculatorCubit>();
        final cursor = state.showingResult ? null : state.cursor;

        return LayoutBuilder(
          builder: (context, constraints) {
            // Vertical padding in SingleChildScrollView: 12 top + 12 bottom.
            // An extra 3 px safety margin absorbs sub-pixel rounding in Flutter's
            // layout engine, which can otherwise cause ~1 px bottom overflow.
            const verticalPadding = 24.0 + 3.0;
            final availableH = constraints.maxHeight - verticalPadding;
            final fontSize = _computeFontSize(state.expressionRoot, availableH);

            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              controller: _scrollController,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Center(
                child: NodeRenderer(
                  node: state.expressionRoot,
                  cubit: cubit,
                  cursor: cursor,
                  fontSize: fontSize,
                ),
              ),
            );
          },
        );
      },
    );
  }

  // ── Font-size computation ─────────────────────────────────────────────────

  static const _baseFontSize = 26.0;
  static const _minFontSize = 10.0;

  /// Returns the largest font size ≤ [_baseFontSize] at which the expression's
  /// estimated height fits within [availableHeight].
  ///
  /// Iterates up to 5 times because fixed-size elements (divider bars, padding)
  /// make the height estimate slightly non-linear in font size.
  static double _computeFontSize(ExpressionNode root, double availableHeight) {
    if (availableHeight <= 0) return _baseFontSize;
    var fontSize = _baseFontSize;
    for (int i = 0; i < 5; i++) {
      final h = _estimateHeight(root, fontSize);
      if (h <= availableHeight) break;
      final next =
          (fontSize * availableHeight / h).clamp(_minFontSize, _baseFontSize);
      if ((next - fontSize).abs() < 0.1) {
        fontSize = next;
        break;
      }
      fontSize = next;
    }
    return fontSize;
  }

  /// Estimates the rendered height (in logical pixels) of [node] at [fontSize].
  ///
  /// Uses a line-height factor of 1.4 for leaf nodes and accounts for the
  /// structural overhead of fractions and raised exponents.
  static double _estimateHeight(ExpressionNode node, double fontSize) {
    return switch (node) {
      // ── Fraction: two stacked slots separated by a divider bar ─────────────
      FractionNode(:final numerator, :final denominator) =>
        _estimateHeight(numerator, fontSize * 0.85) +
            _estimateHeight(denominator, fontSize * 0.85) +
            5.5, // 1.5px bar + 2px padding top + 2px padding bottom

      // ── Power: base + exponent raised by 30% of fontSize ──────────────────
      PowerNode(:final base, :final exponent) =>
        _estimateHeight(base, fontSize) +
            (_estimateHeight(exponent, fontSize * 0.65) -
                    fontSize * 0.65 * 1.4 * 0.7)
                .clamp(0, double.infinity),

      // ── Root: radicand + small overhead for the radical cap ────────────────
      RootNode(:final radicand) =>
        _estimateHeight(radicand, fontSize) + fontSize * 0.15,

      // ── Binary: height = taller operand ────────────────────────────────────
      BinaryOpNode(:final left, :final right) =>
        max(_estimateHeight(left, fontSize), _estimateHeight(right, fontSize)),

      // ── Transparent wrappers ───────────────────────────────────────────────
      UnaryOpNode(:final operand) => _estimateHeight(operand, fontSize),
      TrigFunctionNode(:final argument) => _estimateHeight(argument, fontSize),
      LogFunctionNode(:final argument) => _estimateHeight(argument, fontSize),
      ParenthesizedNode(:final inner) => _estimateHeight(inner, fontSize),

      // ── Leaves ─────────────────────────────────────────────────────────────
      _ => fontSize * 1.4,
    };
  }
}
