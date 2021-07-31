import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.blue,
          appBar: AppBar(
            title: Text("Ask Me Anything"),
            backgroundColor: Colors.blueAccent.shade400,
          ),
          body: MagicBallPage(),
        ),
      ),
    );

class MagicBallPage extends StatefulWidget {
  @override
  _MagicBallPageState createState() => _MagicBallPageState();
}

var random = Random();
int next() {
  return random.nextInt(5) + 1;
}

class _MagicBallPageState extends State<MagicBallPage> {
  int numberAnswer = next();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FlatButton(
        child: Image.asset("images/ball$numberAnswer.png"),
        onPressed: () {
          updateState();
        },
      ),
    );
  }

  void updateState() {
    setState(() {
      numberAnswer = next();
    });
  }
}
