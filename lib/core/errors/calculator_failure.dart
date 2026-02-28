class EvaluationException implements Exception {
  const EvaluationException(this.message, {this.nodeId});

  final String message;
  final String? nodeId;

  @override
  String toString() => 'EvaluationException: $message';
}
