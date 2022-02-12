import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'settings_lang_setter_button.dart';
import '../../../store/modules/ui.dart';
import 'settings_subscreen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsLangSelector extends StatelessWidget {
  static const String pathName = "lang-selector";
  const SettingsLangSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final uiStore = Provider.of<Ui>(context);

    return SettingsSubScreen(text: t.lang, children: [
      SettingsLangSetterButton(
        text: t.sysLang,
        selectedWhenLangEquals: null,
        onPressed: () => uiStore.setLocale(null),
      ),
      SettingsLangSetterButton(
        text: "Francais",
        selectedWhenLangEquals: "fr",
        onPressed: () => uiStore.setLocale("fr"),
        isAr: false,
      ),
      SettingsLangSetterButton(
        text: "English",
        selectedWhenLangEquals: "en",
        onPressed: () => uiStore.setLocale("en"),
        isAr: false,
      ),
      SettingsLangSetterButton(
        text: "العربية",
        selectedWhenLangEquals: "ar",
        onPressed: () => uiStore.setLocale("ar"),
        isAr: true,
      ),
    ]);
  }
}
