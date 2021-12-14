import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class SocialIcon extends StatelessWidget {
  final String icon;
  final Function press;

  const SocialIcon({Key? key, required this.icon, required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        press.call();
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.all(12),
        width: 50,
        height: 50,
        decoration:
            BoxDecoration(color: Color(0xFFF5F6F9), shape: BoxShape.circle),
        child: SvgPicture.asset(icon),
      ),
    );
  }
}
