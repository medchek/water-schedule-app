import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen/home_screen.dart';
import 'screens/offline_screen/offline_screen.dart';
import 'store/modules/connectivity.dart';
import 'store/modules/ui.dart';
import 'router/app_router.gr.dart';
import 'store/modules/schedules.dart';
import 'store/modules/towns.dart';
import 'store/modules/wilayas.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import 'config/themes/themes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _appRouter = AppRouter();
  final _uiStore = Ui();
  final _connectivityStore = ConnectivityStore();
  // retrives the theme and langauge preferences stored in the user device if they exist
  void initUi() async {
    if (_appRouter.current.name != SplashRouter.name) {
      _appRouter.replace(const SplashRouter());
    }
    await _uiStore.getTheme();
    await _uiStore.getLocale();
    // once the ui is loaded
    // if the app is offline, redirect to the Offfline route

    final connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.none) {
      _appRouter.replace(const OfflineRouter());
    } else {
      _appRouter.replace(const HomeRouter());
    }
  }

  final _appTheme = AppTheme();

  void redirectToOfflineScreen() {
    // print("redirectToOfflineScreen()");

    const routeName = OfflineScreen.routeName;
    // track current route before changing it,
    // so that it can be saved in the store history after redirecting
    final String currentRouteName = _appRouter.current.path;
    // only redirect if the current route does not equal the one requested to be navigated towards
    if (currentRouteName != routeName) {
      _appRouter.replaceNamed(routeName);
      _connectivityStore.setLastVisited(currentRouteName);
    }
  }

  /// redirect to the last visited page in the history, used when the connection is restored
  void redirectTolastVisited() {
    final lastVisited = _connectivityStore.lastVisitedPage;
    final noHistory = _connectivityStore.isHistoryEmpty;
    // if there is no history, redirect to the home screen
    final replaceRouteName = noHistory ? HomeScreen.routeName : lastVisited;
    if (_appRouter.current.name != OfflineScreen.routeName) {
      _appRouter.replaceNamed(replaceRouteName);
      _connectivityStore.resetLastVisitedPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    initUi();

    // no need to dispose the observer reaction as it gets only called once per app lifetime
    reaction((_) => _connectivityStore.connectivityStream.value,
        (ConnectivityResult? result) {
      // print("____CHECKING CONNECTION____");
      if (result == ConnectivityResult.none) {
        redirectToOfflineScreen();
      } else {
        redirectTolastVisited();
      }
    });

    // dispose();

    return MultiProvider(
      providers: [
        Provider<Wilayas>(create: (_) => Wilayas()),
        Provider<Towns>(create: (_) => Towns()),
        Provider<Schedules>(create: (_) => Schedules()),
        Provider<Ui>(create: (_) => _uiStore),
        Provider<ConnectivityStore>(create: (_) => _connectivityStore)
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
