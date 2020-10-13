import 'package:json_annotation/json_annotation.dart';

part 'parameter_item.g2.dart';

@JsonSerializable()
class ParameterItem {
  ParameterItem({this.type, this.enumValues, this.defaultValue});

  factory ParameterItem.fromJson(Map<String, dynamic> json) =>
      _$ParameterItemFromJson(json);

  @JsonKey(name: 'type')
  String type;

  @JsonKey(name: 'enum')
  List<String> enumValues;

  @JsonKey(name: 'default')
  String defaultValue;

  Map<String, dynamic> toJson() => _$ParameterItemToJson(this);
}
