import 'error_code.dart';

class ErrorProcess {
  String? message;
  int? code;
  dynamic error;

  ErrorProcess({this.message, this.code, this.error});

  static ErrorProcess getError(dynamic e) {
    return ErrorProcess(code: UNKNOW);
  }
}
