import 'package:json_annotation/json_annotation.dart';
import '../../utils/time_fromatter.dart';

part 'time.g.dart';

@JsonSerializable()
class Time {
  final int? hours;
  final int? minutes;

  Time({this.hours, this.minutes});

  factory Time.fromJson(Map<String, dynamic> json) => _$TimeFromJson(json);

  Map<String, dynamic> toJson() => _$TimeToJson(this);

  @override
  String toString() {
    return TimeFormatter.fromat(hours, minutes);
  }
}
