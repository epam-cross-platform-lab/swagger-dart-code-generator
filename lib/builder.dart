import 'dart:io';
import 'package:build/build.dart';
import 'package:swagger_generator/src/extensions/file_name_extensions.dart';
import 'package:swagger_generator/src/models/generator_options.dart';
import 'package:swagger_generator/src/swagger_code_generator.dart';

SwaggerCodeBuilder swaggerCodeBuilder(BuilderOptions options) =>
    SwaggerCodeBuilder(options);

const inputFileExtension = ".swagger";
const outputFileExtension = ".swagger.dart";
const indexFileName = "client_index.dart";
const mappingFileName = "client_mapping.dart";

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

class SwaggerCodeBuilder implements Builder {
  SwaggerCodeBuilder(BuilderOptions builderOptions) {
    options = GeneratorOptions.fromJson(builderOptions.config);
  }

  @override
  Map<String, List<String>> get buildExtensions =>
      _buildExtensionsCopy ??= generateExtensions(options);

  Map<String, List<String>> _buildExtensionsCopy;

  GeneratorOptions options;

  @override
  Future<void> build(BuildStep buildStep) async {
    final fileNameWithExtension = buildStep.inputId.pathSegments.last;
    final fileNameWithoutExtension = fileNameWithExtension.split('.').first;

    final String contents = await buildStep.readAsString(buildStep.inputId);

    final SwaggerCodeGenerator codeGenerator = SwaggerCodeGenerator();

    final models = codeGenerator.generateModels(
        contents, getFileNameWithoutExtension(fileNameWithExtension), options);

    final imports = codeGenerator.generateImportsContent(
        contents, fileNameWithoutExtension, !models.isEmpty);

    final converter = codeGenerator.generateConverter(
        contents, getFileNameWithoutExtension(fileNameWithExtension));

    final requests = codeGenerator.generateRequests(
        contents,
        getClassNameFromFileName(fileNameWithExtension),
        getFileNameWithoutExtension(fileNameWithExtension),
        options);

    final customDecoder = codeGenerator.generateCustomJsonConverter(
        contents, getFileNameWithoutExtension(fileNameWithExtension));

    final copyAssetId = AssetId(buildStep.inputId.package,
        "${options.outputFolder}$fileNameWithoutExtension$outputFileExtension");

    await buildStep.writeAsString(
        copyAssetId,
        _generateFileContent(
            imports, requests, converter, models, customDecoder));

    ///Write additional files on first input
    if (buildExtensions.keys.first == buildStep.inputId.path) {
      await _generate_additional_files(contents, buildStep.inputId, buildStep);
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

  Future _generate_additional_files(
      String swaggerCode, AssetId inputId, BuildStep buildStep) async {
    final SwaggerCodeGenerator codeGenerator = SwaggerCodeGenerator();

    final indexAssetId =
        AssetId(inputId.package, "${options.outputFolder}$indexFileName");

    final imports = codeGenerator.generateIndexes(swaggerCode, buildExtensions);

    await buildStep.writeAsString(indexAssetId, imports);

    if (options.withConverter) {
      final mappingAssetId =
          AssetId(inputId.package, "${options.outputFolder}$mappingFileName");

      final mapping =
          codeGenerator.generateConverterMappings(swaggerCode, buildExtensions);

      await buildStep.writeAsString(mappingAssetId, mapping);
    }
  }
}
