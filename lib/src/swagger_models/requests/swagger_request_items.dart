import 'package:json_annotation/json_annotation.dart';

part 'swagger_request_items.g2.dart';

@JsonSerializable()
class SwaggerRequestItems {
  SwaggerRequestItems({
    required this.type,
    required this.enumValues,
    required this.ref,
  });

  @JsonKey(name: 'type', defaultValue: '')
  String type;

  @JsonKey(name: 'enum', defaultValue: [])
  List<String> enumValues;

  @JsonKey(name: '\$ref', defaultValue: '')
  String ref;

  bool get hasRef => ref.isNotEmpty;

  Map<String, dynamic> toJson() => _$SwaggerRequestItemsToJson(this);

  factory SwaggerRequestItems.fromJson(Map<String, dynamic> json) =>
      _$SwaggerRequestItemsFromJson(json);
}
