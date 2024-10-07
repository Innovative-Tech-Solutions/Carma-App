class NetworkException implements Exception {
  final String message;
  NetworkException({required this.message});
}

class ServerException implements Exception {
  final String message;
  ServerException({required this.message});
}

class InvalidCredentialsException implements Exception {
  final String message;
  InvalidCredentialsException({required this.message});
}

class TokenExpiredException implements Exception {
  final String message;
  TokenExpiredException({required this.message});
}
