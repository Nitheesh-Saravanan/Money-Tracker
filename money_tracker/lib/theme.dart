import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData theme = ThemeData(
    primarySwatch: Colors.deepPurple,
    brightness: Brightness.light,
    textTheme: TextTheme(
      headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
      headlineMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.w600, color: Colors.black),
      headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.w500, color: Colors.black),
      titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black),
      bodyLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.normal, color: Colors.black),
      bodyMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black),
      bodySmall: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.black),
    ),
  );
}
