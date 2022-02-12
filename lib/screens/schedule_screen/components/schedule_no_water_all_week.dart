import 'package:flutter/material.dart';
import 'schedule_day_display.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ScheduleNoWaterAllWeek extends StatelessWidget {
  const ScheduleNoWaterAllWeek({Key? key}) : super(key: key);

  static const List<String> _days = [
    "saturday",
    "sunday",
    "monday",
    "tuesday",
    "wednesday",
    "thursday",
    "firday"
  ];

  String _getTranslatedDaysList({
    required BuildContext context,
    required String day,
  }) {
    final t = AppLocalizations.of(context)!;
    switch (day) {
      case "saturday":
        return t.saturday;
      case "sunday":
        return t.sunday;
      case "monday":
        return t.monday;
      case "tuesday":
        return t.tuesday;
      case "wednesday":
        return t.wednesday;
      case "thursday":
        return t.thursday;
      case "friday":
        return t.firday;
      default:
        return "unset";
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: _days
          .map((day) => ScheduleDayDisplay(
                day: _getTranslatedDaysList(context: context, day: day),
                text: t.waterUnavailable,
                isWaterUnavailable: true,
              ))
          .toList(),
    );
  }
}
