import 'package:flutter/material.dart';
import 'package:basic_utils/basic_utils.dart';

import '../../utils/select_input_data_interface.dart';
import 'select_input_base.dart';
import '../../utils/app_colors.dart';

class SelectInput extends StatelessWidget {
  final List<SelectInputDataInterface>? items;
  final Function? onPress;
  final String hint;
  final bool disabled;
  final double borderRadius;
  final bool isLoading;
  final int? value;

  /// whether to display the code of town/wilaya next to the name
  final bool displayCode;
  // static const double _horizontalPadding = 5;

  const SelectInput(
      {Key? key,
      required this.items,
      required this.hint,
      this.value,
      this.onPress,
      this.isLoading = false,
      this.disabled = false,
      this.borderRadius = 10,
      this.displayCode = true})
      : super(key: key);
  //        child: ButtonTheme(
  //        alignedDropdown: true,

  @override
  Widget build(BuildContext context) {
    final String locale = Localizations.localeOf(context).toString();
    final theme = Theme.of(context);
    final bool isSmHight = MediaQuery.of(context).size.height <= 640;
    final bool isArLocale = locale == "ar";

    return SelectInputBase(
        ripple: true,
        child: DropdownButtonHideUnderline(
          child: DropdownButton<int>(
            isExpanded: true,
            // menuMaxHeight: 100,

            borderRadius: BorderRadius.circular(borderRadius),
            hint: Text(
              hint,
              style: TextStyle(
                fontFamily: isArLocale ? "Noto Kufi Arabic" : null,
                color: !disabled ? theme.primaryColor : AppColors.appGrey,
                fontSize: isSmHight ? 13 : 15,
              ),
            ),
            value: value,
            icon: Icon(
              Icons.expand_more,
              color: !disabled ? theme.primaryColor : AppColors.appGrey,
              size: isSmHight ? 30 : 35,
            ),
            elevation: 1,

            style: TextStyle(
              color: theme.primaryColor,
              fontSize: isSmHight ? 14 : 16,
            ),
            items: items!.map(
              (item) {
                return DropdownMenuItem(
                  enabled: !disabled,
                  value: item.code,
                  child: Text(
                    "${displayCode ? item.code.toString() + ' - ' : ''}${locale == "ar" ? item.arName : StringUtils.capitalize(item.name)}",
                    style: TextStyle(
                        fontFamily: isArLocale ? "Noto Kufi Arabic" : null),
                  ),
                );
              },
            ).toList(),
            // underline: const SizedBox(),
            onChanged: disabled
                ? null
                : (selected) {
                    onPress!(selected);
                  },
          ),
        ));
  }
}
