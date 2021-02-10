import 'package:swagger_dart_code_generator/src/definitions.dart';
import 'package:recase/recase.dart';
import 'package:swagger_dart_code_generator/src/extensions/file_name_extensions.dart';

class SwaggerAdditionsGenerator {
  static const String mappingVariableName = 'generatedMapping';

  String generateIndexes(Map<String, List<String>> buildExtensions) {
    final importsList = buildExtensions.keys.map((String key) {
      final fileName = key.split('/').last.replaceAll('-', '_');
      final className = getClassNameFromFileName(key.split('/').last);

      return 'export \'$fileName.dart\' show $className;';
    }).toList();

    importsList.sort();

    return importsList.join('\n');
  }

  String generateConverterMappings(
      Map<String, List<String>> buildExtensions, bool hasModels) {
    if (!hasModels) {
      return '';
    }

    final maps = StringBuffer();
    final imports = <String>[];
    buildExtensions.keys.forEach((String key) {
      final className =
          "${getClassNameFromFileName(key.split('/').last)}$converterClassEnding";

      final fileName = key.split('/').last;
      maps.writeln('  ...$className,');
      imports.add("import '$fileName.dart';");
    });

    imports.sort();

    final mapping = '''
${imports.join('\n')}

final Map<Type, Object Function(Map<String, dynamic>)> $mappingVariableName = {
$maps};
''';

    return mapping;
  }

  String generateImportsContent(String swaggerFileName, bool hasModels,
      bool buildOnlyModels, bool hasEnums) {
    final result = StringBuffer();

    final chopperPartImport =
        buildOnlyModels ? '' : "part '$swaggerFileName.swagger.chopper.dart';";

    final chopperImports = buildOnlyModels
        ? ''
        : '''import 'package:chopper/chopper.dart';
import 'package:chopper/chopper.dart' as chopper;''';

    final enumsImport = hasEnums
        ? "import '$swaggerFileName.enums.swagger.dart' as enums;"
        : '';

    final enumsExport =
        hasEnums ? "export '$swaggerFileName.enums.swagger.dart';" : '';

    result.writeln("""
import 'package:json_annotation/json_annotation.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';""");

    if (chopperImports.isNotEmpty) {
      result.write(chopperImports);
    }
    if (enumsImport.isNotEmpty) {
      result.write(enumsImport);
    }

    if (enumsExport.isNotEmpty) {
      result.write(enumsExport);
    }

    result.write('\n\n');

    if (chopperPartImport.isNotEmpty) {
      result.write(chopperPartImport);
    }
    if (hasModels) {
      result.write("part '$swaggerFileName.swagger.g.dart';");
    }

    return result.toString();
  }

  String generateDateToJson(String formatter) {
    return '''
String _dateToJson(DateTime date)
{
  final dateFormatter = DateFormat('$formatter');
  return dateFormatter.format(date);
}
''';
  }

  String generateCustomJsonConverter(String fileName, bool hasModels) {
    if (!hasModels) {
      return '';
    }

    return '''
typedef JsonFactory<T> = T Function(Map<String, dynamic> json);

class CustomJsonDecoder {
  CustomJsonDecoder(this.factories);

  final Map<Type, JsonFactory> factories;

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
    if (jsonFactory == null || jsonFactory is! JsonFactory<T>) {
      return throw "Could not find factory for type \$T. Is '\$T: \$T.fromJsonFactory' included in the CustomJsonDecoder instance creation in bootstrapper.dart?";
    }

    return jsonFactory(values) as T;
  }

  List<T> _decodeList<T>(Iterable values) =>
      values.where((v) => v != null).map<T>((v) => decode<T>(v) as T).toList();
}

class JsonSerializableConverter extends chopper.JsonConverter {
  @override
  chopper.Response<ResultType> convertResponse<ResultType, Item>(chopper.Response response) {
    if (response.bodyString.isEmpty) {
      // In rare cases, when let's say 204 (no content) is returned -
      // we cannot decode the missing json with the result type specified
      return chopper.Response(response.base, null, error: response.error);
    }

    final jsonRes = super.convertResponse(response);
    return jsonRes.copyWith<ResultType>(
        body: jsonDecoder.decode<Item>(jsonRes.body) as ResultType);
  }
}

final jsonDecoder = CustomJsonDecoder(${fileName.pascalCase}JsonDecoderMappings);
    ''';
  }
}
