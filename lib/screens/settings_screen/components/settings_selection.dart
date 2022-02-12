import 'package:flutter/material.dart';
import '../../../router/app_router.gr.dart';
import 'settings_navigation_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsSelection extends StatelessWidget {
  static const pathName = "";

  const SettingsSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    return Column(
      children: [
        SettingsNavigationButton(
          icon: Icons.brightness_5_rounded,
          text: t.theme,
          to: const SettingsThemeSelectorRouter(),
        ),
        SettingsNavigationButton(
          icon: Icons.language,
          text: t.lang,
          to: const SettingsLangSelectorRouter(),
        )
      ],
    );
  }
}
