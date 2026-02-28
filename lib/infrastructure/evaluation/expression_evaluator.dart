import 'dart:math' as math;

import 'package:rational/rational.dart';

import '../../core/errors/calculator_failure.dart';
import '../../core/utils/high_precision_math.dart';
import '../../domain/entities/calculation_result.dart';
import '../../domain/entities/expression_node.dart';
import '../../domain/enums/angle_unit.dart';

/// Recursive post-order AST visitor that produces a [CalculationResult].
class ExpressionEvaluator {
  const ExpressionEvaluator();

  CalculationResult evaluate(ExpressionNode root, AngleUnit angleUnit) {
    try {
      final result = _eval(root, angleUnit);
      return result;
    } on EvaluationException catch (e) {
      return CalculationResult.error(
        message: e.message,
        culpritNodeId: e.nodeId,
      );
    } catch (e) {
      return CalculationResult.error(message: e.toString());
    }
  }

  CalculationResult _eval(ExpressionNode node, AngleUnit angleUnit) {
    return switch (node) {
      PlaceholderNode(:final id) => throw EvaluationException(
          'Missing value',
          nodeId: id,
        ),
      NumberNode(:final raw) => _evalNumber(raw),
      ConstantNode(:final constant) => _evalConstant(constant),
      BinaryOpNode(
        :final id,
        :final op,
        :final left,
        :final right,
      ) =>
        _evalBinaryOp(id, op, left, right, angleUnit),
      UnaryOpNode(:final op, :final operand) =>
        _evalUnaryOp(op, operand, angleUnit),
      FractionNode(:final id, :final numerator, :final denominator) =>
        _evalFraction(id, numerator, denominator, angleUnit),
      RootNode(:final id, :final radicand, :final index) =>
        _evalRoot(id, radicand, index, angleUnit),
      PowerNode(:final id, :final base, :final exponent) =>
        _evalPower(id, base, exponent, angleUnit),
      TrigFunctionNode(:final func, :final argument) =>
        _evalTrig(func, argument, angleUnit),
      LogFunctionNode(:final logType, :final argument, :final base) =>
        _evalLog(logType, argument, base, angleUnit),
      ParenthesizedNode(:final inner) => _eval(inner, angleUnit),
    };
  }

  // ── Number ──────────────────────────────────────────────────────────────────

  CalculationResult _evalNumber(String raw) {
    if (raw.isEmpty) {
      throw const EvaluationException('Empty number');
    }
    final value = double.tryParse(raw);
    if (value == null) {
      throw EvaluationException('Invalid number: $raw');
    }
    // Try to build exact rational if the string is an integer or simple decimal.
    final exact = _tryExactRational(raw);
    return CalculationResult.value(exact: exact, value: value);
  }

  Rational? _tryExactRational(String raw) {
    try {
      // Handle negative sign
      final normalized = raw.replaceAll('−', '-');
      if (normalized.contains('.')) {
        final parts = normalized.split('.');
        final whole = parts[0];
        final fraction = parts[1];
        final denomExp = math.pow(10, fraction.length).toInt();
        final numeratorStr = '$whole$fraction'.replaceAll('-', '');
        final numerator = BigInt.parse(numeratorStr);
        final denom = BigInt.from(denomExp);
        final sign = normalized.startsWith('-') ? BigInt.from(-1) : BigInt.one;
        final r = Rational(sign * numerator, denom);
        return r;
      } else {
        final n = BigInt.tryParse(normalized);
        if (n != null) return Rational(n, BigInt.one);
      }
    } catch (_) {
      // fall through
    }
    return null;
  }

  // ── Constant ─────────────────────────────────────────────────────────────────

  CalculationResult _evalConstant(ConstantType constant) {
    final value = switch (constant) {
      ConstantType.pi => math.pi,
      ConstantType.e => math.e,
    };
    return CalculationResult.value(value: value);
  }

  // ── Binary op ────────────────────────────────────────────────────────────────

