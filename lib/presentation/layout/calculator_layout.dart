import 'package:flutter/material.dart';

import '../../core/constants/app_constants.dart';
import 'expression_panel.dart';
import 'history_panel.dart';
import 'keypad_panel.dart';

class CalculatorLayout extends StatelessWidget {
  const CalculatorLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= AppConstants.wideLayoutBreakpoint) {
          return _WideLayout();
        }
        return _PortraitLayout();
      },
    );
  }
}

class _PortraitLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ExpressionPanel(),
        Expanded(child: KeypadPanel()),
      ],
    );
  }
}

class _WideLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: AppConstants.historyPanelWidth,
          child: const HistoryPanel(),
        ),
        const Expanded(
          child: Column(
            children: [
              ExpressionPanel(),
              Expanded(child: KeypadPanel()),
            ],
          ),
        ),
      ],
    );
  }
}
