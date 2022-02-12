import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../store/modules/schedules.dart';
import '../../../store/modules/towns.dart';
import '../../../utils/app_colors.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ScheduleFetchFailed extends StatelessWidget {
  const ScheduleFetchFailed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    final scheduleStore = Provider.of<Schedules>(context);
    final townStore = Provider.of<Towns>(context);

    void retryFetch() {
      scheduleStore.fetchTownSchedule(
          townCode: townStore.selectedTown!,
          targetSchedule: scheduleStore.targetSchedule);
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            // "Le programme d'eau n'a pa pu être chargé, veuillez verifier votre connexion ou veillez reéssayer ultérieurement.",
            t.secheduleFetchFail,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, color: AppColors.appError),
          ),
          IconButton(
              iconSize: 30,
              splashRadius: 25,
              onPressed: retryFetch,
              icon: Icon(
                Icons.refresh,
                color: Theme.of(context).errorColor,
                // size: 30,
              ))
        ],
      ),
    );
  }
}
