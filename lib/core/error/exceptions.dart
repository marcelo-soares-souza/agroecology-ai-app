class AppException implements Exception {
  final String message;
  final int? statusCode;

  const AppException({required this.message, this.statusCode});

  @override
  String toString() => message;
}

class NetworkException extends AppException {
  const NetworkException({required super.message, super.statusCode});
}

class AuthException extends AppException {
  const AuthException({required super.message, super.statusCode});
}

class ForbiddenException extends AppException {
  const ForbiddenException({required super.message, super.statusCode});
}

class RateLimitException extends AppException {
  final int retryAfterSeconds;
  final DateTime blockedUntil;

  const RateLimitException({
    required super.message,
    required this.retryAfterSeconds,
    required this.blockedUntil,
    super.statusCode,
  });
}

class ChatException extends AppException {
  const ChatException({required super.message, super.statusCode});
}

class ValidationException extends AppException {
  final Map<String, String>? fieldErrors;

  const ValidationException({
    required super.message,
    super.statusCode,
    this.fieldErrors,
  });
}
