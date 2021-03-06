import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class DarkTheme {
  ThemeData getThemeData(Locale? locale) {
    return ThemeData(
      fontFamily: locale.toString() == "ar" ? "Noto Kufi Arabic" : null,
      brightness: Brightness.dark,
      // backgroundColor: AppColors.darkAppDarkBlue,
      scaffoldBackgroundColor: AppColors.darkAppDarkBlue,
      primaryColor: const Color(0xff698ee0),
      primaryColorDark: Colors.white,
      primaryColorLight: AppColors.darkAppCardBg,
      // canvasColor: AppColors.appDarkBlue,
      canvasColor: AppColors.darkAppCanvasBg,
      shadowColor: AppColors.selectDropShadow,
      disabledColor: Colors.white54,

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.disabled)) {
              return AppColors.darkAppDisabledBg;
            } else {
              return Colors.white;
            }
          }),
          foregroundColor: MaterialStateProperty.all(AppColors.darkAppDarkBlue),
        ),
      ),
      // primaryColorLight: AppColors.appLightBlue,
      // primaryColorDark: AppColors.appDarkBlue,
      colorScheme: const ColorScheme(
        primary: AppColors.appBlue,
        secondary: AppColors.appDarkBlue,
        error: AppColors.appError,
        brightness: Brightness.dark,
        background: AppColors.darkAppDarkBlue,
        onBackground: Colors.white,
        onSecondary: Colors.white,
        onError: AppColors.appError,
        onPrimary: Colors.white,
        onSurface: AppColors.appDarkBlue,
        surface: Colors.white,
      ),
    );
  }
}
