import 'package:swagger_dart_code_generator/src/code_generators/swagger_additions_generator.dart';
import 'package:swagger_dart_code_generator/src/definitions.dart';
import 'package:recase/recase.dart';
import 'package:swagger_dart_code_generator/src/extensions/file_name_extensions.dart';

class SwaggerAdditionsGeneratorV2 implements SwaggerAdditionsGenerator {
  static const String mappingVariableName = 'generatedMapping';

  @override
  String generateIndexes(Map<String, List<String>> buildExtensions) {
    final imports = StringBuffer();

    buildExtensions.keys.forEach((String key) {
      final fileName = key.split('/').last;
      final className = getClassNameFromFileName(key.split('/').last);

      imports.writeln("export '$fileName.dart' show $className;");
    });

    return imports.toString();
  }

  @override
  String generateConverterMappings(
      Map<String, List<String>> buildExtensions, bool hasModels) {
    if (!hasModels) {
      return '';
    }

    final maps = StringBuffer();
    final imports = StringBuffer();
    buildExtensions.keys.forEach((String key) {
      final className =
          "${getClassNameFromFileName(key.split('/').last)}$converterClassEnding";

      final fileName = key.split('/').last;
      maps.writeln('  ...$className,');
      imports.writeln("import '$fileName.dart';");
    });

    final mapping = '''
$imports

final Map<Type, Object Function(Map<String, dynamic>)> $mappingVariableName = {
$maps};
      ''';

    return mapping;
  }

  @override
  String generateImportsContent(String swaggerFileName, bool hasModels,
      bool buildOnlyModels, bool hasEnums) {
    final result = StringBuffer();

    final chopperImport =
        buildOnlyModels ? '' : "part '$swaggerFileName.swagger.chopper.dart';";

    final enumsImport = hasEnums
        ? 'import \'package:example/generated_code/example_swagger.enums.swagger.dart\' as enums;\n'
        : '';

    result.writeln("""import 'package:json_annotation/json_annotation.dart';
import 'package:chopper/chopper.dart';
import 'package:chopper/chopper.dart' as chopper;
import 'package:flutter/widgets.dart';

$enumsImport
$chopperImport""");

    if (hasModels) {
      result.writeln("""
part '$swaggerFileName.swagger.g.dart';""");
    }

    return result.toString();
  }

  @override
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
