import 'package:flutter/material.dart';

import '../../application/calculator/calculator_cubit.dart';
import '../../domain/entities/expression_node.dart';
import 'placeholder_box.dart';

/// Recursively renders an [ExpressionNode] as a Widget tree.
class NodeRenderer extends StatelessWidget {
  const NodeRenderer({
    super.key,
    required this.node,
    required this.cubit,
    required this.focusedNodeId,
    this.fontSize = 26.0,
    this.isExponent = false,
  });

  final ExpressionNode node;
  final CalculatorCubit cubit;
  final String focusedNodeId;
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

  bool get _isFocused => node.id == focusedNodeId;

  Widget _tap({required Widget child}) {
    return GestureDetector(
      onTap: () => cubit.focusNode(node.id),
      child: child,
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

    return _tap(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        decoration: _isFocused
            ? BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: colorScheme.primary, width: 2),
                ),
              )
            : null,
        child: Text(
          num.raw,
          style: TextStyle(fontSize: fontSize, color: colorScheme.onSurface),
        ),
      ),
    );
  }

  // ── Constant ─────────────────────────────────────────────────────────────────

  Widget _buildConstant(BuildContext context) {
    final c = node as ConstantNode;
    final colorScheme = Theme.of(context).colorScheme;
    return _tap(
      child: Text(
        c.constant.symbol,
        style: TextStyle(
          fontSize: fontSize,
          color: colorScheme.primary,
          fontStyle: FontStyle.italic,
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
          focusedNodeId: focusedNodeId,
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
          focusedNodeId: focusedNodeId,
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
      return Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('|',
              style: TextStyle(fontSize: fontSize, color: colorScheme.onSurface)),
          NodeRenderer(
            node: unary.operand,
            cubit: cubit,
            focusedNodeId: focusedNodeId,
            fontSize: fontSize,
          ),
          Text('|',
              style: TextStyle(fontSize: fontSize, color: colorScheme.onSurface)),
        ],
      );
    }

    return Row(
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
          focusedNodeId: focusedNodeId,
          fontSize: fontSize,
        ),
      ],
    );
  }

  // ── Fraction ──────────────────────────────────────────────────────────────────

  Widget _buildFraction(BuildContext context) {
    final frac = node as FractionNode;
    final colorScheme = Theme.of(context).colorScheme;
    final innerFontSize = fontSize * 0.85;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        NodeRenderer(
          node: frac.numerator,
          cubit: cubit,
          focusedNodeId: focusedNodeId,
          fontSize: innerFontSize,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: Container(
            height: 1.5,
            width: double.infinity,
            constraints: const BoxConstraints(minWidth: 20),
            color: colorScheme.onSurface,
          ),
        ),
        NodeRenderer(
          node: frac.denominator,
          cubit: cubit,
          focusedNodeId: focusedNodeId,
          fontSize: innerFontSize,
        ),
      ],
    );
  }

  // ── Root ──────────────────────────────────────────────────────────────────────

  Widget _buildRoot(BuildContext context) {
    final root = node as RootNode;
    final colorScheme = Theme.of(context).colorScheme;
    final indexSize = fontSize * 0.6;
    final radicandSize = fontSize;

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (root.index != null)
          Padding(
            padding: EdgeInsets.only(bottom: radicandSize * 0.4),
            child: NodeRenderer(
              node: root.index!,
              cubit: cubit,
              focusedNodeId: focusedNodeId,
              fontSize: indexSize,
            ),
          ),
        CustomPaint(
          painter: _RadicalPainter(color: colorScheme.onSurface, lineWidth: 1.5),
          child: Padding(
            padding: EdgeInsets.only(
              left: fontSize * 0.6,
              top: fontSize * 0.1,
              right: 4,
            ),
            child: NodeRenderer(
              node: root.radicand,
              cubit: cubit,
              focusedNodeId: focusedNodeId,
              fontSize: radicandSize,
            ),
          ),
        ),
      ],
    );
  }

  // ── Power ─────────────────────────────────────────────────────────────────────

  Widget _buildPower(BuildContext context) {
    final pwr = node as PowerNode;
    final expSize = fontSize * 0.65;

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        NodeRenderer(
          node: pwr.base,
          cubit: cubit,
          focusedNodeId: focusedNodeId,
          fontSize: fontSize,
        ),
        Transform.translate(
          offset: Offset(0, -fontSize * 0.3),
          child: NodeRenderer(
            node: pwr.exponent,
            cubit: cubit,
            focusedNodeId: focusedNodeId,
            fontSize: expSize,
            isExponent: true,
          ),
        ),
      ],
    );
  }

  // ── Trig function ─────────────────────────────────────────────────────────────

  Widget _buildTrigFunction(BuildContext context) {
    final trig = node as TrigFunctionNode;
    final colorScheme = Theme.of(context).colorScheme;
    return _buildFunctionCall(
      context,
      name: trig.func.name,
      argument: trig.argument,
      nameColor: colorScheme.secondary,
    );
  }

  // ── Log function ──────────────────────────────────────────────────────────────

  Widget _buildLogFunction(BuildContext context) {
    final log = node as LogFunctionNode;
    final colorScheme = Theme.of(context).colorScheme;

    if (log.logType == LogType.arbitraryBase && log.base != null) {
      // log_base(argument)
      return Row(
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
              focusedNodeId: focusedNodeId,
              fontSize: fontSize * 0.6,
            ),
          ),
          _buildParens(context, log.argument),
        ],
      );
    }

    return _buildFunctionCall(
      context,
      name: log.logType.label,
      argument: log.argument,
      nameColor: colorScheme.secondary,
    );
  }

  // ── Parenthesized ─────────────────────────────────────────────────────────────

  Widget _buildParenthesized(BuildContext context) {
    final paren = node as ParenthesizedNode;
    return _buildParens(context, paren.inner);
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
          focusedNodeId: focusedNodeId,
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
