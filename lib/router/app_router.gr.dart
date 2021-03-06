// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;

import '../screens/home_screen/home_screen.dart' as _i3;
import '../screens/offline_screen/offline_screen.dart' as _i2;
import '../screens/schedule_screen/schedule_screen.dart' as _i4;
import '../screens/settings_screen/components/settings_lang_selector.dart'
    as _i8;
import '../screens/settings_screen/components/settings_selection.dart' as _i6;
import '../screens/settings_screen/components/settings_theme_selector.dart'
    as _i7;
import '../screens/settings_screen/settings_screen.dart' as _i5;
import '../screens/splash_screen/splash_screen.dart' as _i1;

class AppRouter extends _i9.RootStackRouter {
  AppRouter([_i10.GlobalKey<_i10.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    SplashRouter.name: (routeData) {
      return _i9.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i1.SplashScreen(),
          transitionsBuilder: _i9.TransitionsBuilders.fadeIn,
          opaque: true,
          barrierDismissible: false);
    },
    OfflineRouter.name: (routeData) {
      return _i9.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i2.OfflineScreen(),
          transitionsBuilder: _i9.TransitionsBuilders.fadeIn,
          opaque: true,
          barrierDismissible: false);
    },
    HomeRouter.name: (routeData) {
      return _i9.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i3.HomeScreen(),
          transitionsBuilder: _i9.TransitionsBuilders.slideRightWithFade,
          durationInMilliseconds: 300,
          opaque: true,
          barrierDismissible: false);
    },
    ScheduleRouter.name: (routeData) {
      return _i9.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i4.ScheduleScreen(),
          transitionsBuilder: _i9.TransitionsBuilders.slideRightWithFade,
          durationInMilliseconds: 300,
          opaque: true,
          barrierDismissible: false);
    },
    SettingsRouter.name: (routeData) {
      return _i9.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i5.SettingsScreen(),
          transitionsBuilder: _i9.TransitionsBuilders.slideRightWithFade,
          durationInMilliseconds: 300,
          opaque: true,
          barrierDismissible: false);
    },
    SettingsSelectionRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.SettingsSelection());
    },
    SettingsThemeSelectorRouter.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.SettingsThemeSelector());
    },
    SettingsLangSelectorRouter.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.SettingsLangSelector());
    }
  };

  @override
  List<_i9.RouteConfig> get routes => [
        _i9.RouteConfig('/#redirect',
            path: '/', redirectTo: '/splash', fullMatch: true),
        _i9.RouteConfig(SplashRouter.name, path: '/splash'),
        _i9.RouteConfig(OfflineRouter.name, path: '/offline'),
        _i9.RouteConfig(HomeRouter.name, path: '/home'),
        _i9.RouteConfig(ScheduleRouter.name, path: '/schedule'),
        _i9.RouteConfig(SettingsRouter.name, path: '/settings', children: [
          _i9.RouteConfig(SettingsSelectionRoute.name,
              path: '', parent: SettingsRouter.name),
          _i9.RouteConfig(SettingsThemeSelectorRouter.name,
              path: 'theme-selector', parent: SettingsRouter.name),
          _i9.RouteConfig(SettingsLangSelectorRouter.name,
              path: 'lang-selector', parent: SettingsRouter.name)
        ])
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashRouter extends _i9.PageRouteInfo<void> {
  const SplashRouter() : super(SplashRouter.name, path: '/splash');

  static const String name = 'SplashRouter';
}

/// generated route for
/// [_i2.OfflineScreen]
class OfflineRouter extends _i9.PageRouteInfo<void> {
  const OfflineRouter() : super(OfflineRouter.name, path: '/offline');

  static const String name = 'OfflineRouter';
}

/// generated route for
/// [_i3.HomeScreen]
class HomeRouter extends _i9.PageRouteInfo<void> {
  const HomeRouter() : super(HomeRouter.name, path: '/home');

  static const String name = 'HomeRouter';
}

/// generated route for
/// [_i4.ScheduleScreen]
class ScheduleRouter extends _i9.PageRouteInfo<void> {
  const ScheduleRouter() : super(ScheduleRouter.name, path: '/schedule');

  static const String name = 'ScheduleRouter';
}

/// generated route for
/// [_i5.SettingsScreen]
class SettingsRouter extends _i9.PageRouteInfo<void> {
  const SettingsRouter({List<_i9.PageRouteInfo>? children})
      : super(SettingsRouter.name,
            path: '/settings', initialChildren: children);

  static const String name = 'SettingsRouter';
}

/// generated route for
/// [_i6.SettingsSelection]
class SettingsSelectionRoute extends _i9.PageRouteInfo<void> {
  const SettingsSelectionRoute() : super(SettingsSelectionRoute.name, path: '');

  static const String name = 'SettingsSelectionRoute';
}

/// generated route for
/// [_i7.SettingsThemeSelector]
class SettingsThemeSelectorRouter extends _i9.PageRouteInfo<void> {
  const SettingsThemeSelectorRouter()
      : super(SettingsThemeSelectorRouter.name, path: 'theme-selector');

  static const String name = 'SettingsThemeSelectorRouter';
}

/// generated route for
/// [_i8.SettingsLangSelector]
class SettingsLangSelectorRouter extends _i9.PageRouteInfo<void> {
  const SettingsLangSelectorRouter()
      : super(SettingsLangSelectorRouter.name, path: 'lang-selector');

  static const String name = 'SettingsLangSelectorRouter';
}
