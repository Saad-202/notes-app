import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  //add it to database to save the current theme
  ThemeMode _currentThemeMode = ThemeMode.dark;

  ThemeMode get currentThemeMode => _currentThemeMode;

  void changeThemeMode() {
    _currentThemeMode == ThemeMode.light
        ? _currentThemeMode = ThemeMode.dark
        : _currentThemeMode = ThemeMode.light;
    notifyListeners();
  }
}
