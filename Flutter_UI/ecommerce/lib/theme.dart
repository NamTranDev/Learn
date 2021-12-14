import 'package:flutter/material.dart';

import 'constants.dart';

ThemeData theme() {
  var outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(25),
      borderSide: const BorderSide(color: kTextColor),
      gapPadding: 10);
  return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'Muli',
      appBarTheme: appBarTheme(),
      textTheme: textTheme(),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 45,
          vertical: 20,
        ),
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        border: outlineInputBorder,
      ));
}

TextTheme textTheme() {
  return const TextTheme(
    bodyText1: TextStyle(color: kTextColor),
    bodyText2: TextStyle(color: kTextColor),
  );
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    color: Colors.white,
    titleTextStyle: TextStyle(color: Color(0xFF8B8B8B), fontSize: 20),
    iconTheme: IconThemeData(color: Colors.black),
    elevation: 0,
  );
}
