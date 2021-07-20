part of common;

class ServerFailureException implements Exception {
  ServerFailureException(
    this.message, {
    this.code,
  });

  final String message;
  int? code;
}

class UnknownServerFailureException implements Exception {}

class ParsingException implements Exception {
  ParsingException(
    this.message,
  );

  final String message;
}
