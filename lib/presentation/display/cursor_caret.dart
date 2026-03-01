import 'package:flutter/material.dart';

/// A blinking 1.5 px-wide vertical cursor caret.
class CursorCaret extends StatefulWidget {
  const CursorCaret({super.key, required this.height, required this.color});

  final double height;
  final Color color;

  @override
  State<CursorCaret> createState() => _CursorCaretState();
}

class _CursorCaretState extends State<CursorCaret>
    with SingleTickerProviderStateMixin {
  late final AnimationController _blink;

  @override
  void initState() {
    super.initState();
    _blink = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 530),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _blink.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _blink,
      builder: (_, _) => Opacity(
        opacity: _blink.value >= 0.5 ? 1.0 : 0.0,
        child: SizedBox(
          width: 1.5,
          height: widget.height,
          child: ColoredBox(color: widget.color),
        ),
      ),
    );
  }
}
