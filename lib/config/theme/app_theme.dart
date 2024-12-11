import 'package:flutter/material.dart';

const colorList = [
  Colors.blue,
  Colors.cyan,
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.purple,
  Colors.pink,
  Colors.orange,
  Colors.brown,
  Colors.deepPurple,
  Colors.yellow,
];

class AppTheme {
  final int selectedColor;
  final bool isDarkMode;

  AppTheme({this.selectedColor = 0, this.isDarkMode = false})
      : assert(
          selectedColor >= 0 && selectedColor < colorList.length,
        );

  ThemeData getTheme() {
    final brightness = isDarkMode ? Brightness.dark : Brightness.light;

    return ThemeData(
      brightness: brightness,
      useMaterial3: true,
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: colorList[selectedColor],
        brightness: brightness,
      ),
      appBarTheme: const AppBarTheme(
        centerTitle: false,
      ),
    );
  }

  AppTheme copyWith({int? selectedColor, bool? isDarkMode}) => AppTheme(
        selectedColor: selectedColor ?? this.selectedColor,
        isDarkMode: isDarkMode ?? this.isDarkMode,
      );
}
