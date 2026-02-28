import 'package:flutter/material.dart';

import '../display/error_display.dart';
import '../display/expression_view.dart';
import '../display/result_display.dart';
import '../widgets/toggle_button_row.dart';

class ExpressionPanel extends StatelessWidget {
  const ExpressionPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? const Color(0xFF303030)
            : Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Toggle bar — scrollable so it never overflows on narrow widths.
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: Row(
              children: [
                const AngleUnitToggle(),
                const SizedBox(width: 16),
                const DisplayFormatToggle(),
              ],
            ),
          ),
          const Divider(height: 1),
          // Expression (scrollable)
          SizedBox(
            height: 80,
            child: const ExpressionView(),
          ),
          // Result
          const ResultDisplay(),
          // Error strip
          const ErrorDisplay(),
        ],
      ),
    );
  }
}
