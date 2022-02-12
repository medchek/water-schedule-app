import 'package:json_annotation/json_annotation.dart';
import '../../utils/time_fromatter.dart';

import '../time/time.dart';

part 'period.g.dart';

@JsonSerializable(explicitToJson: true)
class Period {
  final Time from;
  final Time to;

  Period({required this.from, required this.to});

  bool get isWaterUnavailable => from.hours == null && to.hours == null;

  factory Period.fromJson(Map<String, dynamic> json) => _$PeriodFromJson(json);

  Map<String, dynamic> toJson() => _$PeriodToJson(this);

  @override
  String toString() {
    if (from.hours == null && to.hours == null) {
      return "Coupure total";
    } else {
      return "de ${TimeFormatter.fromat(from.hours!, from.minutes)} à ${TimeFormatter.fromat(to.hours!, to.minutes)}";
    }
  }
}
