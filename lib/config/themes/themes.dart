import 'package:flutter/material.dart';

import 'light_theme.dart';
import 'dark_theme.dart';

class AppTheme {
  final _lightTheme = LightTheme();
  final _darkTheme = DarkTheme();

  /// the [locale] param is required to set a different font for the arabic locale
  ThemeData light(Locale? locale) {
    return _lightTheme.getThemeData(locale);
  }

  /// the [locale] param is required to set a different font for the arabic locale
  ThemeData dark(Locale? locale) {
    return _darkTheme.getThemeData(locale);
  }
}
