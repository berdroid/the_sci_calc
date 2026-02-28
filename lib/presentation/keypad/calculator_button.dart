import 'package:flutter/material.dart';

import 'button_definitions.dart' as defs;

class CalculatorButton extends StatelessWidget {
  const CalculatorButton({
    super.key,
    required this.definition,
    required this.onPressed,
  });

  final defs.ButtonDefinition definition;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final (bg, fg) = switch (definition.style) {
      defs.ButtonStyle.digit => (
          isDark ? const Color(0xFF424242) : const Color(0xFFEEEEEE),
          colorScheme.onSurface,
        ),
      defs.ButtonStyle.operator => (
          colorScheme.primary,
          colorScheme.onPrimary,
        ),
      defs.ButtonStyle.function => (
          isDark ? const Color(0xFF37474F) : const Color(0xFF455A64),
          Colors.white,
        ),
      defs.ButtonStyle.equals => (
          colorScheme.primary,
          colorScheme.onPrimary,
        ),
      defs.ButtonStyle.utility => (
          isDark ? const Color(0xFF616161) : const Color(0xFFBDBDBD),
          colorScheme.onSurface,
        ),
      defs.ButtonStyle.navigation => (
          isDark ? const Color(0xFF546E7A) : const Color(0xFF78909C),
          Colors.white,
        ),
    };

    final fontSize = definition.style == defs.ButtonStyle.equals ? 24.0 : 16.0;

    return Padding(
      padding: const EdgeInsets.all(2),
      child: Material(
        color: bg,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: onPressed,
          splashColor: fg.withValues(alpha: 0.2),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              child: Text(
                definition.label,
                style: TextStyle(
                  fontSize: fontSize,
                  color: fg,
                  fontWeight: definition.style == defs.ButtonStyle.equals
                      ? FontWeight.w600
                      : FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
