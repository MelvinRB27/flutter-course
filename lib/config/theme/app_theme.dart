import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF49149F);
const List<Color> colorTheme = [
  _customColor,
  Colors.blue,
  Colors.red,
  Colors.green,
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0 && selectedColor <= colorTheme.length - 1,
            'Color must be between 0 and  ${colorTheme.length}');
  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: colorTheme[selectedColor],
      // brightness: Brightness.dark
    );
  }
}
