import 'package:json_annotation/json_annotation.dart';

import '../week_schedule/week_schedule.dart';

part 'schedule.g.dart';

@JsonSerializable(explicitToJson: true)
class Schedule {
  final WeekSchedule? schedule;
  final int scheduleCode;
  // final int year;
  final int townCode;
  // final int weekNumber;
  final String weekStart;
  final String weekEnd;

  Schedule({
    this.schedule,
    required this.scheduleCode,
    // required this.year,
    required this.townCode,
    // required this.weekNumber,
    required this.weekStart,
    required this.weekEnd,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) =>
      _$ScheduleFromJson(json);

  Map<String, dynamic> toJson() => _$ScheduleToJson(this);
}
