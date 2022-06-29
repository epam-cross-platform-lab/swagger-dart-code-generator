import 'dart:convert';

import 'package:build/build.dart';
import 'package:swagger_dart_code_generator/src/extensions/file_name_extensions.dart';
import 'package:swagger_dart_code_generator/src/extensions/yaml_extensions.dart';
import 'package:swagger_dart_code_generator/src/models/generator_options.dart';
import 'package:swagger_dart_code_generator/src/swagger_code_generator.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/swagger_root.dart';
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
const String _outputSocketsFileExtension = '.sockets.swagger.dart';
const String _indexFileName = 'client_index.dart';
const String _mappingFileName = 'client_mapping.dart';
const String _socketsServiceFileName = 'sockets_service.dart';

String additionalResultPath = '';
String socketResultPath = '';
Set<String> allFiledList = {};
Set<String> socketFiles = {};

String normal(String path) {
  return AssetId('', path).path;
}

String _getAdditionalResultPath(GeneratorOptions options) {
  final filesList = Directory(normalize(options.inputFolder)).listSync();

  if (filesList.isNotEmpty) {
    return filesList.first.path;
  }

  if (options.inputUrls.isNotEmpty) {
    final path = normalize(
        '${options.inputFolder}${getFileNameBase(options.inputUrls.first)}');
    File(path).createSync();
    return path;
  }

  return Directory(normalize(options.inputFolder)).listSync().first.path;
}

String _getSocketResultPath(GeneratorOptions options) {
  final filesList = Directory(normalize(options.inputSocketsFolder)).listSync();

  if (filesList.isNotEmpty) {
    return filesList.first.path;
  } else {
    return '';
  }
}

