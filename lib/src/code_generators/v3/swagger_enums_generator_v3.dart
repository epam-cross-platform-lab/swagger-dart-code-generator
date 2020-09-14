import 'dart:convert';
import 'package:swagger_dart_code_generator/src/code_generators/swagger_enums_generator.dart';
import 'package:swagger_dart_code_generator/src/extensions/string_extension.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/v3/swagger_root.dart';
import 'package:meta/meta.dart';

class SwaggerEnumsGeneratorV3 implements SwaggerEnumsGenerator {
  static const String defaultEnumFieldName = 'VALUE_';

  @override
  String generate(String swagger, String fileName) {
    final enumNames = <String>[];
    final result = StringBuffer();
    final map = jsonDecode(swagger) as Map<String, dynamic>;
    final swaggerRoot = SwaggerRoot.fromJson(map);

    for (var i = 0; i < swaggerRoot.paths.length; i++) {
      final swaggerPath = swaggerRoot.paths[i];

      for (var j = 0; j < swaggerPath.requests.length; j++) {
        final swaggerRequest = swaggerPath.requests[j];

        if (swaggerRequest.parameters == null) {
          continue;
        }

        for (var p = 0; p < swaggerRequest.parameters.length; p++) {
          final swaggerRequestParameter = swaggerRequest.parameters[p];

          if (enumNames.contains(swaggerRequestParameter.name)) {
            continue;
          }

          if (swaggerRequestParameter.schema?.enumValues != null) {
            final enumContent = generateEnumContent(
                swaggerRequestParameter.name.capitalize,
                swaggerRequestParameter.schema?.enumValues);

            result.writeln(enumContent);
            enumNames.add(swaggerRequestParameter.name);
          }
        }
      }
    }

    return result.toString();
  }

  String generateEnumContent(String enumName, List<String> enumValues) {
    final enumValuesContent = getEnumValuesContent(enumValues);

    final result = """
enum $enumName{
\t@JsonValue('swaggerGeneratedUnknown')
\tswaggerGeneratedUnknown,
$enumValuesContent
}
 """;

    return result;
  }

  @visibleForTesting
  String getEnumValuesContent(List<String> enumValues) {
    final result = enumValues
        .map((String enumFieldName) =>
            "\t@JsonValue('$enumFieldName')\n\t${getValidatedEnumFieldName(enumFieldName)}")
        .join(',\n');

    return result;
  }

  @visibleForTesting
  String getValidatedEnumFieldName(String name) {
    if (name.startsWith(RegExp('[0-9]+'))) {
      name = defaultEnumFieldName + name;
    }

    final result = name
        .replaceAll(RegExp('[ -.,]'), '_')
        .split('_')
        .map((String word) => word.toLowerCase().capitalize)
        .join();

    return result.lower;
  }
}
