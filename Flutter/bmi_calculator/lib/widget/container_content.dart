import 'package:flutter/cupertino.dart';

class ContainerCard extends StatelessWidget {
  ContainerCard({required this.colour, this.cardChild, this.onChange});

  final Color colour;
  final Widget? cardChild;
  final Function? onChange;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          onChange?.call();
        },
        child: Container(
          width: double.infinity,
          child: cardChild,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: colour, borderRadius: BorderRadius.circular(5)),
        ));
  }
}
