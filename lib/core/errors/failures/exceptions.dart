class ServerExceptions implements Exception {
  String? message;
  String? stackTrace;

  ServerExceptions({this.message, this.stackTrace});
}

class CacheExceptions implements Exception {
  String? message;
  String? stackTrace;

  CacheExceptions(this.message, this.stackTrace);
}
class ValidationExceptions implements Exception {
  String? message;
  String? stackTrace;

  ValidationExceptions(this.message, this.stackTrace);
}