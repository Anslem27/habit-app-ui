import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  // app Pink
  static const Color appColor = Color(0xFFfbb1ec);

  // app baby blue
  static const Color babyBlue = Color(0xFF9ddef2);

  // app fluid yellow
  static const Color fluidYellow = Color(0xFFf4f378);

  // app mild black
  static const Color mildBlack = Color(0xFF1a1a1a);

  static ThemeData appTheme = ThemeData(
    colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: Colors.blue),
    useMaterial3: true,
    fontFamily: "NeueMachina",
    //brightness: Brightness.dark,
  );


}
