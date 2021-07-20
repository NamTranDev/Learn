import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("I am rich"),
        backgroundColor: Colors.blueGrey[900],
      ),
      backgroundColor: Colors.blue,
      body: Center(
        child: Image(
          image: NetworkImage(
              "https://upload.wikimedia.org/wikipedia/vi/thumb/5/5c/Chelsea_crest.svg/1200px-Chelsea_crest.svg.png"),
        ),
      ),
    ),
  ));
}
