// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'week_schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeekSchedule _$WeekScheduleFromJson(Map<String, dynamic> json) => WeekSchedule(
      saturday: (json['saturday'] as List<dynamic>)
          .map((e) => Period.fromJson(e as Map<String, dynamic>))
          .toList(),
      sunday: (json['sunday'] as List<dynamic>)
          .map((e) => Period.fromJson(e as Map<String, dynamic>))
          .toList(),
      monday: (json['monday'] as List<dynamic>)
          .map((e) => Period.fromJson(e as Map<String, dynamic>))
          .toList(),
      tuesday: (json['tuesday'] as List<dynamic>)
          .map((e) => Period.fromJson(e as Map<String, dynamic>))
          .toList(),
      wednesday: (json['wednesday'] as List<dynamic>)
          .map((e) => Period.fromJson(e as Map<String, dynamic>))
          .toList(),
      thursday: (json['thursday'] as List<dynamic>)
          .map((e) => Period.fromJson(e as Map<String, dynamic>))
          .toList(),
      friday: (json['friday'] as List<dynamic>)
          .map((e) => Period.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WeekScheduleToJson(WeekSchedule instance) =>
    <String, dynamic>{
      'saturday': instance.saturday.map((e) => e.toJson()).toList(),
      'sunday': instance.sunday.map((e) => e.toJson()).toList(),
      'monday': instance.monday.map((e) => e.toJson()).toList(),
      'tuesday': instance.tuesday.map((e) => e.toJson()).toList(),
      'wednesday': instance.wednesday.map((e) => e.toJson()).toList(),
      'thursday': instance.thursday.map((e) => e.toJson()).toList(),
      'friday': instance.friday.map((e) => e.toJson()).toList(),
    };
