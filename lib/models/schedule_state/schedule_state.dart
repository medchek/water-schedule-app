import 'package:json_annotation/json_annotation.dart';
import '../schedule/schedule.dart';

part 'schedule_state.g.dart';

@JsonSerializable(explicitToJson: true)
class ScheduleState {
  /// - if the data is null, the schedule was not found in the server.
  /// - if the data is not null but the schedule value inside data is null, the schedule is unavailable all week
  /// - if the data is not null and schedule value inside data is not null, the schedule is set and populated
  Schedule? data;

  ScheduleState(this.data);

  factory ScheduleState.fromJson(Map<String, dynamic> json) =>
      _$ScheduleStateFromJson(json);

  Map<String, dynamic> toJson() => _$ScheduleStateToJson(this);
}
