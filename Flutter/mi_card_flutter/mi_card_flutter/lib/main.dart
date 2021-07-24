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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(height: double.infinity, width: 100, color: Colors.red),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.yellow,
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.yellow.withOpacity(0.5),
                  )
                ],
              ),
              Container(height: double.infinity, width: 100, color: Colors.blue)
            ],
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
