import 'package:json_annotation/json_annotation.dart';

part 'item_schema.g2.dart';

@JsonSerializable()
class ItemSchema {
  ItemSchema({this.originalRef = '', this.ref = '', this.type = ''});

  factory ItemSchema.fromJson(Map<String, dynamic> json) =>
      _$ItemSchemaFromJson(json);

  @JsonKey(name: 'originalRef', defaultValue: '')
  final String originalRef;

  @JsonKey(name: '\$ref', defaultValue: '')
  final String ref;

  @JsonKey(name: 'type', defaultValue: '')
  final String type;

  Map<String, dynamic> toJson() => _$ItemSchemaToJson(this);
}
