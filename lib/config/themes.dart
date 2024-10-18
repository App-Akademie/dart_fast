import 'package:dart_fast/config/colors.dart';
import 'package:dart_fast/config/sizes.dart';
import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  fontFamily: "Dongle",
  textTheme: const TextTheme(
    bodyMedium: TextStyle(fontSize: normalTextSize),
    headlineMedium: TextStyle(fontSize: bigTextSize),
    bodySmall: TextStyle(fontSize: smallTextSize),
  ),
  scaffoldBackgroundColor: extremelyLightBlue,
);
