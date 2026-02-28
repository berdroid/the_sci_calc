import 'dart:math' as math;

import '../../domain/enums/angle_unit.dart';

/// Stateless facade over dart:math transcendentals.
/// Handles angle-unit conversion so the evaluator doesn't need to.
class HighPrecisionMath {
  const HighPrecisionMath._();

  // ── Angle conversion ────────────────────────────────────────────────────────

  static double toRadians(double value, AngleUnit unit) {
    return switch (unit) {
      AngleUnit.radians => value,
      AngleUnit.degrees => value * math.pi / 180.0,
      AngleUnit.gons => value * math.pi / 200.0,
    };
  }

  static double fromRadians(double radians, AngleUnit unit) {
    return switch (unit) {
      AngleUnit.radians => radians,
      AngleUnit.degrees => radians * 180.0 / math.pi,
      AngleUnit.gons => radians * 200.0 / math.pi,
    };
  }

  // ── Trigonometric functions ─────────────────────────────────────────────────

  static double sin(double value, AngleUnit unit) =>
      math.sin(toRadians(value, unit));

  static double cos(double value, AngleUnit unit) =>
      math.cos(toRadians(value, unit));

  static double tan(double value, AngleUnit unit) =>
      math.tan(toRadians(value, unit));

  static double asin(double value, AngleUnit unit) =>
      fromRadians(math.asin(value), unit);

  static double acos(double value, AngleUnit unit) =>
      fromRadians(math.acos(value), unit);

  static double atan(double value, AngleUnit unit) =>
      fromRadians(math.atan(value), unit);

  // ── Hyperbolic functions (angle-unit independent) ──────────────────────────

  static double sinh(double x) => (math.exp(x) - math.exp(-x)) / 2;
  static double cosh(double x) => (math.exp(x) + math.exp(-x)) / 2;
  static double tanh(double x) => sinh(x) / cosh(x);
  static double asinh(double x) => math.log(x + math.sqrt(x * x + 1));
  static double acosh(double x) => math.log(x + math.sqrt(x * x - 1));
  static double atanh(double x) => math.log((1 + x) / (1 - x)) / 2;

  // ── Logarithms ──────────────────────────────────────────────────────────────

  static double ln(double x) => math.log(x);
  static double log10(double x) => math.log(x) / math.ln10;
  static double logBase(double x, double base) => math.log(x) / math.log(base);

  // ── Powers / roots ──────────────────────────────────────────────────────────

  static double sqrt(double x) => math.sqrt(x);
  static double nthRoot(double x, double n) => math.pow(x, 1 / n).toDouble();
  static double pow(double base, double exponent) =>
      math.pow(base, exponent).toDouble();

  // ── Factorial ───────────────────────────────────────────────────────────────

  static double factorial(int n) {
    if (n < 0) return double.nan;
    if (n <= 1) return 1;
    double result = 1;
    for (int i = 2; i <= n; i++) {
      result *= i;
    }
    return result;
  }
}
