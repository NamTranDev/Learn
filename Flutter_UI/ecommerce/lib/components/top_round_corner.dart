import 'package:flutter/cupertino.dart';

class TopRoundCorner extends StatelessWidget {
  const TopRoundCorner({
    Key? key,
    required this.color,
    required this.child,
  }) : super(key: key);

  final Widget child;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.vertical(top: const Radius.circular(40))),
      child: child,
    );
  }
}