  CalculationResult _evalBinaryOp(
    NodeId id,
    OperatorType op,
    ExpressionNode left,
    ExpressionNode right,
    AngleUnit angleUnit,
  ) {
    final l = _evalOrThrow(left, angleUnit);
    final r = _evalOrThrow(right, angleUnit);

    final lExact = l.exact;
    final rExact = r.exact;
    final lVal = l.value;
    final rVal = r.value;

    switch (op) {
      case OperatorType.add:
        final value = lVal + rVal;
        final exact = lExact != null && rExact != null
            ? lExact + rExact
            : null;
        return CalculationResult.value(exact: exact, value: value);

      case OperatorType.subtract:
        final value = lVal - rVal;
        final exact = lExact != null && rExact != null
            ? lExact - rExact
            : null;
        return CalculationResult.value(exact: exact, value: value);

      case OperatorType.multiply:
        final value = lVal * rVal;
        final exact = lExact != null && rExact != null
            ? lExact * rExact
            : null;
        return CalculationResult.value(exact: exact, value: value);

      case OperatorType.divide:
        if (rVal == 0) {
          throw EvaluationException('Division by zero', nodeId: id);
        }
        final value = lVal / rVal;
        final exact = lExact != null && rExact != null
            ? lExact / rExact
            : null;
        return CalculationResult.value(exact: exact, value: value);

      case OperatorType.modulo:
        if (rVal == 0) {
          throw EvaluationException('Modulo by zero', nodeId: id);
        }
        final value = lVal % rVal;
        return CalculationResult.value(value: value);
    }
  }

  // ── Unary op ─────────────────────────────────────────────────────────────────

  CalculationResult _evalUnaryOp(
    UnaryOperatorType op,
    ExpressionNode operand,
    AngleUnit angleUnit,
  ) {
    final v = _evalOrThrow(operand, angleUnit);
    return switch (op) {
      UnaryOperatorType.negate => CalculationResult.value(
          exact: v.exact != null ? -v.exact! : null,
          value: -v.value,
        ),
      UnaryOperatorType.absoluteValue => CalculationResult.value(
          exact: v.exact?.abs(),
          value: v.value.abs(),
        ),
    };
  }

  // ── Fraction ─────────────────────────────────────────────────────────────────

  CalculationResult _evalFraction(
    NodeId id,
    ExpressionNode numerator,
    ExpressionNode denominator,
    AngleUnit angleUnit,
  ) {
    final num = _evalOrThrow(numerator, angleUnit);
    final den = _evalOrThrow(denominator, angleUnit);

    if (den.value == 0) {
      throw EvaluationException('Division by zero', nodeId: id);
    }

    final value = num.value / den.value;
    final exact = num.exact != null && den.exact != null
        ? num.exact! / den.exact!
        : null;
    return CalculationResult.value(exact: exact, value: value);
  }

  // ── Root ─────────────────────────────────────────────────────────────────────

  CalculationResult _evalRoot(
    NodeId id,
    ExpressionNode radicand,
    ExpressionNode? index,
    AngleUnit angleUnit,
  ) {
    final rad = _evalOrThrow(radicand, angleUnit);

    if (index == null) {
      // Square root
      if (rad.value < 0) {
        throw EvaluationException(
          'Square root of negative number',
          nodeId: id,
        );
      }
      return CalculationResult.value(value: math.sqrt(rad.value));
    }

    final idx = _evalOrThrow(index, angleUnit);
    if (idx.value == 0) {
      throw EvaluationException('Root index cannot be zero', nodeId: id);
    }

    final value = HighPrecisionMath.nthRoot(rad.value, idx.value);
    if (value.isNaN) {
      throw EvaluationException('Root of negative number', nodeId: id);
    }
    return CalculationResult.value(value: value);
  }

  // ── Power ─────────────────────────────────────────────────────────────────────

