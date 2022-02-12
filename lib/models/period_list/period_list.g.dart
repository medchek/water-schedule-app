// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'period_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PeriodList _$PeriodListFromJson(Map<String, dynamic> json) => PeriodList(
      periodList: (json['periodList'] as List<dynamic>)
          .map((e) => Period.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PeriodListToJson(PeriodList instance) =>
    <String, dynamic>{
      'periodList': instance.periodList.map((e) => e.toJson()).toList(),
    };
