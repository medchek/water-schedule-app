import 'package:auto_route/auto_route.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../store/modules/connectivity.dart';
import '../../utils/app_colors.dart';
import '../../utils/locale_utils.dart';
import '../../widgets/bottom_illustration.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OfflineScreen extends StatelessWidget {
  const OfflineScreen({Key? key}) : super(key: key);

  static const routeName = "/offline";

  Future<void> checkConnectivity({
    required BuildContext context,
    required ConnectivityStore connectivityStore,
    required AppLocalizations t,
  }) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    // default snack value for when the device is not connected
    Color snackBgColor = AppColors.appError;
    Color snackTextColor = Colors.white;
    String snackText = t.noInternetStill;

    if (connectivityResult != ConnectivityResult.none) {
      final String redirectTo = connectivityStore.lastVisitedPage;

      snackBgColor = Colors.white;
      snackTextColor = AppColors.appDarkBlueVariant;
      snackText = t.internetRestored;

      AutoRouter.of(context).replaceNamed(redirectTo);
      // reset any previous history (and do not record offline as history)
      connectivityStore.resetLastVisitedPage();
    }
    // else keep the default values, which reflect the unavailablity of device connection
    final snackBar = SnackBar(
      content: Text(snackText,
          style: TextStyle(
            color: snackTextColor,
            fontFamily:
                LocaleUtils.isArLocale(context) ? "Noto Kufi Arabic" : null,
          )),
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      dismissDirection: DismissDirection.horizontal,
      backgroundColor: snackBgColor,
      behavior: SnackBarBehavior.floating,
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      action: SnackBarAction(
        label: "OK",
        textColor: snackTextColor,
        onPressed: () {},
      ),
    );

    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations t = AppLocalizations.of(context)!;

    final theme = Theme.of(context);
    final bool isDarkTheme = theme.brightness == Brightness.dark;
    final connectivityStore = Provider.of<ConnectivityStore>(context);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            const Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: BottomIllustration(),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.wifi_off_rounded,
                  size: 150,
                  color: theme.primaryColor,
                ),
                const SizedBox(height: 25),
                Text(
                  t.offlineTitle,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: isDarkTheme
                        ? AppColors.appLightBlueGrey
                        : AppColors.appDarkBlueVariant,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 50),
                  child: Text(
                    t.offlineSubTitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      color: isDarkTheme
                          ? AppColors.appLightVioletBlue.withOpacity(0.5)
                          : AppColors.appGreyVariant,
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                SizedBox(
                  width: 118,
                  height: 34,
                  child: ElevatedButton(
                    onPressed: () => checkConnectivity(
                      context: context,
                      connectivityStore: connectivityStore,
                      t: t,
                    ),
                    child: Text(
                      t.retry,
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(theme.primaryColor),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .15,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
