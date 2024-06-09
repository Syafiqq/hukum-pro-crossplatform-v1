final class RuntimeException implements Exception {
  final String message;
  final String? code;
  final Exception? internalException;

  RuntimeException({
    required this.message,
    this.code,
    this.internalException,
  });
}
