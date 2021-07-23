import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text("I am poor"), backgroundColor: Colors.amber),
      body: Center(
        child: Image(
          image: AssetImage("images/background_main.jpg"),
        ),
      ),
    ),
  ));
}
