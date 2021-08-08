import 'package:flutter/cupertino.dart';

import 'constants.dart';

class IconContent extends StatelessWidget {
  IconContent(this.icon, this.text);

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 50,
        ),
        Text(
          text.toUpperCase(),
          style: lableTextStyle,
        )
      ],
    );
  }
}
