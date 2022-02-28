import 'package:swagger_dart_code_generator/src/extensions/file_name_extensions.dart';
import 'package:swagger_dart_code_generator/src/models/generator_options.dart';

///Generates index file content, converter and additional methods
class SwaggerAdditionsGenerator {
  static const mappingVariableName = 'generatedMapping';

  ///Generates index.dart for all generated services
  String generateIndexes(List<String> fileNames) {
    final importsList = fileNames.map((key) {
      final fileName = key
          .split('/')
          .last
          .replaceAll('-', '_')
          .replaceAll('.json', '.swagger')
          .replaceAll('.yaml', '.swagger');
      final className = getClassNameFromFileName(key.split('/').last);

      return 'export \'$fileName.dart\' show $className;';
    }).toList();

    importsList.sort();

    return importsList.join('\n');
  }

  ///Generated Map of all models generated by generator
  String generateConverterMappings(bool hasModels) {
    return 'final Map<Type, Object Function(Map<String, dynamic>)> $mappingVariableName = {};';
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
        buildOnlyModels ? '' : "part '$swaggerFileName.swagger.chopper.dart';";

    final chopperImports = buildOnlyModels
        ? ''
        : '''import 'package:chopper/chopper.dart';
${buildOnlyModels ? '' : 'import \'dart:convert\';'}

import 'client_mapping.dart';
import 'package:chopper/chopper.dart' as chopper;''';

    final enumsImport = hasEnums
        ? "import '$swaggerFileName.enums.swagger.dart' as enums;"
        : '';

    final enumsExport =
        hasEnums ? "export '$swaggerFileName.enums.swagger.dart';" : '';

    if (hasModels && !separateModels) {
      result.writeln("""
// ignore_for_file: type=lint

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

  ///Copy-pasted converter from internet
  String generateCustomJsonConverter(
      String fileName, GeneratorOptions options) {
    if (!options.withConverter) {
      return '';
    }
    return '''
typedef \$JsonFactory<T> = T Function(Map<String, dynamic> json);

class \$CustomJsonDecoder {
  \$CustomJsonDecoder(this.factories);

  final Map<Type, \$JsonFactory> factories;

  dynamic decode<T>(dynamic entity) {
    if (entity is Iterable) {
      return _decodeList<T>(entity);
    }

    if (entity is T) {
      return entity;
    }

    if (entity is Map<String, dynamic>) {
      return _decodeMap<T>(entity);
    }

    return entity;
  }

  T _decodeMap<T>(Map<String, dynamic> values) {
    final jsonFactory = factories[T];
    if (jsonFactory == null || jsonFactory is! \$JsonFactory<T>) {
      return throw "Could not find factory for type \$T. Is '\$T: \$T.fromJsonFactory' included in the CustomJsonDecoder instance creation in bootstrapper.dart?";
    }

    return jsonFactory(values);
  }

  List<T> _decodeList<T>(Iterable values) =>
      values.where((v) => v != null).map<T>((v) => decode<T>(v) as T).toList();
}

class \$JsonSerializableConverter extends chopper.JsonConverter {
  @override
  chopper.Response<ResultType> convertResponse<ResultType, Item>(chopper.Response response) {
    if (response.bodyString.isEmpty) {
      // In rare cases, when let's say 204 (no content) is returned -
      // we cannot decode the missing json with the result type specified
      return chopper.Response(response.base, null, error: response.error);
    }

    final jsonRes = super.convertResponse(response);
    return jsonRes.copyWith<ResultType>(
        body: \$jsonDecoder.decode<Item>(jsonRes.body) as ResultType);
  }
}

final \$jsonDecoder = \$CustomJsonDecoder(generatedMapping);
    ''';
  }

  static String getChopperClientContent(
    String className,
    String host,
    String basePath,
    GeneratorOptions options,
  ) {
    final baseUrlString = options.withBaseUrl
        ? "baseUrl:  baseUrl ?? 'http://$host$basePath'"
        : '/*baseUrl: YOUR_BASE_URL*/';

    final converterString = options.withConverter
        ? 'converter: \$JsonSerializableConverter(),'
        : 'converter: chopper.JsonConverter(),';

    final chopperClientBody = '''
    if(client!=null){
      return _\$$className(client);
    }

    final newClient = ChopperClient(
      services: [_\$$className()],
      $converterString
      $baseUrlString);
    return _\$$className(newClient);
''';
    return chopperClientBody;
  }
}
