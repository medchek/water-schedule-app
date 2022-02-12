// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScheduleState _$ScheduleStateFromJson(Map<String, dynamic> json) =>
    ScheduleState(
      json['data'] == null
          ? null
          : Schedule.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ScheduleStateToJson(ScheduleState instance) =>
    <String, dynamic>{
      'data': instance.data?.toJson(),
    };
