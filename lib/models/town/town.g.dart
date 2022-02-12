// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'town.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Town _$TownFromJson(Map<String, dynamic> json) => Town(
      name: json['name'] as String,
      arName: json['arName'] as String,
      code: json['code'] as int,
      wilayaCode: json['wilayaId'] as int,
    );

Map<String, dynamic> _$TownToJson(Town instance) => <String, dynamic>{
      'name': instance.name,
      'arName': instance.arName,
      'code': instance.code,
      'wilayaId': instance.wilayaCode,
    };
