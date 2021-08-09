import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.onPressed, this.icon});

  final IconData? icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 6,
      constraints: BoxConstraints.tightFor(width: 40, height: 40),
      child: Icon(
        icon,
        color: Colors.white,
      ),
      onPressed: () {
        onPressed.call();
      },
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
