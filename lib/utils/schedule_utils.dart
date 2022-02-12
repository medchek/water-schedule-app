import 'enums.dart';

class ScheduleUtils {
  /// returns the schedule key value @example: 16001-current or 16001-next
  static String getScheduleKey(
      {required int townCode, required TargetSchedule targetSchedule}) {
    final scheduleKey =
        targetSchedule == TargetSchedule.current ? "current" : "next";
    return "$townCode-$scheduleKey";
  }
}
