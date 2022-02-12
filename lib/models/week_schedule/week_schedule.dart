import 'package:json_annotation/json_annotation.dart';
import '../period/period.dart';

part 'week_schedule.g.dart';

@JsonSerializable(explicitToJson: true)
class WeekSchedule {
  final List<Period> saturday;
  final List<Period> sunday;
  final List<Period> monday;
  final List<Period> tuesday;
  final List<Period> wednesday;
  final List<Period> thursday;
  final List<Period> friday;

  WeekSchedule({
    required this.saturday,
    required this.sunday,
    required this.monday,
    required this.tuesday,
    required this.wednesday,
    required this.thursday,
    required this.friday,
  });

  Map<String, List<Period>> toMap() {
    // return {
    //   "Dimanche": sunday,
    //   "Lundi": monday,
    //   "Mardi": tuesday,
    //   "Mercredi": wednesday,
    //   "Jeudi": thursday,
    //   "Vendredi": friday,
    //   "Samedi": saturday
    // };
    return {
      "sunday": sunday,
      "monday": monday,
      "tuesday": tuesday,
      "wednesday": wednesday,
      "thursday": thursday,
      "friday": friday,
      "saturday": saturday
    };
  }

  factory WeekSchedule.fromJson(Map<String, dynamic> json) =>
      _$WeekScheduleFromJson(json);

  Map<String, dynamic> toJson() => _$WeekScheduleToJson(this);
}
