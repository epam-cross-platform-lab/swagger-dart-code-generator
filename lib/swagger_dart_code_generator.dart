import 'dart:convert';

import 'package:build/build.dart';
import 'package:swagger_dart_code_generator/src/extensions/file_name_extensions.dart';
import 'package:swagger_dart_code_generator/src/extensions/yaml_extensions.dart';
import 'package:swagger_dart_code_generator/src/models/generator_options.dart';
import 'package:swagger_dart_code_generator/src/swagger_code_generator.dart';
import 'package:universal_io/io.dart';
import 'package:dart_style/dart_style.dart';
import 'package:path/path.dart' show join, normalize;
import 'package:http/http.dart' as http;
import 'package:yaml/yaml.dart';

///Returns instance of SwaggerDartCodeGenerator
SwaggerDartCodeGenerator swaggerCodeBuilder(BuilderOptions options) =>
    SwaggerDartCodeGenerator(options);

const _inputFileExtensions = ['.swagger', '.json', '.yaml'];

const String _outputFileExtension = '.swagger.dart';
const String _outputEnumsFileExtension = '.enums.swagger.dart';
const String _outputModelsFileExtension = '.models.swagger.dart';
const String _outputResponsesFileExtension = '.responses.swagger.dart';
const String _indexFileName = 'client_index.dart';
const String _mappingFileName = 'client_mapping.dart';
const kAdditionalResult = 'swagger_dart_code_generator_temp.dart';

String normal(String path) {
  return AssetId('', path).path;
}

Map<String, List<String>> _generateExtensions(GeneratorOptions options) {
  final result = <String, Set<String>>{};

  final filesList = Directory(normalize(options.inputFolder)).listSync().where(
      (FileSystemEntity file) =>
          _inputFileExtensions.any((ending) => file.path.endsWith(ending)));

  final additionalResultPath = '${options.inputFolder}$kAdditionalResult';

  File(additionalResultPath).createSync();

  var out = normalize(options.outputFolder);

  final allFilesPaths = [
    ...options.inputUrls,
    ...filesList.map((e) => e.path),
  ];

  result[additionalResultPath] = {};

  for (var url in allFilesPaths) {
    final name = getFileNameBase(url.split('/').last);

    result[additionalResultPath]!.add(join(out, '$name$_outputFileExtension'));
    result[additionalResultPath]!
        .add(join(out, '$name$_outputEnumsFileExtension'));
    result[additionalResultPath]!
        .add(join(out, '$name$_outputModelsFileExtension'));
    result[additionalResultPath]!
        .add(join(out, '$name$_outputResponsesFileExtension'));
  }

  for (var url in options.inputUrls) {
    result[additionalResultPath]!
        .add(join(normalize(options.inputFolder), url.split('/').last));
  }

  ///Register additional outputs in first input
  result[additionalResultPath]!.add(join(out, _indexFileName));
  result[additionalResultPath]!.add(join(out, _mappingFileName));
  print(jsonEncode(allFilesPaths));

  return result.map((key, value) => MapEntry(key, value.toList()));
}

///Root library entry
class SwaggerDartCodeGenerator implements Builder {
  SwaggerDartCodeGenerator(BuilderOptions builderOptions) {
    options = GeneratorOptions.fromJson(builderOptions.config);
  }

  @override
  Map<String, List<String>> get buildExtensions =>
      _buildExtensionsCopy ??= _generateExtensions(options);

  Map<String, List<String>>? _buildExtensionsCopy;

  late GeneratorOptions options;

  final DartFormatter _formatter = DartFormatter();

  @override
  Future<void> build(BuildStep buildStep) async {
    for (final url in options.inputUrls) {
      final fileNameWithExtension = url.split('/').last.replaceAll('-', '_');

      final contents = await _download(url);

      await buildStep.writeAsString(
          AssetId(
            buildStep.inputId.package,
            join(options.inputFolder, fileNameWithExtension),
          ),
          contents);
    }

    final filesList = Directory(normalize(options.inputFolder))
        .listSync()
        .where((FileSystemEntity file) =>
            _inputFileExtensions.any((ending) => file.path.endsWith(ending)))
        .map((e) => e.path)
        .toList();

    await _generateAndWriteFiles(buildStep, filesList);

    final additionalResultPath = '${options.inputFolder}$kAdditionalResult';

    File(additionalResultPath).deleteSync();
  }

  Future<void> _generateAndWriteFiles(
      BuildStep buildStep, List<String> urls) async {
    for (final url in urls) {
      final file = File(url);
      var contents = await file.readAsString();

      Map<String, dynamic> contentMap;

      if (url.endsWith('.yaml')) {
        final t = loadYaml(contents) as YamlMap;
        contentMap = t.toMap();
      } else {
        contentMap = jsonDecode(contents) as Map<String, dynamic>;
      }

      final fileNameWithExtension = url.split('/').last.replaceAll('-', '_');

      final fileNameWithoutExtension = getFileNameBase(fileNameWithExtension);

      await _generateAndWriteFile(
        contents: contentMap,
        buildStep: buildStep,
        fileNameWithExtension: fileNameWithExtension,
        fileNameWithoutExtension: fileNameWithoutExtension,
      );
    }

    await _generateAdditionalFiles(
      buildStep.inputId,
      buildStep,
      true,
      urls,
    );

    return;
  }

