import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Container(
            height: 100,
            width: 100,
            margin: EdgeInsets.symmetric(vertical: 50, horizontal: 10),
            padding: EdgeInsets.all(10),
            color: Colors.white,
            child: Text("Hello World"),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red,
          onPressed: () {},
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
