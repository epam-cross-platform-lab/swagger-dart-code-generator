import 'package:test/test.dart';
import 'package:swagger_dart_code_generator/src/code_generators/swagger_meta_data_generator.dart';
import 'package:swagger_dart_code_generator/src/models/generator_options.dart';

void main() {
  group('SwaggerMetaDataGenerator', () {
    test('should generate SwaggerMetaData class correctly', () {
      final options = GeneratorOptions(
        inputFolder: 'test/',
        outputFolder: 'test/',
      );
      final generator = SwaggerMetaDataGenerator(options);

      final result = generator.generate();

      expect(result, contains('class SwaggerMetaData'));
      expect(result, contains('const SwaggerMetaData({'));
      expect(result, contains('required this.summary'));
      expect(result, contains('required this.description'));
      expect(result, contains('required this.operationId'));
      expect(result, contains('required this.consumes'));
      expect(result, contains('required this.produces'));
      expect(result, contains('required this.security'));
      expect(result, contains('required this.tags'));
      expect(result, contains('required this.deprecated'));
      expect(result, contains('final String summary'));
      expect(result, contains('final String description'));
      expect(result, contains('final String operationId'));
      expect(result, contains('final List<String> consumes'));
      expect(result, contains('final List<String> produces'));
      expect(result, contains('final List<String> security'));
      expect(result, contains('final List<String> tags'));
      expect(result, contains('final bool deprecated'));
    });
  });
}
