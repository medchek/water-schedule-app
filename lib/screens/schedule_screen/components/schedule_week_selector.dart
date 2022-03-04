import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import '../../../store/modules/schedules.dart';
import '../../../store/modules/towns.dart';
import '../../../utils/enums.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ScheduleWeekSelector extends StatelessWidget {
  const ScheduleWeekSelector({Key? key}) : super(key: key);

  Widget _customButton({
    required String text,
    required VoidCallback onPress,
    required ThemeData theme,
    required BuildContext context,
    String? date,
    bool isLoading = false,
    bool isSelected = false,
  }) {
    final bool isSmHight = MediaQuery.of(context).size.height <= 640;

    return Expanded(
      child: Stack(
        children: [
          Container(
            height: isSmHight ? 50 : 70,
            width: double.infinity,
            decoration: BoxDecoration(
              border: BorderDirectional(
                bottom: isLoading
                    ? BorderSide.none
                    : BorderSide(
                        width: 3,
                        color: isSelected
                            ? theme.primaryColor
                            : theme.disabledColor),
              ),
            ),
            child: TextButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero),
                  ),
                ),
                onPressed: onPress,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // const SizedBox(
                    //   height: 5,
                    // ),
                    Text(
                      text,
                      style: TextStyle(
                        color: isSelected
                            ? theme.primaryColor
                            : theme.disabledColor,
                        fontSize: isSmHight ? 14 : 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    // date text
                    SizedBox(
                      height: 14,
                      child: date != null
                          ? Text(
                              date,
                              style: TextStyle(
                                fontSize: isSmHight ? 9 : 11,
                                color: theme.primaryColor,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          : Text(
                              "-",
                              style: TextStyle(
                                  color: isSelected
                                      ? theme.primaryColor
                                      : theme.disabledColor),
                            ),
                    )
                  ],
                )),
          ),
          if (isLoading)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: LinearProgressIndicator(
                backgroundColor: theme.primaryColorDark.withOpacity(0.2),
              ),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final townStore = Provider.of<Towns>(context);
    final scheduleStore = Provider.of<Schedules>(context);

    void setTargetSchedule(TargetSchedule targetSchedule) {
      if (scheduleStore.status == PromiseStatus.loading) return;
      if (scheduleStore.targetSchedule != targetSchedule) {
        // if the requested target schedule is next, call the api for its data in case if it's not loaded
        // NOTE: the current schedule is always looked for upon cliking the "trouver" button from the home screen
        if (targetSchedule == TargetSchedule.next &&
            scheduleStore.status != PromiseStatus.error) {
          final isTownScheduleInState = scheduleStore.getTownSchedule(
            townCode: townStore.selectedTown!,
            targetSchedule: targetSchedule,
          );
          // if the isTownScheduleInState is null,  the schedule has not been searched from the api yet
          // therefore call it
          if (isTownScheduleInState == null) {
            scheduleStore.fetchTownSchedule(
                townCode: townStore.selectedTown!,
                targetSchedule: targetSchedule);
          }
        }
        // set the target schedule in either cases
        scheduleStore.setTargetSchedule(targetSchedule);
      }
    }

    /// target schedule is needed to prevent the function from looking into the store
    /// when the the target schedule is not selected
    String? getTargetScheduleDate(TargetSchedule targetSchedule) {
      if (targetSchedule == scheduleStore.targetSchedule) {
        return scheduleStore.getCurrentScheduleDate(
          townCode: townStore.selectedTown!,
          targetSchedule: scheduleStore.targetSchedule,
        );
      }
      return null;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Observer(builder: (_) {
          return _customButton(
            context: context,
            text: t.currentWeek,
            isSelected: scheduleStore.targetSchedule == TargetSchedule.current,
            onPress: () => setTargetSchedule(TargetSchedule.current),
            theme: theme,
            isLoading: scheduleStore.status == PromiseStatus.loading &&
                scheduleStore.targetSchedule == TargetSchedule.current,
            date: scheduleStore.status == PromiseStatus.success
                ? getTargetScheduleDate(TargetSchedule.current)
                : null,
          );
        }),
        Observer(builder: (_) {
          return _customButton(
            context: context,
            isSelected: scheduleStore.targetSchedule == TargetSchedule.next,
            text: t.nextWeek,
            onPress: () => setTargetSchedule(TargetSchedule.next),
            theme: theme,
            isLoading: scheduleStore.status == PromiseStatus.loading &&
                scheduleStore.targetSchedule == TargetSchedule.next,
            date: scheduleStore.status == PromiseStatus.success
                ? getTargetScheduleDate(TargetSchedule.next)
                : null,
          );
        })
      ],
    );
  }
}
