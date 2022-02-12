import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import '../../../store/modules/schedules.dart';
import '../../../store/modules/wilayas.dart';
import '../../../store/modules/towns.dart';
import '../../../utils/enums.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ScheduleNotAdded extends StatelessWidget {
  final bool isNextWeek;
  const ScheduleNotAdded({this.isNextWeek = false, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final bool isArLocale = Localizations.localeOf(context).toString() == "ar";
    final wilayaStore = Provider.of<Wilayas>(context);
    final townStore = Provider.of<Towns>(context);
    final scheduleStore = Provider.of<Schedules>(context);

    return Center(
      child: Observer(builder: (_) {
        final town = townStore.getTown(
          wilayaCode: wilayaStore.selectedWilaya!,
          townCode: townStore.selectedTown!,
        );

        final townName = (isArLocale ? town?.arName : town?.name) ?? "no-town";
        final week = scheduleStore.targetSchedule == TargetSchedule.current
            ? t.currentWeek
            : t.theNextWeek;

        return Text(
          // "Le programme d'eau de $week n'a pas encore été ajouté pour ${StringUtils.capitalize(townName)}.",
          t.scheduleNotAddedYet(week, StringUtils.capitalize(townName)),
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 16, color: Theme.of(context).primaryColorDark),
        );
      }),
    );
  }
}
