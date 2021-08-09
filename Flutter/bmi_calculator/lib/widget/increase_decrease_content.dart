import 'package:bmi_calculator/widget/round_icon_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/constants.dart';

class InCreaseDecreaseContent extends StatelessWidget {
  InCreaseDecreaseContent(
      {required this.lable,
      required this.value,
      required this.onDecrease,
      required this.onIncrease});

  String lable;
  String value;
  Function onIncrease;
  Function onDecrease;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          lable,
          style: lableTextStyle,
        ),
        Text(
          value,
          style: lableNumberStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundIconButton(
              onPressed: () {
                onDecrease.call();
              },
              icon: Icons.remove,
            ),
            SizedBox(
              width: 10,
            ),
            RoundIconButton(
                onPressed: () {
                  onIncrease.call();
                },
                icon: Icons.add)
          ],
        )
      ],
    );
  }
}
