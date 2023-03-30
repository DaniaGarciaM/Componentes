import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Colors.greenAccent;
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: Colors.orange,
    appBarTheme: const AppBarTheme(
      color: primary,
      elevation: 0,
    ),
  );
}
