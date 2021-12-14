import 'package:flutter/cupertino.dart';

class SplashContent extends StatelessWidget {
  final String text, image;

  const SplashContent({Key? key, required this.text, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text,
          textAlign: TextAlign.center,
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Image.asset(
              image,
              fit: BoxFit.fitWidth,
            ),
          ),
        )
      ],
    );
  }
}
