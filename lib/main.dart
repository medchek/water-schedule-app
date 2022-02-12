import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'store/modules/ui.dart';
import 'router/app_router.gr.dart';
import 'store/modules/schedules.dart';
import 'store/modules/towns.dart';
import 'store/modules/wilayas.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'config/themes/themes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _appRouter = AppRouter();
  final _uiStore = Ui();

  // retrives the theme and langauge preferences stored in the user device if they exist
  void initUi() async {
    if (_appRouter.current.name != SplashRouter.name) {
      _appRouter.replace(const SplashRouter());
    }
    await _uiStore.getTheme();
    await _uiStore.getLocale();
    // once the ui is loaded
    _appRouter.replace(const HomeRouter());
  }

  final _appTheme = AppTheme();

  @override
  Widget build(BuildContext context) {
    initUi();

    return MultiProvider(
      providers: [
        Provider<Wilayas>(create: (_) => Wilayas()),
        Provider<Towns>(create: (_) => Towns()),
        Provider<Schedules>(create: (_) => Schedules()),
        Provider<Ui>(create: (_) {
          return _uiStore;
        }),
      ],
      child: Observer(builder: (ctx) {
        final Locale? appLocale = _uiStore.selectedLocale;

        return MaterialApp.router(
          theme: _appTheme.light(appLocale),
          darkTheme: _appTheme.dark(appLocale),
          themeMode: _uiStore.selectedTheme,
          routeInformationParser: _appRouter.defaultRouteParser(),
          routerDelegate: _appRouter.delegate(),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: _uiStore.selectedLocale,
        );
      }),
    );
  }
}
