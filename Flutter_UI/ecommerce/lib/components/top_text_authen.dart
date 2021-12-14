import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopTextAuthen extends StatelessWidget {
  final String titleHeader;
  final String title;

  const TopTextAuthen(
      {Key? key, required this.titleHeader, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.04,
        ),
        Text(
          titleHeader,
          style: TextStyle(
            fontSize: 25,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Text(
            title,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
