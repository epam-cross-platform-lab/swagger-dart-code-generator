import 'package:json_annotation/json_annotation.dart';

part 'swagger_request_items.g.dart';

@JsonSerializable()
class SwaggerRequestItems {
  SwaggerRequestItems({this.type = '', this.enumValues = const []});

  
  @JsonKey(name: 'type', defaultValue: '')
  String type;

  @JsonKey(name: 'enum', defaultValue: [])
  List<String> enumValues;

  Map<String, dynamic> toJson() => _$SwaggerRequestItemsToJson(this);

  factory SwaggerRequestItems.fromJson(Map<String, dynamic> json) =>
      _$SwaggerRequestItemsFromJson(json);

}
