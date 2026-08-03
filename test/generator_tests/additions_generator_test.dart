import 'package:swagger_dart_code_generator/src/code_generators/swagger_additions_generator.dart';
import 'package:swagger_dart_code_generator/src/models/generator_options.dart';
import 'package:test/test.dart';

void main() {
  group('Additions generator tests', () {
    final generator = SwaggerAdditionsGenerator(
      GeneratorOptions(
        inputFolder: '',
        outputFolder: '',
      ),
    );

    test('Should generate correct imports', () {
      final result = generator.generateImportsContent(
          'swagger.fileName', true, false, false, false, []);

      expect(result, contains("part 'swagger.fileName.swagger.chopper.dart';"));
      expect(result, contains("part 'swagger.fileName.swagger.g.dart';"));
    });

    test('Should generate correct imports', () {
      final result = generator.generateImportsContent(
          'swagger.fileName', true, false, true, false, ['MyEnum']);

      expect(result,
          contains("import 'swagger.fileName.enums.swagger.dart' as enums;"));
    });

    test('Should import enum types unprefixed so the chopper part resolves them',
        () {
      final result = generator.generateImportsContent(
          'swagger.fileName', true, false, true, false, ['MyEnum', 'OtherEnum']);

      expect(
          result,
          contains("import 'swagger.fileName.enums.swagger.dart' "
              "show MyEnum, OtherEnum;"));
    });

    test('Should not import enum types when there are no enums', () {
      final result = generator.generateImportsContent(
          'swagger.fileName', true, false, false, false, []);

      expect(result, isNot(contains(".enums.swagger.dart' show")));
    });

    test('Should generate indexes file', () {
      final result = generator.generateIndexes(<String>[
        'someFile.dart',
        'secondFile',
      ]);

      expect(result, contains("export 'someFile.dart.dart' show SomeFile;"));
      expect(result, contains("export 'secondFile.dart' show SecondFile;"));
    });
  });
  group('Test for generateDateToJson', () {
    final generator = SwaggerAdditionsGenerator(
      GeneratorOptions(
        inputFolder: '',
        outputFolder: '',
      ),
    );
    test('Should dateToJson with parameter', () {
      const expectedResult = 'String? _dateToJson(DateTime? date)';
      final result = generator.generateDateToJson();

      expect(result, contains(expectedResult));
    });
  });
}
