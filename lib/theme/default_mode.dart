import 'package:flutter/material.dart';

ThemeData defaultMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    surface: Color(0xFFFFFEF4),
    primary: Color(0xFFDFAFDB),
    secondary: Color(0xFFFFE8F6),
    tertiary: Color(0xFFEF94CA),
    inversePrimary: Color(0xFFAB1D79),
  ),
  textTheme: ThemeData.light().textTheme.apply(
    bodyColor: Colors.grey.shade800,
    displayColor: Colors.black,
  ),
);

// primary: Color(0xFFDFAFDB),
    // secondary: Color(0xFFEF94CA),
    // tertiary: Color(0xFFFFF6FE),
    //    primary: Color.fromARGB(255, 243, 238, 242),
