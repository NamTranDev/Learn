class ErrorData implements Exception {
  String? message;
  int? code;
  Exception? exception;
  dynamic errorValue;
}
