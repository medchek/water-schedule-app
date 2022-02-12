import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:seaal_water_schedule_app/store/modules/ui.dart';

void main() {
  test(
      "Expect Theme to be set then retreived from device storage and correclty loaded in the selectedTheme store property",
      () async {
    final uiStore = Ui();

    await uiStore.setTheme(ThemeMode.light);
    await uiStore.getTheme();
    final theme = uiStore.selectedTheme;

    expect(theme, ThemeMode.light);
  });
}
