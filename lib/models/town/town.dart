import 'package:json_annotation/json_annotation.dart';
import '../../utils/select_input_data_interface.dart';

part 'town.g.dart';

@JsonSerializable()
class Town implements SelectInputDataInterface {
  @override
  final String name;
  @override
  final String arName;
  @override
  final int code;
  @JsonKey(name: "wilayaId")
  final int wilayaCode;

  const Town({
    required this.name,
    required this.arName,
    required this.code,
    required this.wilayaCode,
  });

  factory Town.fromJson(Map<String, dynamic> json) => _$TownFromJson(json);

  Map<String, dynamic> toJson() => _$TownToJson(this);
}
