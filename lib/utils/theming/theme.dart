import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: Colors.blue,
    textTheme: TextTheme(
      titleLarge: TextStyle(fontWeight: FontWeight.bold),
    ),
  );

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: Colors.black,
    textTheme: TextTheme(
      titleLarge: TextStyle(fontWeight: FontWeight.bold),
    ),
  );
}
