import 'package:json_annotation/json_annotation.dart';

import '../period/period.dart';

part 'period_list.g.dart';

@JsonSerializable(
  explicitToJson: true,
)
class PeriodList {
  final List<Period> periodList;
  PeriodList({required this.periodList});

  int get length => periodList.length;

  bool get isWaterUnavailable =>
      periodList.length == 1 &&
      periodList[0].from.hours == null &&
      periodList[0].to.hours == null;

  /// factory.
  factory PeriodList.fromJson(Map<String, List<dynamic>> json) =>
      _$PeriodListFromJson(json);

  Map<String, dynamic> toJson() => _$PeriodListToJson(this);

  @override
  String toString() {
    String r = "";
    for (var i = 0; i < periodList.length; i++) {
      final singlePeriod = periodList[i];
      if (i == 0) {
        r = singlePeriod.toString();
      } else {
        r = "$r puis ${singlePeriod.toString()}";
      }
    }
    return r;
  }
}
