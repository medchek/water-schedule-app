import 'package:flutter/material.dart';
import 'components/settings_content.dart';
import '../../widgets/screen_header.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  static const routeName = "/settings";

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ScreenHeader(
              headerText: t!.settings,
              hideSettingsButton: true,
            ),
            const SettingsContent(),
          ],
        ),
      ),
    );
  }
}
