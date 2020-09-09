import 'package:swagger_generator/src/code_generators/v2/swagger_requests_generator_v2.dart';
import 'package:swagger_generator/src/models/generator_options.dart';
import 'requests_generator_definitions.dart';
import 'package:test/test.dart';

void main() {
  final _generator = SwaggerRequestsGeneratorV2();
  final _fileName = 'order_service';
  final _className = 'OrderSerice';

  group('Tests for additional methids', () {
    test('Should transform "parametersGET1" to "parametersGet1"', () {
      String str = "parametersGET1";
      final generator = SwaggerRequestsGeneratorV2();
      final result = generator.abbreviationToCamelCase(str);

      expect(result, equals("parametersGet1"));
    });

    test('Should get parameter summary', () {
      String name = "orderId";
      String description = "Id of the order";
      final generator = SwaggerRequestsGeneratorV2();
      final result = generator.createSummaryParameters(name, description);

      expect(result, contains("///@param orderId Id of the order"));
    });

    test('Should get code with base url', () {
      final generator = SwaggerRequestsGeneratorV2();
      String _baseUrl = "http://google.com/";
      bool _isBaseUrl = true;
      final result = generator.getBaseUrlContent(_baseUrl, _isBaseUrl);

      expect(result, equals("""
const String _baseUrl='$_baseUrl';
@ChopperApi(baseUrl: _baseUrl)
"""));
    });

    test('Should get parameter type name', () {
      final generator = SwaggerRequestsGeneratorV2();
      final result = generator.getParameterTypeName("array", "integer");

      expect(result, contains("List<int>"));
    });

    test('Should get validate name', () {
      final generator = SwaggerRequestsGeneratorV2();
      String _name = "x-application";
      final result = generator.validateParameterName(_name);

      expect(result, contains("xApplication"));
    });

    test('Should create chopper client', () {
      final generator = SwaggerRequestsGeneratorV2();
      String _name = "OrderService";
      bool _isConverter = false;
      final result = generator.getChopperClientContent(_name, _isConverter);

      expect(result, contains("static OrderService create"));
      expect(result, contains("services: [_\$OrderService()],"));
      expect(result, contains("/*converter: JsonSerializableConverter(),*/"));
    });
  });

  group('Tests for parameters', () {
    test('Should ignore headers if option is true', () {
      final result = _generator.generate(
          request_with_header,
          _className,
          _fileName,
          GeneratorOptions(
            ignoreHeaders: true,
          ));

      var isContainHeader = result.contains("@Header");

      expect(isContainHeader, equals(false));
    });

    test('Should NOT ignore headers if option is true', () {
      final result = _generator.generate(
          request_with_header,
          _className,
          _fileName,
          GeneratorOptions(
            ignoreHeaders: false,
          ));

      var isContainHeader = result.contains("@Header");

      expect(isContainHeader, equals(true));
    });

    test(
        'Should generate List<String> for query parameters type array and items.type string',
        () {
      final result = _generator.generate(
          request_with_array_string,
          _className,
          _fileName,
          GeneratorOptions(
            ignoreHeaders: false,
          ));

      expect(result, contains("List<String> testName"));
    });

    test(
        'Should generate List<String> for query parameters type array and items.type string',
        () {
      final result = _generator.generate(
          request_with_array_item_summary,
          _className,
          _fileName,
          GeneratorOptions(
            ignoreHeaders: false,
          ));

      expect(result, contains("Future<Response<List<ItemSummary>>>"));
    });
  });

  group('Tests for return type', () {
    test(
        'Should generate List<String> for return type parameters type array and items.type string',
        () {
      final result = _generator.generate(
          request_with_list_string_return_type,
          _className,
          _fileName,
          GeneratorOptions(
            ignoreHeaders: false,
          ));

      expect(result, contains("Future<Response<List<String>>>"));
    });

    test(
        'Should generate List<TestItem> for return type parameters type array and items.type string',
        () {
      final result = _generator.generate(
          request_with_list_test_item_return_type,
          _className,
          _fileName,
          GeneratorOptions(
            ignoreHeaders: false,
          ));

      expect(result, contains("Future<Response<List<TestItem>>>"));
    });
  });
}
