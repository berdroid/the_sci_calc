import 'package:flutter/material.dart';

import '../../application/calculator/calculator_cubit.dart';
import '../../domain/entities/cursor_position.dart';
import '../../domain/entities/expression_node.dart';
import 'cursor_caret.dart';
import 'placeholder_box.dart';

/// Recursively renders an [ExpressionNode] as a Widget tree.
class NodeRenderer extends StatelessWidget {
  const NodeRenderer({
    super.key,
    required this.node,
    required this.cubit,
    required this.cursor,
    this.fontSize = 26.0,
    this.isExponent = false,
  });

  final ExpressionNode node;
  final CalculatorCubit cubit;
  final CursorPosition? cursor;
  final double fontSize;
  final bool isExponent;

  @override
  Widget build(BuildContext context) {
    return switch (node) {
      PlaceholderNode() => _buildPlaceholder(context),
      NumberNode() => _buildNumber(context),
      ConstantNode() => _buildConstant(context),
      BinaryOpNode() => _buildBinaryOp(context),
      UnaryOpNode() => _buildUnaryOp(context),
      FractionNode() => _buildFraction(context),
      RootNode() => _buildRoot(context),
      PowerNode() => _buildPower(context),
      TrigFunctionNode() => _buildTrigFunction(context),
      LogFunctionNode() => _buildLogFunction(context),
      ParenthesizedNode() => _buildParenthesized(context),
    };
  }

  bool get _isFocused => cursor != null && node.id == cursor!.focusedNodeId;

  Widget _tap({required Widget child}) {
    return GestureDetector(
      onTap: () => cubit.focusNode(node.id),
      child: child,
    );
  }

