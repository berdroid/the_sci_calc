import 'package:flutter/material.dart';

import '../../domain/entities/expression_node.dart';
import 'cursor_caret.dart';

class PlaceholderBox extends StatelessWidget {
  const PlaceholderBox({
    super.key,
    required this.node,
    required this.isFocused,
    required this.onTap,
    this.fontSize = 24.0,
  });

  final PlaceholderNode node;
  final bool isFocused;
  final VoidCallback onTap;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final unfocusedColor = isDark
        ? const Color(0xFF1A3A5C)
        : const Color(0xFFBBDEFB);
    final focusedColor = colorScheme.primary;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: fontSize * 1.2,
        height: fontSize * 1.4,
        decoration: BoxDecoration(
          color: isFocused ? focusedColor.withValues(alpha: 0.3) : unfocusedColor,
          border: Border.all(
            color: isFocused ? focusedColor : unfocusedColor,
            width: isFocused ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: isFocused
            ? Center(
                child: CursorCaret(height: fontSize, color: focusedColor),
              )
            : null,
      ),
    );
  }
}
