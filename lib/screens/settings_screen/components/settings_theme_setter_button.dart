import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import '../../../store/modules/ui.dart';
import '../../../utils/app_colors.dart';

class SettingThemeSetterButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool isSelected;
  final VoidCallback onPressed;

  /// selected when the passed selectedWhenThemeEquals matches the _theme value in the Ui mobx store
  final ThemeMode selectedWhenThemeEquals;
  const SettingThemeSetterButton(
      {required this.icon,
      required this.text,
      required this.selectedWhenThemeEquals,
      required this.onPressed,
      this.isSelected = false,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final uiStore = Provider.of<Ui>(context);

    return Column(
      children: [
        Material(
          color: theme.primaryColorLight,
          borderRadius: BorderRadius.circular(6),
          child: InkWell(
            onTap: onPressed,
            borderRadius: BorderRadius.circular(6),
            splashColor: AppColors.appDisabled,
            child: Container(
              height: 70,
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ), // color: theme.primaryColorLight,
              child: Row(
                children: [
                  Icon(
                    icon,
                    color: theme.primaryColorDark,
                    size: 27,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Text(
                      text,
                      style: TextStyle(
                        fontSize: 16,
                        color: theme.primaryColorDark,
                      ),
                    ),
                  ),
                  Observer(builder: (_) {
                    return Icon(
                      selectedWhenThemeEquals == uiStore.selectedTheme
                          ? Icons.radio_button_checked_rounded
                          : Icons.radio_button_off_rounded,
                      color: theme.primaryColorDark,
                      size: 22,
                    );
                  })
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
