import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundIcon extends StatelessWidget {
  const RoundIcon({
    Key? key,
    required this.icon,
    required this.onClick,
  });

  final IconData icon;
  final GestureTapCallback onClick;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: GestureDetector(
        onTap: onClick,
        child: Container(
          alignment: Alignment.center,
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
          child: Icon(icon),
        ),
      ),
    );
  }
}
