import 'package:json_annotation/json_annotation.dart';
import 'item_schema.dart';

part 'response_schema.g2.dart';

@JsonSerializable()
class ResponseSchema {
  ResponseSchema(
      {this.type = '',
      this.originalRef = '',
      this.enumValue = const [],
      this.properties = const {},
      this.items,
      this.ref = ''});

  factory ResponseSchema.fromJson(Map<String, dynamic> json) =>
      _$ResponseSchemaFromJson(json);

  @JsonKey(name: 'type', defaultValue: '')
  String type;

  @JsonKey(name: 'originalRef', defaultValue: '')
  String originalRef;

  @JsonKey(name: '\$ref', defaultValue: '')
  String ref;

  @JsonKey(name: 'enum', defaultValue: [])
  List<String> enumValue;

  @JsonKey(name: 'items')
  ItemSchema? items;

  @JsonKey(name: 'properties', defaultValue: {})
  Map<String, dynamic> properties;

  Map<String, dynamic> toJson() => _$ResponseSchemaToJson(this);
}