  CalculationResult _evalPower(
    NodeId id,
    ExpressionNode base,
    ExpressionNode exponent,
    AngleUnit angleUnit,
  ) {
    final b = _evalOrThrow(base, angleUnit);
    final exp = _evalOrThrow(exponent, angleUnit);

    // Exact integer power via rational
    Rational? exact;
    if (b.exact != null && exp.exact != null) {
      final expRat = exp.exact!;
      if (expRat.denominator == BigInt.one) {
        final expInt = expRat.numerator.toInt();
        if (expInt >= 0 && expInt <= 100) {
          exact = _rationalIntPow(b.exact!, expInt);
        }
      }
    }

    final value = math.pow(b.value, exp.value).toDouble();
    if (value.isNaN) {
      throw EvaluationException('Invalid power operation', nodeId: id);
    }
    return CalculationResult.value(exact: exact, value: value);
  }

  Rational _rationalIntPow(Rational base, int exp) {
    if (exp == 0) return Rational(BigInt.one, BigInt.one);
    Rational result = Rational(BigInt.one, BigInt.one);
    for (int i = 0; i < exp; i++) {
      result = result * base;
    }
    return result;
  }

  // ── Trig ─────────────────────────────────────────────────────────────────────

  CalculationResult _evalTrig(
    TrigFunctionType func,
    ExpressionNode argument,
    AngleUnit angleUnit,
  ) {
    final arg = _evalOrThrow(argument, angleUnit);
    final value = switch (func) {
      TrigFunctionType.sin => HighPrecisionMath.sin(arg.value, angleUnit),
      TrigFunctionType.cos => HighPrecisionMath.cos(arg.value, angleUnit),
      TrigFunctionType.tan => HighPrecisionMath.tan(arg.value, angleUnit),
      TrigFunctionType.asin => HighPrecisionMath.asin(arg.value, angleUnit),
      TrigFunctionType.acos => HighPrecisionMath.acos(arg.value, angleUnit),
      TrigFunctionType.atan => HighPrecisionMath.atan(arg.value, angleUnit),
      TrigFunctionType.sinh => HighPrecisionMath.sinh(arg.value),
      TrigFunctionType.cosh => HighPrecisionMath.cosh(arg.value),
      TrigFunctionType.tanh => HighPrecisionMath.tanh(arg.value),
      TrigFunctionType.asinh => HighPrecisionMath.asinh(arg.value),
      TrigFunctionType.acosh => HighPrecisionMath.acosh(arg.value),
      TrigFunctionType.atanh => HighPrecisionMath.atanh(arg.value),
    };
    if (value.isNaN || value.isInfinite) {
      throw EvaluationException('Domain error for ${func.name}');
    }
    return CalculationResult.value(value: value);
  }

  // ── Log ──────────────────────────────────────────────────────────────────────

  CalculationResult _evalLog(
    LogType logType,
    ExpressionNode argument,
    ExpressionNode? base,
    AngleUnit angleUnit,
  ) {
    final arg = _evalOrThrow(argument, angleUnit);
    if (arg.value <= 0) {
      throw EvaluationException('Logarithm of non-positive number');
    }

    final value = switch (logType) {
      LogType.natural => HighPrecisionMath.ln(arg.value),
      LogType.base10 => HighPrecisionMath.log10(arg.value),
      LogType.arbitraryBase => () {
          if (base == null) {
            throw const EvaluationException('Missing logarithm base');
          }
          final b = _evalOrThrow(base, angleUnit);
          if (b.value <= 0 || b.value == 1) {
            throw const EvaluationException('Invalid logarithm base');
          }
          return HighPrecisionMath.logBase(arg.value, b.value);
        }(),
    };

    return CalculationResult.value(value: value);
  }

  // ── Helpers ──────────────────────────────────────────────────────────────────

  CalculationResultValue _evalOrThrow(ExpressionNode node, AngleUnit unit) {
    final result = _eval(node, unit);
    return switch (result) {
      CalculationResultValue() => result,
      CalculationResultError(:final message, :final culpritNodeId) =>
        throw EvaluationException(message, nodeId: culpritNodeId),
    };
  }
}
