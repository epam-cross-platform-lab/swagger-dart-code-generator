import 'package:swagger_generator/src/code_generators/v3/swagger_requests_generator_v3.dart';
import 'package:swagger_generator/src/models/generator_options.dart';
import 'package:swagger_generator/src/swagger_models/v3/requests/swagger_parameter_schema.dart';
import 'package:swagger_generator/src/swagger_models/v3/requests/swagger_request.dart';
import 'package:swagger_generator/src/swagger_models/v3/requests/swagger_request_parameter.dart';
import 'package:swagger_generator/src/swagger_models/v3/responses/swagger_response.dart';
import 'package:swagger_generator/src/swagger_models/v3/swagger_path.dart';
import 'package:swagger_generator/src/swagger_models/v3/swagger_root.dart';
import 'requests_generator_v3_definitions.dart';
import 'package:test/test.dart';

void main() {
  final _generator = SwaggerRequestsGeneratorV3();
  final _fileName = 'order_service';
  final _className = 'OrderSerice';

  group('Tests for additional methids', () {
    test('Should transform "parametersGET1" to "parametersGet1"', () {
      String str = "parametersGET1";
      final result = _generator.abbreviationToCamelCase(str);

      expect(result, equals("parametersGet1"));
    });

    test('Should get parameter summary', () {
      String name = "orderId";
      String description = "Id of the order";
      final result = _generator.createSummaryParameters(name, description);

      expect(result, contains("///@param orderId Id of the order"));
    });

    test('Should get code with base url', () {
      String _baseUrl = "http://google.com/";
      bool _isBaseUrl = true;
      final result = _generator.getBaseUrlContent(_baseUrl, _isBaseUrl);

      expect(result, equals("""
const String _baseUrl='$_baseUrl';
@ChopperApi(baseUrl: _baseUrl)
"""));
    });

    test('Should get parameter type name', () {
      final result = _generator.getParameterTypeName("array", "integer");

      expect(result, contains("List<int>"));
    });

    test('Should get validate name', () {
      String _name = "x-application";
      final result = _generator.validateParameterName(_name);

      expect(result, contains("xApplication"));
    });

    test('Should add \$ if name is key word', () {
      String _name = "null";
      final result = _generator.validateParameterName(_name);

      expect(result, contains("\$null"));
    });

    test('Should create chopper client', () {
      String _name = "OrderService";
      bool _isConverter = false;
      final result = _generator.getChopperClientContent(_name, _isConverter);

      expect(result, contains("static OrderService create"));
      expect(result, contains("services: [_\$OrderService()],"));
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

  group('Tests for getReturnTypeName', () {
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

    test(
        'Should generate List<OverridenType> for return type parameters type array and items.type string',
        () {
      final result = _generator.generate(
          request_with_list_test_item_return_type,
          _className,
          _fileName,
          GeneratorOptions(ignoreHeaders: false, responseOverrideValueMap: [
            ResponseOverrideValueMap(
                method: "get",
                url: "/model/items",
                overridenValue: "List<OverridenType>")
          ]));

      expect(result, contains("Future<Response<List<OverridenType>>>"));
    });

    test('Should generate return type by originalRef', () {
      final result = _generator.generate(request_with_original_ref_return_type,
          _className, _fileName, GeneratorOptions(ignoreHeaders: false));

      expect(result, contains("Future<Response<TestItem>>"));
    });

    test(
        'Should generate return type by content -> first -> responseType originalRef',
        () {
      final result = _generator.generate(
          request_with_content_first_response_type,
          _className,
          _fileName,
          GeneratorOptions(ignoreHeaders: false));

      expect(result, contains("Future<Response<String>>"));
    });

    test('Should generate return type by content -> first -> responseType ref',
        () {
      final result = _generator.generate(
          request_with_content_first_response_ref,
          _className,
          _fileName,
          GeneratorOptions(ignoreHeaders: false));

      expect(result, contains("Future<Response<TestType>> getModelItems();"));
    });

    test('Should generate return type by content -> first -> ref', () {
      final result = _generator.getReturnTypeName(
          [
            SwaggerResponse(
                code: '200',
                content: [Content(ref: "#components/schemas/TestItem")])
          ],
          "/test/items",
          "get",
          []);

      expect(result, equals("TestItem"));
    });
  });

  group('Tests for getSuccessedResponse', () {
    test('Should return response if code 200', () {
      final List<SwaggerResponse> responses = [
        SwaggerResponse(code: '200', description: 'success response'),
        SwaggerResponse(code: '401', description: 'unauthorized')
      ];
      final result = _generator.getSuccessedResponse(responses);

      expect(result, equals(responses.first));
    });

    test('Should return response if description is OK', () {
      final List<SwaggerResponse> responses = [
        SwaggerResponse(code: '201', description: 'OK'),
        SwaggerResponse(code: '401', description: 'unauthorized')
      ];
      final result = _generator.getSuccessedResponse(responses);

      expect(result, equals(responses.first));
    });

    test('Should return null if there is no success response', () {
      final List<SwaggerResponse> responses = [
        SwaggerResponse(code: '201', description: 'Cool'),
        SwaggerResponse(code: '401', description: 'unauthorized')
      ];
      final result = _generator.getSuccessedResponse(responses);

      expect(result, equals(null));
    });
  });

  group('Tests for getParameterContent', () {
    test('Should generate body parameter by schema -> ref', () {
      SwaggerRequestParameter parameter = SwaggerRequestParameter(
          inParameter: 'body',
          name: "testParameter",
          isRequired: true,
          schema: SwaggerParameterSchema(originalRef: "TestItem"));

      final result = _generator.getParameterContent(
          parameter: parameter, ignoreHeaders: false);

      expect(result, contains("@Body() @required TestItem testParameter"));
    });

    test('Should generate formData parameter by schema -> ref', () {
      SwaggerRequestParameter parameter = SwaggerRequestParameter(
          inParameter: 'formData',
          name: "testParameter",
          isRequired: true,
          schema: SwaggerParameterSchema(originalRef: "TestItem"));

      final result = _generator.getParameterContent(
          parameter: parameter, ignoreHeaders: false);

      expect(result,
          contains("@Field('testParameter') @required dynamic testParameter"));
    });

    test('Should generate body parameter by schema -> enum values', () {
      SwaggerRequestParameter parameter = SwaggerRequestParameter(
          inParameter: 'body',
          name: "testParameter",
          isRequired: true,
          schema: SwaggerParameterSchema(enumValues: ["one", "two"]));

      final result = _generator.getParameterContent(
          parameter: parameter, ignoreHeaders: false);

      expect(result, contains("@Body() @required TestParameter testParameter"));
    });

    test('Should generate body parameter if no ref and no schema', () {
      SwaggerRequestParameter parameter = SwaggerRequestParameter(
          inParameter: 'body', name: "testParameter", isRequired: true);

      final result = _generator.getParameterContent(
          parameter: parameter, ignoreHeaders: false);

      expect(result, contains("@Body() @required String testParameter"));
    });

    test('Should generate header parameter if not ignore', () {
      SwaggerRequestParameter parameter = SwaggerRequestParameter(
          inParameter: 'header', name: "testParameter", isRequired: true);

      final result = _generator.getParameterContent(
          parameter: parameter, ignoreHeaders: false);

      expect(result,
          contains("@Header('testParameter') @required String testParameter"));
    });

    test('Should generate header parameter if ignore headers == true', () {
      SwaggerRequestParameter parameter = SwaggerRequestParameter(
          inParameter: 'header', name: "testParameter", isRequired: true);

      final result = _generator.getParameterContent(
          parameter: parameter, ignoreHeaders: true);

      expect(result, equals(''));
    });

    test('Should generate custom parameter types by schema', () {
      SwaggerRequestParameter parameter = SwaggerRequestParameter(
          inParameter: 'CustomType',
          name: "testParameter",
          isRequired: true,
          schema: SwaggerParameterSchema(type: "CustomType"));

      final result = _generator.getParameterContent(
          parameter: parameter, ignoreHeaders: true);

      expect(
          result,
          equals(
              "@CustomType('testParameter') @required CustomType testParameter"));
    });

    test('Should generate custom parameter types by schema', () {
      SwaggerRequestParameter parameter = SwaggerRequestParameter(
          inParameter: 'CustomType',
          name: "testParameter",
          isRequired: true,
          schema:
              SwaggerParameterSchema(ref: "#components/schemas/CustomType"));

      final result = _generator.getParameterContent(
          parameter: parameter, ignoreHeaders: true);

      expect(
          result,
          equals(
              "@CustomType('testParameter') @required CustomType testParameter"));
    });

    test('Should ignore cookie parameters', () {
      SwaggerRequestParameter parameter = SwaggerRequestParameter(
          inParameter: 'cookie', name: "testParameter", isRequired: true);

      final result = _generator.getParameterContent(
          parameter: parameter, ignoreHeaders: false);

      expect(result, contains(''));
    });
  });

  group('Tests for getParameterTypeName', () {
    test('Should convert string -> String', () {
      final result = _generator.getParameterTypeName("string");

      expect(result, "String");
    });

    test('Should convert file to List<int>', () {
      final result = _generator.getParameterTypeName("file");

      expect(result, "List<int>");
    });

    test('Should convert array of int to List<int>', () {
      final result = _generator.getParameterTypeName("array", 'int');

      expect(result, "List<int>");
    });

    test('Should convert array of TestItem to List<TestItem>', () {
      final result = _generator.getParameterTypeName("array", 'TestItem');

      expect(result, "List<TestItem>");
    });

    test('Should convert unknown type to unknown type', () {
      final result = _generator.getParameterTypeName("super_cool_type");

      expect(result, "super_cool_type");
    });

    test('Should convert null to dynamic', () {
      final result = _generator.getParameterTypeName(null);

      expect(result, "dynamic");
    });
  });

  group('Tests for createSummaryParameters', () {
    test('Should generate description for parameter', () {
      final result = _generator.createSummaryParameters(
          "testParameterName", "testParameterDescription");
      expect(result,
          equals("	///@param testParameterName testParameterDescription"));
    });

    test('Should replace special characters in description', () {
      final result = _generator.createSummaryParameters(
          "testParameterName", "test\tParameter\nDescription\rSplitted");
      expect(
          result,
          equals(
              "	///@param testParameterName test Parameter Description Splitted"));
    });
  });

  group('Tests for abbreviationToCamelCase', () {
    test('Should make CamelCase for belarusCOUNTRY', () {
      final result = _generator.abbreviationToCamelCase("BELARUS");
      expect(result, equals("Belarus"));
    });
  });

  group('Tests for getAllMethodsContent', () {
    test('Should generate default name for method without operationId', () {
      final result = _generator.getAllMethodsContent(
          SwaggerRoot(paths: [
            SwaggerPath(path: "/test/path", requests: [
              SwaggerRequest(
                  type: 'get', operationId: null, parameters: [], responses: [])
            ])
          ]),
          GeneratorOptions());

      expect(result, contains('Future<Response> unnamedMethod0();'));
    });
  });

  group('Tests for getNeededRequestParameter', () {
    test('Should get needed parameter from defined parameters using ref', () {
      final result = _generator.getNeededRequestParameter(
          SwaggerRequestParameter(ref: "#definitions/TestItem"), [
        SwaggerRequestParameter(name: "TestItem"),
        SwaggerRequestParameter(name: "MyTestItem")
      ]);

      expect(result.name, equals("TestItem"));
    });
  });

  group('Tests for getMethodContent', () {
    test('Should', () {
      var result = _generator.getMethodContent(
          hasFormData: true,
          methodName: "methodName",
          parametersComments: "parameters",
          requestPath: "path",
          requiredParameters: "requiredParameters",
          returnType: "returnType",
          summary: "summary",
          typeRequest: "typeRequests");

      expect(result, contains('@FactoryConverter'));
    });
  });
}
