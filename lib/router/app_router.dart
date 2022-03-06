import 'package:auto_route/auto_route.dart';
import '../screens/offline_screen/offline_screen.dart';
import '../screens/splash_screen/splash_screen.dart';
import '../screens/settings_screen/components/settings_lang_selector.dart';
import '../screens/settings_screen/components/settings_theme_selector.dart';
import '../screens/settings_screen/components/settings_selection.dart';
import '../screens/home_screen/home_screen.dart';
import '../screens/schedule_screen/schedule_screen.dart';
import '../screens/settings_screen/settings_screen.dart';

@MaterialAutoRouter(
  // replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    CustomRoute(
      initial: true,
      page: SplashScreen,
      name: "SplashRouter",
      path: SplashScreen.routeName,
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
    CustomRoute(
      initial: true,
      page: OfflineScreen,
      name: "OfflineRouter",
      path: OfflineScreen.routeName,
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
    CustomRoute(
      name: "HomeRouter",
      path: HomeScreen.routeName,
      page: HomeScreen,
      transitionsBuilder: TransitionsBuilders.slideRightWithFade,
      durationInMilliseconds: 300,
    ),
    CustomRoute(
      name: "ScheduleRouter",
      path: ScheduleScreen.routeName,
      page: ScheduleScreen,
      transitionsBuilder: TransitionsBuilders.slideRightWithFade,
      durationInMilliseconds: 300,
    ),
    CustomRoute(
      name: "SettingsRouter",
      page: SettingsScreen,
      path: SettingsScreen.routeName,
      transitionsBuilder: TransitionsBuilders.slideRightWithFade,
      durationInMilliseconds: 300,
      children: <AutoRoute>[
        AutoRoute(
          initial: true,
          path: SettingsSelection.pathName,
          page: SettingsSelection,
        ),
        AutoRoute(
          name: "SettingsThemeSelectorRouter",
          path: SettingsThemeSelector.pathName,
          page: SettingsThemeSelector,
        ),
        AutoRoute(
          name: "SettingsLangSelectorRouter",
          path: SettingsLangSelector.pathName,
          page: SettingsLangSelector,
        ),
      ],
    ),
  ],
)
class $AppRouter {}
