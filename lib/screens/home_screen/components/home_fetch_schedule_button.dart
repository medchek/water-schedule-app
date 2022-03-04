import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import '../../../router/app_router.gr.dart';
import '../../../utils/enums.dart';
import '../../../store/modules/schedules.dart';
import '../../../store/modules/towns.dart';
import '../../../store/modules/wilayas.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FetchScheduleButton extends StatelessWidget {
  const FetchScheduleButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final wilayaStore = Provider.of<Wilayas>(context);
    final townStore = Provider.of<Towns>(context);
    final scheduleStore = Provider.of<Schedules>(context);

    void handleOnPress() async {
      final townCode = townStore.selectedTown;
      if (townCode != null) {
        scheduleStore.setTargetSchedule(TargetSchedule.current);
        scheduleStore.fetchTownSchedule(
            townCode: townCode, targetSchedule: TargetSchedule.current);
        AutoRouter.of(context).push(const ScheduleRouter());
      }
    }

    // responsivity
    final bool isSmHight = MediaQuery.of(context).size.height <= 640;
    final double buttonHeight = isSmHight ? 40 : 45;
    final double marginX = isSmHight ? 60 : 50;

    return Observer(builder: (_) {
      final isDisabled = (wilayaStore.selectedWilaya == null ||
          townStore.selectedTown == null);

      return Container(
        margin: EdgeInsets.symmetric(horizontal: marginX),
        height: buttonHeight,
        child: ElevatedButton(
            onPressed: isDisabled ? null : handleOnPress,
            style: ElevatedButton.styleFrom(
              primary: theme.primaryColorDark,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              t.homeFetchSchedule,
              style: const TextStyle(fontSize: 16),
            )),
      );
    });
  }
}
