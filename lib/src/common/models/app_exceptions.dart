class AppException implements Exception {
  AppException({
    required this.message,
    required this.statusCode,
    required this.identifier,
  });

  factory AppException.unknown() {
    return AppException(
      message: 'Unknown error',
      statusCode: 0,
      identifier: 'unknown',
    );
  }

  final String message;
  final int statusCode;
  final String identifier;

  @override
  String toString() {
    return 'statusCode=$statusCode\nmessage=$message\nidentifier=$identifier';
  }
}
