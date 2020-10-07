import 'package:build/build.dart';
import 'package:swagger_dart_code_generator/src/extensions/file_name_extensions.dart';
import 'package:swagger_dart_code_generator/src/models/generator_options.dart';
import 'package:swagger_dart_code_generator/src/swagger_code_generator.dart';
import 'package:universal_io/io.dart';
import 'package:dart_style/dart_style.dart';

SwaggerDartCodeGenerator swaggerCodeBuilder(BuilderOptions options) =>
    SwaggerDartCodeGenerator(options);

const String inputFileExtension = '.swagger';
const String outputFileExtension = '.swagger.dart';
const String outputEnumsFileExtension = '.enums.swagger.dart';
const String indexFileName = 'client_index.dart';
const String mappingFileName = 'client_mapping.dart';

Map<String, List<String>> generateExtensions(GeneratorOptions options) {
  final filesList = Directory(options.inputFolder)
      .listSync()
      .where((FileSystemEntity file) => file.path.endsWith(inputFileExtension));

  final result = <String, List<String>>{};

  filesList.forEach((FileSystemEntity element) {
    final name = element.path.split('/').last.split('.').first;
    result[element.path] = <String>[
      '${options.outputFolder}$name$outputFileExtension',
      '${options.outputFolder}$name$outputEnumsFileExtension',
    ];
  });

  ///Register additional outputs in first input
  result[filesList.first.path].add('${options.outputFolder}$indexFileName');
  result[filesList.first.path].add('${options.outputFolder}$mappingFileName');

  return result;
}

class SwaggerDartCodeGenerator implements Builder {
  SwaggerDartCodeGenerator(BuilderOptions builderOptions) {
    options = GeneratorOptions.fromJson(builderOptions.config);
  }

  @override
  Map<String, List<String>> get buildExtensions =>
      _buildExtensionsCopy ??= generateExtensions(options);

  Map<String, List<String>> _buildExtensionsCopy;

  GeneratorOptions options;

  final DartFormatter _formatter = DartFormatter();

  @override
  Future<void> build(BuildStep buildStep) async {
    final fileNameWithExtension = buildStep.inputId.pathSegments.last;
    final fileNameWithoutExtension = fileNameWithExtension.split('.').first;

    final contents = await buildStep.readAsString(buildStep.inputId);

    final codeGenerator = SwaggerCodeGenerator();

    final models = codeGenerator.generateModels(
        contents, getFileNameWithoutExtension(fileNameWithExtension), options);

    final enums = codeGenerator.generateEnums(
        contents, getFileNameWithoutExtension(fileNameWithExtension));

    final imports = codeGenerator.generateImportsContent(
        contents,
        fileNameWithoutExtension,
        models.isNotEmpty,
        options.buildOnlyModels,
        enums.isNotEmpty);

    final converter = codeGenerator.generateConverter(
        contents, getFileNameWithoutExtension(fileNameWithExtension));

    final requests = codeGenerator.generateRequests(
        contents,
        getClassNameFromFileName(fileNameWithExtension),
        getFileNameWithoutExtension(fileNameWithExtension),
        options);

    final customDecoder = codeGenerator.generateCustomJsonConverter(contents,
        getFileNameWithoutExtension(fileNameWithExtension), models.isNotEmpty);

    final copyAssetId = AssetId(buildStep.inputId.package,
        '${options.outputFolder}$fileNameWithoutExtension$outputFileExtension');

    await buildStep.writeAsString(
        copyAssetId,
        _generateFileContent(
            imports, requests, converter, models, customDecoder));

    ///Write enums
    final formatterEnums = _tryFormatCode(enums);

    final enumsAssetId = AssetId(buildStep.inputId.package,
        '${options.outputFolder}$fileNameWithoutExtension$outputEnumsFileExtension');

    await buildStep.writeAsString(enumsAssetId, formatterEnums);

    ///Write additional files on first input
    if (buildExtensions.keys.first == buildStep.inputId.path) {
      await _generateAdditionalFiles(
          contents, buildStep.inputId, buildStep, models.isNotEmpty);
    }
  }

  String _generateFileContent(String imports, String requests, String converter,
      String models, String customDecoder) {
    final result = """
$imports

// **************************************************************************
// SwaggerChopperGenerator
// **************************************************************************

${options.buildOnlyModels ? '' : requests}

${options.withConverter ? converter : ''}

$models

${options.withBaseUrl && options.withConverter ? customDecoder : ''}
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

  Future<void> _generateAdditionalFiles(String swaggerCode, AssetId inputId,
      BuildStep buildStep, bool hasModels) async {
    final codeGenerator = SwaggerCodeGenerator();

    final indexAssetId =
        AssetId(inputId.package, '${options.outputFolder}$indexFileName');

    final imports = codeGenerator.generateIndexes(swaggerCode, buildExtensions);

    await buildStep.writeAsString(indexAssetId, _formatter.format(imports));

    if (options.withConverter) {
      final mappingAssetId =
          AssetId(inputId.package, '${options.outputFolder}$mappingFileName');

      final mapping = codeGenerator.generateConverterMappings(
          swaggerCode, buildExtensions, hasModels);

      await buildStep.writeAsString(mappingAssetId, _formatter.format(mapping));
    }
  }
}
