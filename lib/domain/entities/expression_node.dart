import 'package:freezed_annotation/freezed_annotation.dart';

part 'expression_node.freezed.dart';

typedef NodeId = String;

enum ConstantType {
  pi,
  e;

  String get symbol => switch (this) {
        ConstantType.pi => 'π',
        ConstantType.e => 'e',
      };
}

enum OperatorType {
  add,
  subtract,
  multiply,
  divide,
  modulo;

  String get symbol => switch (this) {
        OperatorType.add => '+',
        OperatorType.subtract => '−',
        OperatorType.multiply => '×',
        OperatorType.divide => '÷',
        OperatorType.modulo => 'mod',
      };

  int get precedence => switch (this) {
        OperatorType.add || OperatorType.subtract => 1,
        OperatorType.multiply ||
        OperatorType.divide ||
        OperatorType.modulo =>
          2,
      };
}

enum UnaryOperatorType {
  negate,
  absoluteValue;

  String get symbol => switch (this) {
        UnaryOperatorType.negate => '−',
        UnaryOperatorType.absoluteValue => '|x|',
      };
}

enum TrigFunctionType {
  sin,
  cos,
  tan,
  asin,
  acos,
  atan,
  sinh,
  cosh,
  tanh,
  asinh,
  acosh,
  atanh;

  String get name => switch (this) {
        TrigFunctionType.sin => 'sin',
        TrigFunctionType.cos => 'cos',
        TrigFunctionType.tan => 'tan',
        TrigFunctionType.asin => 'sin⁻¹',
        TrigFunctionType.acos => 'cos⁻¹',
        TrigFunctionType.atan => 'tan⁻¹',
        TrigFunctionType.sinh => 'sinh',
        TrigFunctionType.cosh => 'cosh',
        TrigFunctionType.tanh => 'tanh',
        TrigFunctionType.asinh => 'sinh⁻¹',
        TrigFunctionType.acosh => 'cosh⁻¹',
        TrigFunctionType.atanh => 'tanh⁻¹',
      };

  bool get isHyperbolic => switch (this) {
        TrigFunctionType.sinh ||
        TrigFunctionType.cosh ||
        TrigFunctionType.tanh ||
        TrigFunctionType.asinh ||
        TrigFunctionType.acosh ||
        TrigFunctionType.atanh =>
          true,
        _ => false,
      };
}

enum LogType {
  natural,
  base10,
  arbitraryBase;

  String get label => switch (this) {
        LogType.natural => 'ln',
        LogType.base10 => 'log',
        LogType.arbitraryBase => 'log',
      };
}

@freezed
sealed class ExpressionNode with _$ExpressionNode {
  const factory ExpressionNode.placeholder({
    required NodeId id,
  }) = PlaceholderNode;

  const factory ExpressionNode.number({
    required NodeId id,
    required String raw,
  }) = NumberNode;

  const factory ExpressionNode.constant({
    required NodeId id,
    required ConstantType constant,
  }) = ConstantNode;

  const factory ExpressionNode.binaryOp({
    required NodeId id,
    required OperatorType op,
    required ExpressionNode left,
    required ExpressionNode right,
  }) = BinaryOpNode;

  const factory ExpressionNode.unaryOp({
    required NodeId id,
    required UnaryOperatorType op,
    required ExpressionNode operand,
  }) = UnaryOpNode;

  const factory ExpressionNode.fraction({
    required NodeId id,
    required ExpressionNode numerator,
    required ExpressionNode denominator,
  }) = FractionNode;

  const factory ExpressionNode.root({
    required NodeId id,
    required ExpressionNode radicand,
    ExpressionNode? index,
  }) = RootNode;

  const factory ExpressionNode.power({
    required NodeId id,
    required ExpressionNode base,
    required ExpressionNode exponent,
  }) = PowerNode;

  const factory ExpressionNode.trigFunction({
    required NodeId id,
    required TrigFunctionType func,
    required ExpressionNode argument,
  }) = TrigFunctionNode;

  const factory ExpressionNode.logFunction({
    required NodeId id,
    required LogType logType,
    required ExpressionNode argument,
    ExpressionNode? base,
  }) = LogFunctionNode;

  const factory ExpressionNode.parenthesized({
    required NodeId id,
    required ExpressionNode inner,
  }) = ParenthesizedNode;
}
