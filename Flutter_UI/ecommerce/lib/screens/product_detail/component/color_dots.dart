import 'package:ecommerce/components/round_icon.dart';
import 'package:ecommerce/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class ColorDots extends StatefulWidget {
  final Product? product;

  const ColorDots({Key? key, this.product}) : super(key: key);

  @override
  State<ColorDots> createState() => _ColorDotsState();
}

class _ColorDotsState extends State<ColorDots> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ...List.generate(
              widget.product?.colors.length ?? 0,
              (index) => ColorDot(
                    color: widget.product?.colors[index],
                    isSelected: selected == index,
                    onClick: () {
                      setState(() {
                        selected = index;
                      });
                    },
                  )),
          Spacer(),
          RoundIcon(icon: Icons.remove, onClick: () {}),
          SizedBox(
            width: 10,
          ),
          RoundIcon(icon: Icons.add, onClick: () {}),
        ],
      ),
    );
  }
}

class ColorDot extends StatelessWidget {
  const ColorDot({
    Key? key,
    required this.color,
    required this.isSelected,
    required this.onClick,
  }) : super(key: key);

  final Color? color;
  final bool isSelected;
  final GestureTapCallback onClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        width: 40,
        height: 40,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
              color: isSelected ? kPrimaryColor : Colors.transparent),
        ),
        child: DecoratedBox(
            decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        )),
      ),
    );
  }
}
