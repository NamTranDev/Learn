import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BaseLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
    return Center(
      child: CircularProgressIndicator(
        strokeWidth: 1,
      ),
    );
  }
}
