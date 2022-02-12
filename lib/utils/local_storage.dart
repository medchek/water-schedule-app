import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<ThemeMode> getTheme() async {
  final prefs = await SharedPreferences.getInstance();

  switch (prefs.getString("theme")) {
    case "sys":
      return ThemeMode.system;
    case "light":
      return ThemeMode.light;
    case "dark":
      return ThemeMode.dark;
    default:
      return ThemeMode.system;
  }
}
