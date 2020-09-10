import 'package:swagger_generator/src/code_generators/swagger_additions_generator.dart';
import 'package:swagger_generator/src/definitions.dart';
import 'package:swagger_generator/src/extensions/file_name_extensions.dart';
import 'package:meta/meta.dart';

class SwaggerAdditionsGeneratorV2 implements SwaggerAdditionsGenerator {
  static const String mappingVariableName = 'generatedMapping';

  @override
  String generateIndexes(Map<String, List<String>> buildExtensions) {
    final StringBuffer imports = StringBuffer();

    buildExtensions.keys.forEach((String key) {
      final String fileName = key.split('/').last;
      final String className = getClassNameFromFileName(key.split('/').last);

      imports.writeln("import '$fileName.dart' show $className;");
    });

    return imports.toString();
  }

  @override
  String generateConverterMappings(Map<String, List<String>> buildExtensions) {
    final StringBuffer maps = StringBuffer();
    final StringBuffer imports = StringBuffer();
    buildExtensions.keys.forEach((String key) {
      final String className =
          "${getClassNameFromFileName(key.split('/').last)}$converterClassEnding";

      final String fileName = key.split('/').last;
      maps.writeln("  ...$className,");
      imports.writeln("import '$fileName.dart';");
    });

    final String mapping = """
$imports

final $mappingVariableName = {
$maps};
      """;

    return mapping;
  }

  @override
  String generateImportsContent(String swaggerFileName, bool hasModels) {
    final StringBuffer result = StringBuffer();

    result.writeln("""import 'package:json_annotation/json_annotation.dart';
import 'package:chopper/chopper.dart';
import 'package:flutter/widgets.dart';

part '$swaggerFileName.swagger.chopper.dart';""");

    if (hasModels) {
      result.writeln("""
part '$swaggerFileName.swagger.g.dart';""");
    }

    return result.toString();
  }
}
