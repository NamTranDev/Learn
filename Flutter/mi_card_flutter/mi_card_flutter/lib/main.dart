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
        backgroundColor: Colors.teal,
        body: SafeArea(
            child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                  "https://i2.wp.com/twinfinite.net/wp-content/uploads/2019/11/Final-Fantasy-VII-Remake-Cloud-1.jpg?w=996&h=996&crop=1&ssl=1"),
            ),
            Text(
              "Cloud",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ],
        )),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red,
          onPressed: () {},
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
