import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class LightTheme {
  ThemeData getThemeData(Locale? locale) {
    return ThemeData(
      fontFamily: locale.toString() == "ar" ? "Noto Kufi Arabic" : null,
      brightness: Brightness.light,
      primaryColor: AppColors.appBlue,
      primaryColorLight: AppColors.appLightGrey,
      primaryColorDark: AppColors.appDarkBlue,
      disabledColor: AppColors.appDisabled,
      scaffoldBackgroundColor: Colors.white,
      canvasColor: Colors.white,
      shadowColor: AppColors.selectDropShadow,
      textTheme: const TextTheme(
          subtitle1: TextStyle(
        color: AppColors.appLightVioletBlue,
      )),
      colorScheme: const ColorScheme(
        primary: AppColors.appBlue,
        secondary: AppColors.appDarkBlue,
        error: AppColors.appError,
        brightness: Brightness.light,
        background: Colors.white,
        onBackground: AppColors.appDarkBlue,
        onSecondary: Colors.white,
        onError: AppColors.appError,
        onPrimary: Colors.white,
        onSurface: AppColors.appDarkBlue,
        surface: Colors.white,
      ),
    );
  }
}
