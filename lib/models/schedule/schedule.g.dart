// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Schedule _$ScheduleFromJson(Map<String, dynamic> json) => Schedule(
      schedule: json['schedule'] == null
          ? null
          : WeekSchedule.fromJson(json['schedule'] as Map<String, dynamic>),
      scheduleCode: json['scheduleCode'] as int,
      townCode: json['townCode'] as int,
      weekStart: json['weekStart'] as String,
      weekEnd: json['weekEnd'] as String,
    );

Map<String, dynamic> _$ScheduleToJson(Schedule instance) => <String, dynamic>{
      'schedule': instance.schedule?.toJson(),
      'scheduleCode': instance.scheduleCode,
      'townCode': instance.townCode,
      'weekStart': instance.weekStart,
      'weekEnd': instance.weekEnd,
    };
