import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

final _random = new Random();

int next() {
  return _random.nextInt(6) + 1;
}

class _DicePageState extends State<DicePage> {
  int numberLeft = next();
  int numberRight = next();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: FlatButton(
                child: Image.asset("images/dice$numberLeft.png"),
                onPressed: () {
                  changeDiceFace();
                },
              )),
          Expanded(
              flex: 1,
              child: FlatButton(
                child: Image.asset("images/dice$numberRight.png"),
                onPressed: () {
                  changeDiceFace();
                },
              )),
        ],
      ),
    );
  }

  void changeDiceFace() {
    setState(() {
      numberLeft = next();
      numberRight = next();
    });
  }
}
