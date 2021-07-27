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

class DicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: FlatButton(
                child: Image.asset("images/dice1.png"),
                onPressed: () {
                  print("Image 1 press");
                },
              )),
          Expanded(
              flex: 1,
              child: FlatButton(
                child: Image.asset("images/dice1.png"),
                onPressed: () {
                  print("Image 2 press");
                },
              )),
        ],
      ),
    );
  }
}
