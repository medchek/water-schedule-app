import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../router/app_router.gr.dart';

class ScreenHeader extends StatelessWidget {
  final String headerText;
  final bool hideSettingsButton;
  const ScreenHeader(
      {required this.headerText, this.hideSettingsButton = false, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    void goBack() {
      AutoRouter.of(context).popTop();
    }

    void goToSettings() {
      // Navigator.pushNamed(
      //   context,
      //   SettingsScreen.routeName,
      // );
      AutoRouter.of(context).push(const SettingsRouter());
    }

    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      margin: const EdgeInsets.symmetric(vertical: 2),
      width: double.infinity,
      height: 50,
      child: Stack(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // back button
          IconButton(
            alignment: Alignment.center,
            onPressed: goBack,
            splashRadius: 25,
            iconSize: 40,
            padding: const EdgeInsets.all(0),
            // iconSize: 40,
            icon: const Icon(
              Icons.chevron_left,
            ),
            color: theme.primaryColorDark,
          ),
          // header text

          Center(
            child: Text(
              headerText,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: theme.primaryColorDark,
              ),
            ),
          ),
          // settings button

          if (!hideSettingsButton)
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  splashRadius: 25,
                  iconSize: 27,
                  onPressed: goToSettings,
                  icon: const Icon(Icons.settings_outlined),
                  color: theme.primaryColorDark,
                ),
              ],
            ),
        ],
      ),
    );
  }
}
