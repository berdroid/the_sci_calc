import 'package:uuid/uuid.dart';

import '../../domain/entities/expression_node.dart';

/// Manual JSON serialization for the expression AST.
/// Uses a type-discriminator field to support the recursive tree structure.
class ExpressionMapper {
  const ExpressionMapper();

  static const _uuid = Uuid();

  Map<String, dynamic> nodeToJson(ExpressionNode node) {
    return switch (node) {
      PlaceholderNode(:final id) => {'type': 'placeholder', 'id': id},
      NumberNode(:final id, :final raw) => {
          'type': 'number',
          'id': id,
          'raw': raw,
        },
      ConstantNode(:final id, :final constant) => {
          'type': 'constant',
          'id': id,
          'constant': constant.name,
        },
      BinaryOpNode(:final id, :final op, :final left, :final right) => {
          'type': 'binaryOp',
          'id': id,
          'op': op.name,
          'left': nodeToJson(left),
          'right': nodeToJson(right),
        },
      UnaryOpNode(:final id, :final op, :final operand) => {
          'type': 'unaryOp',
          'id': id,
          'op': op.name,
          'operand': nodeToJson(operand),
        },
      FractionNode(:final id, :final numerator, :final denominator) => {
          'type': 'fraction',
          'id': id,
          'numerator': nodeToJson(numerator),
          'denominator': nodeToJson(denominator),
        },
      RootNode(:final id, :final radicand, :final index) => {
          'type': 'root',
          'id': id,
          'radicand': nodeToJson(radicand),
          if (index != null) 'index': nodeToJson(index),
        },
      PowerNode(:final id, :final base, :final exponent) => {
          'type': 'power',
          'id': id,
          'base': nodeToJson(base),
          'exponent': nodeToJson(exponent),
        },
      TrigFunctionNode(:final id, :final func, :final argument) => {
          'type': 'trigFunction',
          'id': id,
          'func': func.name,
          'argument': nodeToJson(argument),
        },
      LogFunctionNode(:final id, :final logType, :final argument, :final base) => {
          'type': 'logFunction',
          'id': id,
          'logType': logType.name,
          'argument': nodeToJson(argument),
          if (base != null) 'base': nodeToJson(base),
        },
      ParenthesizedNode(:final id, :final inner) => {
          'type': 'parenthesized',
          'id': id,
          'inner': nodeToJson(inner),
        },
    };
  }

  ExpressionNode nodeFromJson(Map<String, dynamic> json) {
    final type = json['type'] as String;
    final id = (json['id'] as String?) ?? _uuid.v4();

    return switch (type) {
      'placeholder' => ExpressionNode.placeholder(id: id),
      'number' => ExpressionNode.number(
          id: id,
          raw: json['raw'] as String,
        ),
      'constant' => ExpressionNode.constant(
          id: id,
          constant: ConstantType.values.byName(json['constant'] as String),
        ),
      'binaryOp' => ExpressionNode.binaryOp(
          id: id,
          op: OperatorType.values.byName(json['op'] as String),
          left: nodeFromJson(json['left'] as Map<String, dynamic>),
          right: nodeFromJson(json['right'] as Map<String, dynamic>),
        ),
      'unaryOp' => ExpressionNode.unaryOp(
          id: id,
          op: UnaryOperatorType.values.byName(json['op'] as String),
          operand: nodeFromJson(json['operand'] as Map<String, dynamic>),
        ),
      'fraction' => ExpressionNode.fraction(
          id: id,
          numerator: nodeFromJson(json['numerator'] as Map<String, dynamic>),
          denominator: nodeFromJson(json['denominator'] as Map<String, dynamic>),
        ),
      'root' => ExpressionNode.root(
          id: id,
          radicand: nodeFromJson(json['radicand'] as Map<String, dynamic>),
          index: json['index'] != null
              ? nodeFromJson(json['index'] as Map<String, dynamic>)
              : null,
        ),
      'power' => ExpressionNode.power(
          id: id,
          base: nodeFromJson(json['base'] as Map<String, dynamic>),
          exponent: nodeFromJson(json['exponent'] as Map<String, dynamic>),
        ),
      'trigFunction' => ExpressionNode.trigFunction(
          id: id,
          func: TrigFunctionType.values.byName(json['func'] as String),
          argument: nodeFromJson(json['argument'] as Map<String, dynamic>),
        ),
      'logFunction' => ExpressionNode.logFunction(
          id: id,
          logType: LogType.values.byName(json['logType'] as String),
          argument: nodeFromJson(json['argument'] as Map<String, dynamic>),
          base: json['base'] != null
              ? nodeFromJson(json['base'] as Map<String, dynamic>)
              : null,
        ),
      'parenthesized' => ExpressionNode.parenthesized(
          id: id,
          inner: nodeFromJson(json['inner'] as Map<String, dynamic>),
        ),
      _ => ExpressionNode.placeholder(id: id),
    };
  }
}
