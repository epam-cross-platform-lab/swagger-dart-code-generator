import 'package:json_annotation/json_annotation.dart';

part 'swagger_request_items.g2.dart';

@JsonSerializable()
class SwaggerRequestItems {
  SwaggerRequestItems({this.type = '', this.enumValues = const []});

  factory SwaggerRequestItems.fromJson(Map<String, dynamic> json) =>
      _$SwaggerRequestItemsFromJson(json);

  @JsonKey(name: 'type', defaultValue: '')
  String type;

  @JsonKey(name: 'enum', defaultValue: [])
  List<String> enumValues;

  Map<String, dynamic> toJson() => _$SwaggerRequestItemsToJson(this);
}
