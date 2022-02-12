import 'package:flutter_test/flutter_test.dart';
import 'package:seaal_water_schedule_app/store/modules/schedules.dart';
import 'package:seaal_water_schedule_app/utils/enums.dart';

void main() {
  test(
      "fetchTownSchedule shoudld get data from the api and store it in the state",
      () async {
    final scheduleStore = Schedules();

    await scheduleStore.fetchTownSchedule(
      townCode: 16001,
      targetSchedule: TargetSchedule.current,
    ); // alger
    expect(scheduleStore.schedules.containsKey(16001), true);
  });

  // test(
  //     "fetchTownSchedule should return NotFoundShedule object when enountering a 404 status",
  //     () async {
  //   final scheduleStore = Schedules();

  //   final response = await scheduleStore.fetchTownSchedule(
  //     townCode: 16001,
  //     targetSchedule: TargetSchedule.current,
  //   );
  // });
}
