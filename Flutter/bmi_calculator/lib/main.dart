import 'package:flutter/material.dart';

import 'page/input_page.dart';

void main() {
  runApp(MaterialApp(
    // Custom theme of all app
    theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        textTheme: TextTheme(body1: TextStyle(color: Colors.white))),
    home: InputPage(),
  ));
}
