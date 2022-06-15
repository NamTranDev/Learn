import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType inputType;
  final bool isPass;
  final TextInputAction actionInput;

  const TextFieldInput(
      {Key? key,
      required this.controller,
      required this.hintText,
      required this.inputType,
      this.isPass = false,
      this.actionInput = TextInputAction.next})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderSide: Divider.createBorderSide(context),
      borderRadius: BorderRadius.circular(2),
    );
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border: inputBorder,
        enabledBorder: inputBorder,
        filled: true,
        contentPadding: const EdgeInsets.all(8),
      ),
      keyboardType: inputType,
      obscureText: isPass,
      textInputAction: actionInput,
    );
  }
}
