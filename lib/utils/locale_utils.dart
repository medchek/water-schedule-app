import 'package:flutter/widgets.dart';

class LocaleUtils {
  static bool isArLocale(BuildContext context) {
    final String locale = Localizations.localeOf(context).toString();
    return locale == "ar";
  }
}
