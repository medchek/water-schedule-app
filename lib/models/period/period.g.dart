// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'period.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Period _$PeriodFromJson(Map<String, dynamic> json) => Period(
      from: Time.fromJson(json['from'] as Map<String, dynamic>),
      to: Time.fromJson(json['to'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PeriodToJson(Period instance) => <String, dynamic>{
      'from': instance.from.toJson(),
      'to': instance.to.toJson(),
    };
