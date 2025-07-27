import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  //Getter to expose current theme mode
  ThemeMode get themeMode => _themeMode;

  Future<void> toggleTheme() async {
    if (_themeMode == ThemeMode.light) {
      _themeMode = ThemeMode.dark;
    } else if (_themeMode == ThemeMode.dark) {
      _themeMode = ThemeMode.light;
    } else {
      _themeMode = ThemeMode.light;
    }

    //Saving the new theme preferences to SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('theme_mode', _themeMode.toString().split('.').last);

    notifyListeners();
  }
}
