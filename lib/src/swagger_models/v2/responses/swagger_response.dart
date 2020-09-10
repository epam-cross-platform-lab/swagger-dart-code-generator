import 'package:swagger_generator/src/swagger_models/v2/responses/response_schema.dart';

class SwaggerResponse {
  SwaggerResponse(
      {this.code,
      this.description,
      this.type,
      this.schema,
      this.enumValue,
      this.content});

  SwaggerResponse.fromJson(Map<String, dynamic> json)
      : code = json['code'] as String,
        description = json['description'] as String,
        type = json['type'] as String,
        content = json['content'] == null
            ? null
            : (json['content'] as Map<String, dynamic>)
                .entries
                .map((MapEntry<dynamic, dynamic> entry) => Content.fromJson(
                    entry.key as String, entry.value as Map<dynamic, dynamic>))
                .toList(),
        schema = json.containsKey('schema')
            ? ResponseSchema.fromJson(json['schema'] as Map<String, dynamic>)
            : null;

  String code;
  String description;
  String type;
  ResponseSchema schema;
  List<String> enumValue;
  List<Content> content;
}

class Content {
  Content.fromJson(this.type, Map<dynamic, dynamic> json)
      : responseType =
            json['schema'] != null ? json['schema']['type'] as String : '';

  final String responseType;
  final String type;
}
