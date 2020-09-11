import 'dart:convert';
import 'package:swagger_generator/src/code_generators/swagger_enums_generator.dart';
import 'package:swagger_generator/src/extensions/string_extension.dart';
import 'package:swagger_generator/src/swagger_models/v2/requests/swagger_request.dart';
import 'package:swagger_generator/src/swagger_models/v2/requests/swagger_request_parameter.dart';
import 'package:swagger_generator/src/swagger_models/v2/swagger_path.dart';
import 'package:swagger_generator/src/swagger_models/v2/swagger_root.dart';
import 'package:meta/meta.dart';

class SwaggerEnumsGeneratorV2 implements SwaggerEnumsGenerator {
  static const String defaultEnumFieldName = 'VALUE_';

  @override
  String generate(String swagger, String fileName) {
    final List<String> enumNames = <String>[];
    final StringBuffer result = StringBuffer();
    final Map<String, dynamic> map =
        jsonDecode(swagger) as Map<String, dynamic>;
    final SwaggerRoot swaggerRoot = SwaggerRoot.fromJson(map);

    for (int i = 0; i < swaggerRoot.paths.length; i++) {
      final SwaggerPath swaggerPath = swaggerRoot.paths[i];

      for (int j = 0; j < swaggerPath.requests.length; j++) {
        final SwaggerRequest swaggerRequest = swaggerPath.requests[j];

        if (swaggerRequest.parameters == null) {
          continue;
        }

        for (int p = 0; p < swaggerRequest.parameters.length; p++) {
          final SwaggerRequestParameter swaggerRequestParameter =
              swaggerRequest.parameters[p];

          if (enumNames.contains(swaggerRequestParameter.name)) {
            continue;
          }

          if (swaggerRequestParameter.schema?.enumValues != null) {
            final String enumContent = generateEnumContent(
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
    final String enumValuesContent = getEnumValuesContent(enumValues);

    final String result = """
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
    final String result = enumValues
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

    final String result = name
        .replaceAll(RegExp('[ -.,]'), '_')
        .split('_')
        .map((String word) => word.toLowerCase().capitalize)
        .join();

    return result.lower;
  }
}
