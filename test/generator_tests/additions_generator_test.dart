import 'package:code_builder/code_builder.dart';
import 'package:swagger_dart_code_generator/src/code_generators/swagger_additions_generator.dart';
import 'package:test/test.dart';

void main() {
  group('Additions generator tests', () {
    final generator = SwaggerAdditionsGenerator();

    test('Should generate mapping for files', () {
      final result = generator.generateConverterMappings(<String, List<String>>{
        'someFile.dart': <String>['someFile.swagger.dart'],
        'secondFile.dart': <String>['secondFile.swagger.dart']
      }, true);

      expect(result, contains('...SomeFileJsonDecoderMappings'));
      expect(result, contains('...SecondFileJsonDecoderMappings'));
    });

    test('Should generate correct imports', () {
      final result = generator.generateImportsContent(
          'swagger.fileName', true, false, false);

      expect(result, contains("part 'swagger.fileName.swagger.chopper.dart';"));
      expect(result, contains("part 'swagger.fileName.swagger.g.dart';"));
    });

    test('Should generate correct imports', () {
      final result = generator.generateImportsContent(
          'swagger.fileName', true, false, true);

      expect(result,
          contains("import 'swagger.fileName.enums.swagger.dart' as enums;"));
    });

    test('Should generate indexes file', () {
      final result = generator.generateIndexes(<String, List<String>>{
        'someFile.dart': <String>['someFile.swagger.dart'],
        'secondFile.dart': <String>['secondFile.swagger.dart']
      });

      expect(result, contains("export 'someFile.dart.dart' show SomeFile;"));
      expect(
          result, contains("export 'secondFile.dart.dart' show SecondFile;"));
    });
  });

  group('Test for generateCustomJsonConverter', () {
    final generator = SwaggerAdditionsGenerator();
    test('Should generate custom json converter', () {
      const fileName = 'example_swagger';
      const expectedResult =
          'CustomJsonDecoder(ExampleSwaggerJsonDecoderMappings)';
      final result = generator.generateCustomJsonConverter(fileName);

      expect(result, contains(expectedResult));
    });
  });

  group('Test for generateDateToJson', () {
    final generator = SwaggerAdditionsGenerator();
    test('Should dateToJson with parameter', () {
      const expectedResult = 'String? _dateToJson(DateTime? date)';
      final result = generator.generateDateToJson();

      expect(result, contains(expectedResult));
    });
  });
}
