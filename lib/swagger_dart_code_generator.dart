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

String additionalResultPath = '';

String normal(String path) {
  return AssetId('', path).path;
}

String _getAdditionalResultPath(GeneratorOptions options) {
  final filesList = Directory(normalize(options.inputFolder)).listSync();

  if (filesList.isNotEmpty) {
    return filesList.first.path;
  }

  final urlList = options.inputUrls;
  if (urlList.isNotEmpty) {
    final path =
        normalize('${options.inputFolder}${getFileNameBase(urlList.first)}');
    File(path).createSync();
    return path;
  }

  return Directory(normalize(options.inputFolder)).listSync().first.path;
}

Map<String, List<String>> _generateExtensions(GeneratorOptions options) {
  final result = <String, Set<String>>{};

  final filesList = Directory(normalize(options.inputFolder)).listSync().where(
      (FileSystemEntity file) =>
          _inputFileExtensions.any((ending) => file.path.endsWith(ending)));

  additionalResultPath =
      _getAdditionalResultPath(options).replaceAll('\\', '/');

  File(additionalResultPath).createSync();

  var out = normalize(options.outputFolder);

  final allFilesPaths = [
    ...options.inputUrls,
    ...filesList.map((e) => e.path),
  ];

  result[additionalResultPath] = {};

  for (var url in allFilesPaths) {
    final name = removeFileExtension(getFileNameBase(url));

    result[additionalResultPath]!.add(join(out, '$name$_outputFileExtension'));
    result[additionalResultPath]!
        .add(join(out, '$name$_outputEnumsFileExtension'));
    result[additionalResultPath]!
        .add(join(out, '$name$_outputModelsFileExtension'));
    result[additionalResultPath]!
        .add(join(out, '$name$_outputResponsesFileExtension'));
  }

  ///Register additional outputs in first input
  result[additionalResultPath]!.add(join(out, _indexFileName));
  result[additionalResultPath]!.add(join(out, _mappingFileName));

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
      final fileNameWithExtension = getFileNameBase(url);

      final contents = await _download(url);

      final filePath = join(options.inputFolder, fileNameWithExtension);
      await File(filePath).create();
      await File(filePath).writeAsString(contents);
    }

    final filesList = Directory(normalize(options.inputFolder))
        .listSync()
        .where((FileSystemEntity file) =>
            _inputFileExtensions.any((ending) => file.path.endsWith(ending)))
        .map((e) => e.path)
        .toList();

    await _generateAndWriteFiles(buildStep, filesList);
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

      final fileNameWithExtension = getFileNameBase(url);

      final fileNameWithoutExtension =
          removeFileExtension(fileNameWithExtension);

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
        contents, removeFileExtension(fileNameWithExtension), options);

    final responses = codeGenerator.generateResponses(
        contents, removeFileExtension(fileNameWithExtension), options);

    final requestBodies = codeGenerator.generateRequestBodies(
        contents, removeFileExtension(fileNameWithExtension), options);

    final enums = codeGenerator.generateEnums(
        contents, removeFileExtension(fileNameWithExtension));

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
        removeFileExtension(fileNameWithExtension),
        options);

    final customDecoder = codeGenerator.generateCustomJsonConverter(
        removeFileExtension(fileNameWithExtension), options);

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
              options.separateModels ? '' : dateToJson));
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
        dateToJson,
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
    String dateToJson,
    bool hasEnums,
  ) {
    final enumsImport = hasEnums
        ? "import '$fileNameWithoutExtension.enums.swagger.dart' as enums;"
        : '';

    return '''
// ignore_for_file: type=lint

import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';
import 'dart:convert';
$enumsImport

    part '$fileNameWithoutExtension.models.swagger.g.dart';

    $models

    $responses

    $requestBodies

    $dateToJson
    ''';
  }
}

Future<String> _download(String url) async {
  var response = await http.get(Uri.parse(url));

  return response.body;
}
