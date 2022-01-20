import 'package:swagger_dart_code_generator/src/extensions/file_name_extensions.dart';
import 'package:swagger_dart_code_generator/src/models/generator_options.dart';

///Generates index file content, converter and additional methods
class SwaggerAdditionsGenerator {
  ///Generates index.dart for all generated services
  String generateIndexes(Map<String, List<String>> buildExtensions) {
    final importsList = buildExtensions.keys.map((String key) {
      final fileName = key
          .split('/')
          .last
          .replaceAll('-', '_')
          .replaceAll('.json', '.swagger');
      final className = getClassNameFromFileName(key.split('/').last);

      return 'export \'$fileName.dart\' show $className;';
    }).toList();

    importsList.sort();

    return importsList.join('\n');
  }

  ///Generated imports for concrete service
  String generateImportsContent(
    String swaggerFileName,
    bool hasModels,
    bool buildOnlyModels,
    bool hasEnums,
    bool separateModels,
  ) {
    final result = StringBuffer();

    final chopperPartImport =
        buildOnlyModels ? '' : "part '$swaggerFileName.swagger.g.dart';";

    final chopperImports = buildOnlyModels
        ? ''
        : '''import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';''';

    final enumsImport = hasEnums
        ? "import '$swaggerFileName.enums.swagger.dart' as enums;"
        : '';

    final enumsExport =
        hasEnums ? "export '$swaggerFileName.enums.swagger.dart';" : '';

    if (hasModels && !separateModels) {
      result.writeln("""
import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';

""");
    }

    if (hasModels && separateModels) {
      result.write("import '$swaggerFileName.models.swagger.dart';");
    }

    if (chopperImports.isNotEmpty) {
      result.write(chopperImports);
    }
    if (enumsImport.isNotEmpty) {
      result.write(enumsImport);
    }

    if (enumsExport.isNotEmpty) {
      result.write(enumsExport);
    }

    if (hasModels && separateModels) {
      result.write("export '$swaggerFileName.models.swagger.dart';");
    }

    result.write('\n\n');

    if (chopperPartImport.isNotEmpty) {
      result.write(chopperPartImport);
    }
    if (hasModels && !separateModels) {
      result.write("part '$swaggerFileName.swagger.g.dart';");
    }

    return result.toString();
  }

  ///Additional method to convert date to json
  String generateDateToJson() {
    return '''
// ignore: unused_element
String? _dateToJson(DateTime? date) {
  if(date == null)
  {
    return null;
  }
  
  final year = date.year.toString();
  final month = date.month < 10 ? '0\${date.month}' : date.month.toString();
  final day = date.day < 10 ? '0\${date.day}' : date.day.toString();

  return '\$year-\$month-\$day';
  }
''';
  }
}
