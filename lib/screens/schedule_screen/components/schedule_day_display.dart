import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import '../../../utils/app_colors.dart';

class ScheduleDayDisplay extends StatelessWidget {
  final String day;
  final String text;
  final bool isWaterUnavailable;

  const ScheduleDayDisplay(
      {required this.day,
      required this.text,
      this.isWaterUnavailable = false,
      // required this.periodList,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String locale = Localizations.localeOf(context).toString();

    final theme = Theme.of(context);
    final bool isSmHight = MediaQuery.of(context).size.height <= 640;

    return Flexible(
      flex: 1,
      fit: FlexFit.tight,
      child: Container(
        // width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: theme.primaryColorLight,
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 100,
              height: 30,
              child: Align(
                alignment: locale == "ar"
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: Text(
                  day,
                  style: TextStyle(
                    color: theme.primaryColorDark,
                    fontWeight: FontWeight.w700,
                    fontSize: isSmHight ? 15 : 16,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Text(
                StringUtils.capitalize(text),
                style: TextStyle(
                  fontSize: isSmHight ? 13 : 15,
                  color: isWaterUnavailable
                      ? AppColors.appError
                      : theme.brightness == Brightness.light
                          ? theme.primaryColor
                          : const Color(0xffbdd1ff),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
