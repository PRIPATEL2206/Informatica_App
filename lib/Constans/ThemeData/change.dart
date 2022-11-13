import 'package:flutter/material.dart';
import 'package:informatica/Constans/ThemeData/theme_data.dart';

class ThemeAdjustment {
  static final List<ThemeData> _themes = [darkTheme, lightTheme];
  static int _currentThemeIndex = 0;

  static ThemeData get currentTheme {
    return _themes[_currentThemeIndex];
  }

  static set currentThemeIndex(int i) {
    _currentThemeIndex = i;
  }

  static bool get isDarkMode {
    return _currentThemeIndex == 0 ? true : false;
  }
}