  /// Places a blinking caret before (entry, charOffset==0) or after (exit,
  /// charOffset==1) [child] when this structural node is focused.
  Widget _appendCaret(BuildContext context, Widget child) {
    if (!_isFocused) return child;
    final color = Theme.of(context).colorScheme.primary;
    final caret = CursorCaret(height: fontSize * 1.1, color: color);
    if (cursor!.charOffset == 0) {
      // Entry position: caret before the node's rendered widget.
      return Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [caret, const SizedBox(width: 1), child],
      );
    }
    // Exit position: caret after the node's rendered widget.
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [child, const SizedBox(width: 1), caret],
    );
  }

  // ── Placeholder ───────────────────────────────────────────────────────────────

  Widget _buildPlaceholder(BuildContext context) {
    return PlaceholderBox(
      node: node as PlaceholderNode,
      isFocused: _isFocused,
      onTap: () => cubit.focusNode(node.id),
      fontSize: fontSize,
    );
  }

  // ── Number ────────────────────────────────────────────────────────────────────

  Widget _buildNumber(BuildContext context) {
    final num = node as NumberNode;
    final colorScheme = Theme.of(context).colorScheme;
    final style = TextStyle(fontSize: fontSize, color: colorScheme.onSurface);

    if (_isFocused) {
      final k = cursor!.charOffset.clamp(0, num.raw.length);
      final before = num.raw.substring(0, k);
      final after = num.raw.substring(k);
      final caretColor = colorScheme.primary;
      return _tap(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (before.isNotEmpty) Text(before, style: style),
              CursorCaret(height: fontSize * 1.1, color: caretColor),
              if (after.isNotEmpty) Text(after, style: style),
            ],
          ),
        ),
      );
    }

    return _tap(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: Text(num.raw, style: style),
      ),
    );
  }

  // ── Constant ─────────────────────────────────────────────────────────────────

  Widget _buildConstant(BuildContext context) {
    final c = node as ConstantNode;
    final colorScheme = Theme.of(context).colorScheme;
    // _appendCaret handles charOffset 0 (before) and 1 (after).
    return _tap(
      child: _appendCaret(
        context,
        Text(
          c.constant.symbol,
          style: TextStyle(
            fontSize: fontSize,
            color: colorScheme.primary,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
    );
  }

  // ── Binary op ─────────────────────────────────────────────────────────────────

  Widget _buildBinaryOp(BuildContext context) {
    final bin = node as BinaryOpNode;
    final colorScheme = Theme.of(context).colorScheme;
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        NodeRenderer(
          node: bin.left,
          cubit: cubit,
          cursor: cursor,
          fontSize: fontSize,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: Text(
            bin.op.symbol,
            style: TextStyle(
              fontSize: fontSize,
              color: colorScheme.primary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        NodeRenderer(
          node: bin.right,
          cubit: cubit,
          cursor: cursor,
          fontSize: fontSize,
        ),
      ],
    );
  }

  // ── Unary op ──────────────────────────────────────────────────────────────────

  Widget _buildUnaryOp(BuildContext context) {
    final unary = node as UnaryOpNode;
    final colorScheme = Theme.of(context).colorScheme;

    if (unary.op == UnaryOperatorType.absoluteValue) {
      return _tap(
        child: _appendCaret(
          context,
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('|',
                  style:
                      TextStyle(fontSize: fontSize, color: colorScheme.onSurface)),
              NodeRenderer(
                node: unary.operand,
                cubit: cubit,
                cursor: cursor,
                fontSize: fontSize,
              ),
              Text('|',
                  style:
                      TextStyle(fontSize: fontSize, color: colorScheme.onSurface)),
            ],
          ),
        ),
      );
    }

    return _tap(
      child: _appendCaret(
        context,
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              unary.op.symbol,
              style: TextStyle(fontSize: fontSize, color: colorScheme.onSurface),
            ),
            NodeRenderer(
              node: unary.operand,
              cubit: cubit,
              cursor: cursor,
              fontSize: fontSize,
            ),
          ],
        ),
      ),
    );
  }

  // ── Fraction ──────────────────────────────────────────────────────────────────

  Widget _buildFraction(BuildContext context) {
    final frac = node as FractionNode;
    final colorScheme = Theme.of(context).colorScheme;
    final innerFontSize = fontSize * 0.85;
    return _tap(
      child: _appendCaret(
        context,
        IntrinsicWidth(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: NodeRenderer(
                  node: frac.numerator,
                  cubit: cubit,
                  cursor: cursor,
                  fontSize: innerFontSize,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Container(
                  height: 1.5,
                  constraints: const BoxConstraints(minWidth: 20),
                  color: colorScheme.onSurface,
                ),
              ),
              Center(
                child: NodeRenderer(
                  node: frac.denominator,
                  cubit: cubit,
                  cursor: cursor,
                  fontSize: innerFontSize,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ── Root ──────────────────────────────────────────────────────────────────────

  Widget _buildRoot(BuildContext context) {
    final root = node as RootNode;
    final colorScheme = Theme.of(context).colorScheme;
    final indexSize = fontSize * 0.6;
    final radicandSize = fontSize;

    return _tap(
      child: _appendCaret(
        context,
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (root.index != null)
              Padding(
                padding: EdgeInsets.only(bottom: radicandSize * 0.4),
                child: NodeRenderer(
                  node: root.index!,
                  cubit: cubit,
                  cursor: cursor,
                  fontSize: indexSize,
                ),
              ),
            CustomPaint(
              painter:
                  _RadicalPainter(color: colorScheme.onSurface, lineWidth: 1.5),
              child: Padding(
                padding: EdgeInsets.only(
                  left: fontSize * 0.6,
                  top: fontSize * 0.1,
                  right: 4,
                ),
                child: NodeRenderer(
                  node: root.radicand,
                  cubit: cubit,
                  cursor: cursor,
                  fontSize: radicandSize,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── Power ─────────────────────────────────────────────────────────────────────

  Widget _buildPower(BuildContext context) {
    final pwr = node as PowerNode;
    final expSize = fontSize * 0.65;

    return _tap(
      child: _appendCaret(
        context,
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NodeRenderer(
              node: pwr.base,
              cubit: cubit,
              cursor: cursor,
              fontSize: fontSize,
            ),
            Transform.translate(
              offset: Offset(0, -fontSize * 0.3),
              child: NodeRenderer(
                node: pwr.exponent,
                cubit: cubit,
                cursor: cursor,
                fontSize: expSize,
                isExponent: true,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── Trig function ─────────────────────────────────────────────────────────────

  Widget _buildTrigFunction(BuildContext context) {
    final trig = node as TrigFunctionNode;
    final colorScheme = Theme.of(context).colorScheme;
    return _tap(
      child: _appendCaret(
        context,
        _buildFunctionCall(
          context,
          name: trig.func.name,
          argument: trig.argument,
          nameColor: colorScheme.secondary,
        ),
      ),
    );
  }

  // ── Log function ──────────────────────────────────────────────────────────────

  Widget _buildLogFunction(BuildContext context) {
    final log = node as LogFunctionNode;
    final colorScheme = Theme.of(context).colorScheme;

    if (log.logType == LogType.arbitraryBase && log.base != null) {
      return _tap(
        child: _appendCaret(
          context,
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'log',
                style: TextStyle(
                  fontSize: fontSize,
                  color: colorScheme.secondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Transform.translate(
                offset: Offset(0, fontSize * 0.2),
                child: NodeRenderer(
                  node: log.base!,
                  cubit: cubit,
                  cursor: cursor,
                  fontSize: fontSize * 0.6,
                ),
              ),
              _buildParens(context, log.argument),
            ],
          ),
        ),
      );
    }

    return _tap(
      child: _appendCaret(
        context,
        _buildFunctionCall(
          context,
          name: log.logType.label,
          argument: log.argument,
          nameColor: colorScheme.secondary,
        ),
      ),
    );
  }

  // ── Parenthesized ─────────────────────────────────────────────────────────────

  Widget _buildParenthesized(BuildContext context) {
    final paren = node as ParenthesizedNode;
    return _tap(
      child: _appendCaret(
        context,
        _buildParens(context, paren.inner),
      ),
    );
  }

  // ── Helpers ───────────────────────────────────────────────────────────────────

  Widget _buildFunctionCall(
    BuildContext context, {
    required String name,
    required ExpressionNode argument,
    required Color nameColor,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          name,
          style: TextStyle(
            fontSize: fontSize,
            color: nameColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        _buildParens(context, argument),
      ],
    );
  }

  Widget _buildParens(BuildContext context, ExpressionNode inner) {
    final colorScheme = Theme.of(context).colorScheme;
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '(',
          style: TextStyle(fontSize: fontSize * 1.1, color: colorScheme.onSurface),
        ),
        NodeRenderer(
          node: inner,
          cubit: cubit,
          cursor: cursor,
          fontSize: fontSize,
        ),
        Text(
          ')',
          style: TextStyle(fontSize: fontSize * 1.1, color: colorScheme.onSurface),
        ),
      ],
    );
  }
}

class _RadicalPainter extends CustomPainter {
  _RadicalPainter({required this.color, required this.lineWidth});

  final Color color;
  final double lineWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = lineWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final h = size.height;
    final w = size.width;

    // Radical sign: small tick, diagonal up, horizontal bar over radicand.
    final path = Path()
      ..moveTo(0, h * 0.6)
      ..lineTo(w * 0.12, h * 0.8)
      ..lineTo(w * 0.3, 0)
      ..lineTo(w, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_RadicalPainter old) =>
      old.color != color || old.lineWidth != lineWidth;
}
