import 'package:swagger_dart_code_generator/src/swagger_models/responses/item_schema.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/responses/response_schema.dart';

class SwaggerResponse {
  SwaggerResponse(
      {this.code,
      this.description,
      this.type,
      this.schema,
      this.enumValue,
      this.content,
      this.ref});

  SwaggerResponse.fromJson(Map<String, dynamic> json)
      : code = json['code'] as String,
        ref = json['\$ref'] as String,
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
  String ref;
  String description;
  String type;
  ResponseSchema schema;
  List<String> enumValue;
  List<Content> content;
}

class Content {
  Content({this.items, this.ref, this.responseType, this.type});

  Content.fromJson(this.type, Map<dynamic, dynamic> json)
      : responseType =
            json['schema'] != null ? json['schema']['type'] as String : '',
        items = json['schema'] != null && json['schema']['items'] != null
            ? ItemSchema.fromJson(
                json['schema']['items'] as Map<String, dynamic>)
            : null,
        ref = json['schema'] != null ? json['schema']['\$ref'] as String : null;

  final String responseType;
  final String type;
  final ItemSchema items;
  final String ref;
}
