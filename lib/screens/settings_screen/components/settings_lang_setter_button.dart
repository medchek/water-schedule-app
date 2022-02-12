import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import '../../../store/modules/ui.dart';
import '../../../utils/app_colors.dart';

class SettingsLangSetterButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final String? selectedWhenLangEquals; // where null = auto
  final bool isAr;

  const SettingsLangSetterButton(
      {required this.text,
      required this.selectedWhenLangEquals,
      required this.onPressed,
      this.isAr = false,
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
                  Expanded(
                    child: Text(
                      text,
                      style: TextStyle(
                        fontFamily: isAr ? "Noto Kufi Arabic" : null,
                        fontSize: 16,
                        color: theme.primaryColorDark,
                      ),
                    ),
                  ),
                  Observer(builder: (_) {
                    return Icon(
                      selectedWhenLangEquals == uiStore.locale
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
