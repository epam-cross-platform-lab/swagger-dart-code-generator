import 'package:build/build.dart';
import 'package:swagger_dart_code_generator/src/extensions/file_name_extensions.dart';
import 'package:swagger_dart_code_generator/src/models/generator_options.dart';
import 'package:swagger_dart_code_generator/src/swagger_code_generator.dart';
import 'package:universal_io/io.dart';
import 'package:dart_style/dart_style.dart';
import 'package:path/path.dart' show join, normalize;
import 'package:http/http.dart' as http;

///Returns instance of SwaggerDartCodeGenerator
SwaggerDartCodeGenerator swaggerCodeBuilder(BuilderOptions options) =>
    SwaggerDartCodeGenerator(options);

const _inputFileExtensions = ['.swagger', '.json'];

const String _outputFileExtension = '.swagger.dart';
const String _outputEnumsFileExtension = '.enums.swagger.dart';
const String _outputModelsFileExtension = '.models.swagger.dart';
const String _outputResponsesFileExtension = '.responses.swagger.dart';
const String _indexFileName = 'client_index.dart';
const String _mappingFileName = 'client_mapping.dart';
const kAdditionalResult = 'lib/main.dart';

String normal(String path) {
  return AssetId('', path).path;
}

Map<String, List<String>> _generateExtensions(GeneratorOptions options) {
  final result = <String, List<String>>{};

  final filesList = Directory(normalize(options.inputFolder)).listSync().where(
      (FileSystemEntity file) =>
          _inputFileExtensions.any((ending) => file.path.endsWith(ending)));

  var out = normalize(options.outputFolder);

  filesList.forEach((FileSystemEntity element) {
    final name = getFileNameBase(element.path);
    result[normal(element.path)] = <String>[
      join(out, '$name$_outputFileExtension'),
      join(out, '$name$_outputEnumsFileExtension'),
      join(out, '$name$_outputModelsFileExtension'),
      join(out, '$name$_outputResponsesFileExtension'),
    ];
  });

  result[kAdditionalResult] = [];

  options.inputUrls.forEach((url) {
    final name = getFileNameBase(url.split('/').last);
    result[kAdditionalResult]!.add(join(out, '$name$_outputFileExtension'));
    result[kAdditionalResult]!
        .add(join(out, '$name$_outputEnumsFileExtension'));
    result[kAdditionalResult]!
        .add(join(out, '$name$_outputModelsFileExtension'));
    result[kAdditionalResult]!
        .add(join(out, '$name$_outputResponsesFileExtension'));
  });

  ///Register additional outputs in first input
  result[kAdditionalResult]!.add(join(out, _indexFileName));
  result[kAdditionalResult]!.add(join(out, _mappingFileName));
  print('\n\n\n$result');
  return result;
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
    if (buildStep.inputId.path == kAdditionalResult) {
      await _generateAndWriteAdditionalFiles(buildStep);
      return;
    }

    final fileNameWithExtension =
        buildStep.inputId.pathSegments.last.replaceAll('-', '_');
    final fileNameWithoutExtension = getFileNameBase(fileNameWithExtension);

    final contents = await buildStep.readAsString(buildStep.inputId);

    ///Write file content
    await _generateAndWriteFile(
      contents: contents,
      fileNameWithExtension: fileNameWithExtension,
      fileNameWithoutExtension: fileNameWithoutExtension,
      buildStep: buildStep,
    );
  }

  Future<void> _generateAndWriteAdditionalFiles(BuildStep buildStep) async {
    if (options.inputUrls.isNotEmpty) {
      for (final url in options.inputUrls) {
        final contents = await _download(url);

        final fileNameWithExtension = url.split('/').last.replaceAll('-', '_');

        final fileNameWithoutExtension = getFileNameBase(fileNameWithExtension);

        await _generateAndWriteFile(
          contents: contents,
          buildStep: buildStep,
          fileNameWithExtension: fileNameWithExtension,
          fileNameWithoutExtension: fileNameWithoutExtension,
        );
      }
    }

    await _generateAdditionalFiles(
      buildStep.inputId,
      buildStep,
      true,
    );

    return;
  }

  Future<void> _generateAndWriteFile({
    required String contents,
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

  Future<void> _generateAdditionalFiles(
      AssetId inputId, BuildStep buildStep, bool hasModels) async {
    final codeGenerator = SwaggerCodeGenerator();

    final indexAssetId =
        AssetId(inputId.package, join(options.outputFolder, _indexFileName));

    final imports = codeGenerator.generateIndexes(buildExtensions);

    if (!options.buildOnlyModels) {
      await buildStep.writeAsString(indexAssetId, _formatter.format(imports));
    }

    if (options.withConverter && !options.buildOnlyModels) {
      final mappingAssetId = AssetId(
          inputId.package, join(options.outputFolder, _mappingFileName));

      final mapping =
          codeGenerator.generateConverterMappings(buildExtensions, hasModels);

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