Map<String, List<String>> _generateExtensions(GeneratorOptions options) {
  final result = <String, Set<String>>{};

  final filesList = Directory(normalize(options.inputFolder)).listSync().where(
      (FileSystemEntity file) =>
          _inputFileExtensions.any((ending) => file.path.endsWith(ending)));

  final socketsFilesList = Directory(normalize(options.inputSocketsFolder))
      .listSync()
      .where((FileSystemEntity file) =>
          _inputFileExtensions.any((ending) => file.path.endsWith(ending)));

  additionalResultPath =
      _getAdditionalResultPath(options).replaceAll('\\', '/');

  socketResultPath = _getSocketResultPath(options).replaceAll('\\', '/');

  File(additionalResultPath).createSync();

  var out = normalize(options.outputFolder);
  var outSockets = normalize(options.outputSocketsFolder);

  final filesPaths = filesList.map((e) => e.path.replaceAll('\\', '/'));
  final fileNames = filesList.map((e) => getFileNameBase(e.path));

  final socketFilesPaths =
      socketsFilesList.map((e) => e.path.replaceAll('\\', '/'));
  final socketFileNames = socketsFilesList.map((e) => getFileNameBase(e.path));

  allFiledList.addAll(filesPaths);
  allFiledList.addAll(options.inputUrls);
  socketFiles.addAll(socketFilesPaths);

  result[additionalResultPath] = {};
  result[socketResultPath] = {};

  for (var url in filesPaths) {
    final name = removeFileExtension(getFileNameBase(url));
    if (name == additionalResultPath) {
      continue;
    }

    result[url] = {};
    result[url]!.add(join(out, '$name$_outputFileExtension'));
    result[url]!.add(join(out, '$name$_outputEnumsFileExtension'));
    result[url]!.add(join(out, '$name$_outputModelsFileExtension'));
    result[url]!.add(join(out, '$name$_outputResponsesFileExtension'));
  }

  for (var url in socketFilesPaths) {
    final name = removeFileExtension(getFileNameBase(url));
    if (name == socketResultPath) {
      continue;
    }

    result[url] = {};
    result[url]!.add(join(outSockets, '$name$_outputFileExtension'));
    result[url]!.add(join(outSockets, '$name$_outputEnumsFileExtension'));
    result[url]!.add(join(outSockets, '$name$_outputModelsFileExtension'));
    result[url]!.add(join(outSockets, '$name$_outputResponsesFileExtension'));
    result[url]!.add(join(outSockets, '$name$_outputSocketsFileExtension'));
  }

  for (var url in options.inputUrls) {
    if (fileNames.contains(getFileNameBase(url))) {
      continue;
    }

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
  if (socketFileNames.isNotEmpty) {
    result[socketResultPath]!.add(join(outSockets, _socketsServiceFileName));
    result[socketResultPath]!.add(join(outSockets, _indexFileName));
    result[socketResultPath]!.add(join(outSockets, _mappingFileName));
  }

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
    final file = File(buildStep.inputId.path);
    var contents = await file.readAsString();

    Map<String, dynamic> contentMap;

    if (buildStep.inputId.path.endsWith('.yaml')) {
      final t = loadYaml(contents) as YamlMap;
      contentMap = t.toMap();
    } else {
      contentMap = jsonDecode(contents) as Map<String, dynamic>;
    }

    final SwaggerRoot parsed = SwaggerRoot.fromJson(contentMap);

    final fileNameWithExtension = getFileNameBase(buildStep.inputId.path);
    final fileNameWithoutExtension = removeFileExtension(fileNameWithExtension);
    final outputFolder =
        buildStep.inputId.path.contains(options.inputSocketsFolder)
            ? options.outputSocketsFolder
            : options.outputFolder;

    await _generateAndWriteFile(
      contents: parsed,
      buildStep: buildStep,
      fileNameWithExtension: fileNameWithExtension,
      fileNameWithoutExtension: fileNameWithoutExtension,
      outputFolder: outputFolder,
    );

    if (buildStep.inputId.path == socketResultPath) {
      await _generateSocketService(buildStep.inputId, buildStep, parsed);

      await _generateAdditionalFiles(
        buildStep.inputId,
        buildStep,
        true,
        socketFiles.toList(),
        outputFolder,
      );
    }

    if (buildStep.inputId.path == additionalResultPath) {
      for (final url in options.inputUrls) {
        final fileNameWithExtension = getFileNameBase(url);

        final contents = await _download(url);

        final filePath = join(options.inputFolder, fileNameWithExtension);
        await File(filePath).create();
        await File(filePath).writeAsString(contents);
      }

      await _generateAdditionalFiles(
        buildStep.inputId,
        buildStep,
        true,
        allFiledList.toList(),
        outputFolder,
      );
    }
  }

  Future<void> _generateAndWriteFile({
    required SwaggerRoot contents,
    required String fileNameWithoutExtension,
    required String fileNameWithExtension,
    required BuildStep buildStep,
    required String outputFolder,
  }) async {
    final codeGenerator = SwaggerCodeGenerator();

    final models = codeGenerator.generateModels(
        contents, removeFileExtension(fileNameWithExtension), options);

    final responses = codeGenerator.generateResponses(
        contents, removeFileExtension(fileNameWithExtension), options);

    final requestBodies = codeGenerator.generateRequestBodies(
        contents, removeFileExtension(fileNameWithExtension), options);

    final enums = codeGenerator.generateEnums(
        contents, removeFileExtension(fileNameWithExtension), options);

    final imports = codeGenerator.generateImportsContent(
      fileNameWithoutExtension,
      models.isNotEmpty,
      options.buildOnlyModels,
      enums.isNotEmpty,
      options.separateModels,
      options,
    );

    final requests = codeGenerator.generateRequests(
        contents,
        getClassNameFromFileName(fileNameWithExtension),
        removeFileExtension(fileNameWithExtension),
        options);

    final customDecoder = codeGenerator.generateCustomJsonConverter(
        removeFileExtension(fileNameWithExtension), options);

    final dateToJson = codeGenerator.generateDateToJson(options);

    final copyAssetId = AssetId(buildStep.inputId.package,
        join(outputFolder, '$fileNameWithoutExtension$_outputFileExtension'));

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
          join(outputFolder,
              '$fileNameWithoutExtension$_outputEnumsFileExtension'));

      await buildStep.writeAsString(enumsAssetId, formatterEnums);
    }

    if (outputFolder == options.outputSocketsFolder) {
      final sockets = codeGenerator.generateSockets(
          contents, removeFileExtension(fileNameWithExtension), options);

      if (sockets.isNotEmpty) {
        ///Write sockets
        final formatterSockets = _tryFormatCode(sockets);

        final socketsAssetId = AssetId(
            buildStep.inputId.package,
            join(outputFolder,
                '$fileNameWithoutExtension$_outputSocketsFileExtension'));

        await buildStep.writeAsString(socketsAssetId, formatterSockets);
      }
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
          join(outputFolder,
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

  Future<void> _generateSocketService(
      AssetId inputId, BuildStep buildStep, SwaggerRoot root) async {
    final codeGenerator = SwaggerCodeGenerator();

    final socketsServiceAssetId = AssetId(inputId.package,
        join(options.outputSocketsFolder, _socketsServiceFileName));

    final socketService = codeGenerator.generateSocketsService(root, options);

    await buildStep.writeAsString(
        socketsServiceAssetId, _formatter.format(socketService));
  }

  Future<void> _generateAdditionalFiles(AssetId inputId, BuildStep buildStep,
      bool hasModels, List<String> allFiles, String outputFolder) async {
    final codeGenerator = SwaggerCodeGenerator();

    final indexAssetId =
        AssetId(inputId.package, join(outputFolder, _indexFileName));

    final imports = codeGenerator.generateIndexes(allFiles, options);

    if (!options.buildOnlyModels) {
      await buildStep.writeAsString(indexAssetId, _formatter.format(imports));
    }

    if (options.withConverter && !options.buildOnlyModels) {
      final mappingAssetId =
          AssetId(inputId.package, join(outputFolder, _mappingFileName));

      final mapping =
          codeGenerator.generateConverterMappings(hasModels, options);

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
