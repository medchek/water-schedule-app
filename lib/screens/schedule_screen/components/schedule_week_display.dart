import 'package:flutter/material.dart';
import '../../../models/period/period.dart';
import '../../../models/week_schedule/week_schedule.dart';
import 'schedule_no_water_all_week.dart';

import '../../../utils/period_info_interface.dart';
import 'schedule_day_display.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ScheduleWeekDisplay extends StatelessWidget {
  /// a null value will display an all-week non-available water schedule
  final WeekSchedule? schedule;
  const ScheduleWeekDisplay({required this.schedule, Key? key})
      : super(key: key);

  /// returns translated day
  String _getTranslatedDay({
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

  /// returns the translated period text and water availability status
  PeriodInfoInterface _getTranslatedPeriodText({
    required List<Period> periodList,
    required AppLocalizations t,
  }) {
    // if there is only one period and the period refer to unavailable water
    if (periodList.length == 1 && periodList[0].isWaterUnavailable) {
      return PeriodInfoInterface(
          text: t.waterUnavailable, isWaterUnavailable: true);
    } else {
      final from = periodList[0].from.toString();
      final to = periodList[0].to.toString();
      // single period display
      if (periodList.length == 1) {
        return PeriodInfoInterface(text: t.period(from, to));
      } else {
        // multiple period segments display
        final secondFrom = periodList[1].from.toString();
        final secondTo = periodList[1].to.toString();
        return PeriodInfoInterface(
            text: t.multiPeriod(from, to, secondFrom, secondTo));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations t = AppLocalizations.of(context)!;
    Widget scheduleDays() {
      final List<Widget> daysWidgets = [];

      schedule!.toMap().forEach((day, periodList) {
        final translatedDay = _getTranslatedDay(context: context, day: day);
        final translatedPeriodText =
            _getTranslatedPeriodText(periodList: periodList, t: t);

        daysWidgets.add(ScheduleDayDisplay(
          day: translatedDay,
          text: translatedPeriodText.text,
          isWaterUnavailable: translatedPeriodText.isWaterUnavailable,
        ));
      });
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: daysWidgets,
      );
    }

    return schedule == null ? const ScheduleNoWaterAllWeek() : scheduleDays();
  }
}
