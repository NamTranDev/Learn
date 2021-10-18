import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';

class IconWithCounter extends StatelessWidget {
  final int count;
  final String icon;
  final GestureTapCallback onClick;

  const IconWithCounter(
      {Key? key,
      required this.count,
      required this.icon,
      required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      borderRadius: BorderRadius.circular(46),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: EdgeInsets.all(12),
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: kSecondaryColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(icon),
          ),
          if (count > 0)
            Positioned(
              top: -3,
              right: 0,
              child: Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                    color: Color(0xFFFF4848), shape: BoxShape.circle),
                child: Center(
                    child: Text(
                  '$count',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                      height: 1,
                      fontWeight: FontWeight.w600),
                )),
              ),
            ),
        ],
      ),
    );
  }
}
