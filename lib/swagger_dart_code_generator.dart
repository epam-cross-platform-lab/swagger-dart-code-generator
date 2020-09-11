import 'dart:io';
import 'package:build/build.dart';
import 'package:swagger_dart_code_generator/src/extensions/file_name_extensions.dart';
import 'package:swagger_dart_code_generator/src/models/generator_options.dart';
import 'package:swagger_dart_code_generator/src/swagger_code_generator.dart';

SwaggerDartCodeGenerator swaggerCodeBuilder(BuilderOptions options) =>
    SwaggerDartCodeGenerator(options);

const String inputFileExtension = '.swagger';
const String outputFileExtension = '.swagger.dart';
const String indexFileName = 'client_index.dart';
const String mappingFileName = 'client_mapping.dart';

Map<String, List<String>> generateExtensions(GeneratorOptions options) {
  final Iterable<FileSystemEntity> filesList = Directory(options.inputFolder)
      .listSync()
      .where((FileSystemEntity file) => file.path.endsWith(inputFileExtension));

  final Map<String, List<String>> result = <String, List<String>>{};

  filesList.forEach((FileSystemEntity element) {
    final String name = element.path.split('/').last.split('.').first;
    result[element.path] = <String>[
      '${options.outputFolder}$name$outputFileExtension'
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

  @override
  Future<void> build(BuildStep buildStep) async {
    final String fileNameWithExtension = buildStep.inputId.pathSegments.last;
    final String fileNameWithoutExtension =
        fileNameWithExtension.split('.').first;

    final String contents = await buildStep.readAsString(buildStep.inputId);

    final SwaggerCodeGenerator codeGenerator = SwaggerCodeGenerator();

    final String models = codeGenerator.generateModels(
        contents, getFileNameWithoutExtension(fileNameWithExtension), options);

    final String imports = codeGenerator.generateImportsContent(
        contents, fileNameWithoutExtension, models.isNotEmpty);

    final String converter = codeGenerator.generateConverter(
        contents, getFileNameWithoutExtension(fileNameWithExtension));

    final String requests = codeGenerator.generateRequests(
        contents,
        getClassNameFromFileName(fileNameWithExtension),
        getFileNameWithoutExtension(fileNameWithExtension),
        options);

    final String customDecoder = codeGenerator.generateCustomJsonConverter(
        contents, getFileNameWithoutExtension(fileNameWithExtension));

    final AssetId copyAssetId = AssetId(buildStep.inputId.package,
        "${options.outputFolder}$fileNameWithoutExtension$outputFileExtension");

    await buildStep.writeAsString(
        copyAssetId,
        _generateFileContent(
            imports, requests, converter, models, customDecoder));

    ///Write additional files on first input
    if (buildExtensions.keys.first == buildStep.inputId.path) {
      await _generateAdditionalFiles(contents, buildStep.inputId, buildStep);
    }
  }

  String _generateFileContent(String imports, String requests, String converter,
      String models, String customDecoder) {
    return """
$imports

// **************************************************************************
// SwaggerChopperGenerator
// **************************************************************************

${options.buildOnlyModels ? '' : requests}

${options.withConverter ? converter : ''}

${options.buildOnlyModels ? '' : models}

${options.withBaseUrl && options.withConverter ? customDecoder : ''}
""";
  }

  Future<void> _generateAdditionalFiles(
      String swaggerCode, AssetId inputId, BuildStep buildStep) async {
    final SwaggerCodeGenerator codeGenerator = SwaggerCodeGenerator();

    final AssetId indexAssetId =
        AssetId(inputId.package, "${options.outputFolder}$indexFileName");

    final String imports =
        codeGenerator.generateIndexes(swaggerCode, buildExtensions);

    await buildStep.writeAsString(indexAssetId, imports);

    if (options.withConverter) {
      final AssetId mappingAssetId =
          AssetId(inputId.package, "${options.outputFolder}$mappingFileName");

      final String mapping =
          codeGenerator.generateConverterMappings(swaggerCode, buildExtensions);

      await buildStep.writeAsString(mappingAssetId, mapping);
    }
  }
}
