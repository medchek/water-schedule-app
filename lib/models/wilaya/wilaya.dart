import 'package:json_annotation/json_annotation.dart';
import '../../utils/select_input_data_interface.dart';

part 'wilaya.g.dart';

@JsonSerializable()
class Wilaya implements SelectInputDataInterface {
  @override
  final String name;
  @override
  final String arName;
  @override
  final int code;

  const Wilaya({
    required this.name,
    required this.arName,
    required this.code,
  });

  factory Wilaya.fromJson(Map<String, dynamic> json) => _$WilayaFromJson(json);

  Map<String, dynamic> toJson() => _$WilayaToJson(this);
}
