import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'settings_subscreen.dart';
import '../../../store/modules/ui.dart';
import 'settings_theme_setter_button.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsThemeSelector extends StatelessWidget {
  static const String pathName = "theme-selector";

  const SettingsThemeSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final uiStore = Provider.of<Ui>(context);

    return SettingsSubScreen(
      text: t.theme,
      children: [
        SettingThemeSetterButton(
          text: t.sys,
          icon: Icons.brightness_6_rounded,
          selectedWhenThemeEquals: ThemeMode.system,
          onPressed: () => uiStore.setTheme(ThemeMode.system),
        ),
        SettingThemeSetterButton(
          text: t.light,
          icon: Icons.brightness_7_rounded,
          selectedWhenThemeEquals: ThemeMode.light,
          onPressed: () => uiStore.setTheme(ThemeMode.light),
        ),
        SettingThemeSetterButton(
          text: t.dark,
          icon: Icons.brightness_4_rounded,
          selectedWhenThemeEquals: ThemeMode.dark,
          onPressed: () => uiStore.setTheme(ThemeMode.dark),
        )
      ],
    );
  }
}
