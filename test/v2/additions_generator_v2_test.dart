import 'package:swagger_generator/src/code_generators/v2/swagger_additions_generator_v2.dart';
import 'package:test/test.dart';

void main() {
  group('Additions generator tests', () {
    final _generator = SwaggerAdditionsGeneratorV2();

    test('Should generate mapping for files', () {
      final result = _generator.generateConverterMappings({
        "someFile.dart": ["someFile.swagger.dart"],
        "secondFile.dart": ["secondFile.swagger.dart"]
      });

      expect(result, contains('...SomeFileJsonDecoderMappings'));
      expect(result, contains('...SecondFileJsonDecoderMappings'));
    });

    test('Should generate correct imports', () {
      final result =
          _generator.generateImportsContent("swagger.fileName", true);

      expect(result, contains("part 'swagger.fileName.swagger.chopper.dart';"));
      expect(result, contains("part 'swagger.fileName.swagger.g.dart';"));
    });

    test('Should generate indexes file', () {
      final result = _generator.generateIndexes({
        "someFile.dart": ["someFile.swagger.dart"],
        "secondFile.dart": ["secondFile.swagger.dart"]
      });

      expect(result, contains("import 'someFile.dart.dart' show SomeFile;"));
      expect(
          result, contains("import 'secondFile.dart.dart' show SecondFile;"));
    });
  });
}
