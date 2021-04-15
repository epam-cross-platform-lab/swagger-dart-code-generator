import 'package:json_annotation/json_annotation.dart';

part 'item_schema.g.dart';

@JsonSerializable()
class ItemSchema {
  ItemSchema({this.originalRef = '', this.ref = '', this.type = ''});

  factory ItemSchema.fromJson(Map<String, dynamic> json) =>
      _$ItemSchemaFromJson(json);

  @JsonKey(name: 'originalRef')
  final String originalRef;

  @JsonKey(name: '\$ref')
  final String ref;

  @JsonKey(name: 'type')
  final String type;

  Map<String, dynamic> toJson() => _$ItemSchemaToJson(this);
}
