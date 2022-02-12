import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import '../../../store/modules/schedules.dart';
import '../../../store/modules/towns.dart';
import '../../../utils/enums.dart';
import 'schedule_week_display.dart';
// import '../../../provides/schedule_provider.dart';
import 'schedule_fetch_fail.dart';
import 'schedule_not_added.dart';
import 'schedule_week_selector.dart';

class ScheduleContent extends StatelessWidget {
  const ScheduleContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final schedule = ref.watch(scheduleProvider);
    final townStore = Provider.of<Towns>(context);
    final scheduleStore = Provider.of<Schedules>(context);

    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const ScheduleWeekSelector(),
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Observer(
                  builder: (_) {
                    final schedule = scheduleStore.getTownSchedule(
                        townCode: townStore.selectedTown!,
                        targetSchedule: scheduleStore.targetSchedule);

                    switch (scheduleStore.status) {
                      case PromiseStatus.success:
                        if (schedule != null) {
                          // if the schedule is not null and data is not null
                          if (schedule.data != null) {
                            return ScheduleWeekDisplay(
                              schedule: schedule.data?.schedule,
                            );
                          } else {
                            return const ScheduleNotAdded();
                          }
                        } else {
                          return const ScheduleNotAdded();
                        }
                      case PromiseStatus.loading:
                        return const Center(child: CircularProgressIndicator());
                      case PromiseStatus.error:
                        return const ScheduleFetchFailed();
                      case PromiseStatus.init:
                        return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
