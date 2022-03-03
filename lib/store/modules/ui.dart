import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// Include generated file
part 'ui.g.dart';

// This is the class used by rest of your codebase
class Ui = _Ui with _$Ui;

// The store-class
abstract class _Ui with Store {
  @observable
  ThemeMode? _theme;

  @observable
  bool _isThemeLoaded = false;

  @computed
  ThemeMode? get selectedTheme => _theme;

  @observable
  String? _locale;

  @observable
  bool _isLocaleLoaded = false;

  @computed
  bool get isUiLoaded => _isThemeLoaded == true && _isLocaleLoaded == true;

  @computed
  String? get locale => _locale;

  @computed
  Locale? get selectedLocale {
    if (_locale != null) {
      return Locale(_locale!);
    } else {
      return null;
    }
  }

  @action
  Future<void> getTheme() async {
    // print("getTheme fired");
    final prefs = await SharedPreferences.getInstance();
    switch (prefs.getString("theme")) {
      case "sys":
        _theme = ThemeMode.system;
        break;
      case "light":
        _theme = ThemeMode.light;
        break;
      case "dark":
        _theme = ThemeMode.dark;
        break;
      default:
        _theme = ThemeMode.system;
        break;
    }
    _isThemeLoaded = true;
  }

  @action
  Future<void> setTheme(ThemeMode themeMode) async {
    if (themeMode == _theme) return;

    final prefs = await SharedPreferences.getInstance();
    late final String themeValue;

    switch (themeMode) {
      case ThemeMode.system:
        themeValue = "sys";
        break;
      case ThemeMode.dark:
        themeValue = "dark";
        break;
      case ThemeMode.light:
        themeValue = "light";
        break;
      default:
        themeValue = "sys";
        break;
    }

    await prefs.setString("theme", themeValue);
    _theme = themeMode;
  }

  @action
  Future<void> getLocale() async {
    // print("getLocale fired");
    final prefs = await SharedPreferences.getInstance();
    _locale = prefs.getString("lang");
    _isLocaleLoaded = true;
  }

  @action
  Future<void> setLocale(String? locale) async {
    if (locale == _locale) return;

    if (locale != null &&
        !AppLocalizations.supportedLocales.contains(
          Locale(locale),
        )) return;
    // const allowedLocales = ["fr", "ar", "en", "auto"];
    // if (!allowedLocales.contains(locale)) return;

    final prefs = await SharedPreferences.getInstance();

    // if the value is set to automatic, remove any previous key from the localeStorage
    if (locale == null) {
      await prefs.remove("lang");
    } else {
      await prefs.setString("lang", locale);
    }
    _locale = locale;
  }
}
