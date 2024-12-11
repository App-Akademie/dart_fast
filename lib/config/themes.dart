import 'package:dart_fast/config/colors.dart';
import 'package:dart_fast/config/sizes.dart';
import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  fontFamily: "Dongle",
  textTheme: const TextTheme(
    bodyMedium: TextStyle(fontSize: defaultTextSize),
    headlineMedium: TextStyle(fontSize: bigTextSize),
    headlineLarge: TextStyle(
      fontSize: headlineTextSize,
      fontWeight: FontWeight.bold,
    ),
    bodySmall: TextStyle(fontSize: smallTextSize),
  ),
  scaffoldBackgroundColor: extremelyLightBlue,
  appBarTheme: const AppBarTheme(backgroundColor: veryLightBlue),
  navigationBarTheme: const NavigationBarThemeData(
    backgroundColor: veryLightBlue,
    labelTextStyle: WidgetStatePropertyAll(
      TextStyle(
        fontSize: defaultTextSize,
      ),
    ),
  ),
);
