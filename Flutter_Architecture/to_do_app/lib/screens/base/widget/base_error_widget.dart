import 'package:flutter/cupertino.dart';
import 'package:to_do_app/screens/base/model/error_state_process.dart';

class BaseError extends StatelessWidget {
  BaseError(this.error);

  final ErrorProcess? error;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(error?.message ?? "Unknow Error"),
    );
  }
}