  Future<void> _generateAndWriteFile({
    required Map<String, dynamic> contents,
    required String fileNameWithoutExtension,
    required String fileNameWithExtension,
    required BuildStep buildStep,
  }) async {
    final codeGenerator = SwaggerCodeGenerator();

    final models = codeGenerator.generateModels(
        contents, getFileNameWithoutExtension(fileNameWithExtension), options);

    final responses = codeGenerator.generateResponses(
        contents, getFileNameWithoutExtension(fileNameWithExtension), options);

    final requestBodies = codeGenerator.generateRequestBodies(
        contents, getFileNameWithoutExtension(fileNameWithExtension), options);

    final enums = codeGenerator.generateEnums(
        contents, getFileNameWithoutExtension(fileNameWithExtension));

    final imports = codeGenerator.generateImportsContent(
      fileNameWithoutExtension,
      models.isNotEmpty,
      options.buildOnlyModels,
      enums.isNotEmpty,
      options.separateModels,
    );

    final requests = codeGenerator.generateRequests(
        contents,
        getClassNameFromFileName(fileNameWithExtension),
        getFileNameWithoutExtension(fileNameWithExtension),
        options);

    final customDecoder = codeGenerator.generateCustomJsonConverter(
        getFileNameWithoutExtension(fileNameWithExtension), options);

    final dateToJson = codeGenerator.generateDateToJson();

    final copyAssetId = AssetId(
        buildStep.inputId.package,
        join(options.outputFolder,
            '$fileNameWithoutExtension$_outputFileExtension'));

    if (!options.separateModels || !options.buildOnlyModels) {
      await buildStep.writeAsString(
          copyAssetId,
          _generateFileContent(
              imports,
              requests,
              options.separateModels ? '' : models,
              options.separateModels ? '' : responses,
              options.separateModels ? '' : requestBodies,
              customDecoder,
              dateToJson));
    }

    if (enums.isNotEmpty) {
      ///Write enums
      final formatterEnums = _tryFormatCode(enums);

      final enumsAssetId = AssetId(
          buildStep.inputId.package,
          join(options.outputFolder,
              '$fileNameWithoutExtension$_outputEnumsFileExtension'));

      await buildStep.writeAsString(enumsAssetId, formatterEnums);
    }

    if (options.separateModels) {
      ///Write models to separate file
      final formattedModels = _tryFormatCode(_generateSeparateModelsFileContent(
        models,
        responses,
        requestBodies,
        fileNameWithoutExtension,
        enums.isNotEmpty,
      ));

      final enumsAssetId = AssetId(
          buildStep.inputId.package,
          join(options.outputFolder,
              '$fileNameWithoutExtension$_outputModelsFileExtension'));

      await buildStep.writeAsString(enumsAssetId, formattedModels);
    }
  }

  String _generateFileContent(
      String imports,
      String requests,
      String models,
      String responses,
      String requestBodies,
      String customDecoder,
      String dateToJson) {
    final result = """
$imports

${options.buildOnlyModels ? '' : requests}

$models

$responses

$requestBodies

${options.buildOnlyModels ? '' : customDecoder}

$dateToJson
""";

    return _tryFormatCode(result);
  }

  String _tryFormatCode(String code) {
    try {
      final formattedResult = _formatter.format(code);
      return formattedResult;
    } catch (e) {
      print('''[WARNING] Code formatting failed.
          Please raise an issue on https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/
          Reason: $e''');
      return code;
    }
  }

  Future<void> _generateAdditionalFiles(AssetId inputId, BuildStep buildStep,
      bool hasModels, List<String> allFiles) async {
    final codeGenerator = SwaggerCodeGenerator();

    final indexAssetId =
        AssetId(inputId.package, join(options.outputFolder, _indexFileName));

    final imports = codeGenerator.generateIndexes(allFiles);

    if (!options.buildOnlyModels) {
      await buildStep.writeAsString(indexAssetId, _formatter.format(imports));
    }

    if (options.withConverter && !options.buildOnlyModels) {
      final mappingAssetId = AssetId(
          inputId.package, join(options.outputFolder, _mappingFileName));

      final mapping = codeGenerator.generateConverterMappings(hasModels);

      await buildStep.writeAsString(mappingAssetId, _formatter.format(mapping));
    }
  }

  String _generateSeparateModelsFileContent(
    String models,
    String responses,
    String requestBodies,
    String fileNameWithoutExtension,
    bool hasEnums,
  ) {
    final enumsImport = hasEnums
        ? "import '$fileNameWithoutExtension.enums.swagger.dart' as enums;"
        : '';

    return '''
import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';
$enumsImport

    part '$fileNameWithoutExtension.models.swagger.g.dart';

    $models

    $responses

    $requestBodies
    ''';
  }
}

Future<String> _download(String url) async {
  var response = await http.get(Uri.parse(url));

  return response.body;
}
