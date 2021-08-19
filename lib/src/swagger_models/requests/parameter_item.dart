import 'package:json_annotation/json_annotation.dart';

part 'parameter_item.g2.dart';

@JsonSerializable()
class ParameterItem {
  ParameterItem(
      {this.type = '', this.enumValues = const [], this.defaultValue = ''});

  factory ParameterItem.fromJson(Map<String, dynamic> json) =>
      _$ParameterItemFromJson(json);

  @JsonKey(name: 'type', defaultValue: '')
  String type;

  @JsonKey(name: 'enum', defaultValue: [])
  List<String> enumValues;

  @JsonKey(name: 'default', defaultValue: '')
  String defaultValue;

  Map<String, dynamic> toJson() => _$ParameterItemToJson(this);
}
