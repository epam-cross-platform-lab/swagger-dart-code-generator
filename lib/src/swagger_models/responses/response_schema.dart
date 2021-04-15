import 'package:json_annotation/json_annotation.dart';
import 'item_schema.dart';

part 'response_schema.g.dart';

@JsonSerializable()
class ResponseSchema {
  ResponseSchema(
      {this.type = '', this.originalRef = '', this.enumValue = const [], this.items, this.ref = ''});

  factory ResponseSchema.fromJson(Map<String, dynamic> json) =>
      _$ResponseSchemaFromJson(json);

  @JsonKey(name: 'type')
  String type;

  @JsonKey(name: 'originalRef')
  String originalRef;

  @JsonKey(name: '\$ref')
  String ref;

  @JsonKey(name: 'enum')
  List<String> enumValue;

  @JsonKey(name: 'items')
  ItemSchema? items;

  Map<String, dynamic> toJson() => _$ResponseSchemaToJson(this);
}
