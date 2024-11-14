import 'package:flutter/material.dart';

const colorList = [
  Colors.blue,
  Colors.cyan,
  Colors.green,
  Colors.red,
  Colors.yellow,
];

class AppTheme {
  final int selectedColor;

  AppTheme({required this.selectedColor})
      : assert(
          selectedColor >= 0 && selectedColor < colorList.length,
        );

  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: colorList[selectedColor],
        ),
        appBarTheme: const AppBarTheme(
          centerTitle: false,
        ),
      );
}
