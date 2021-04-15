import 'package:swagger_dart_code_generator/src/code_generators/v3/swagger_requests_generator_v3.dart';
import 'package:swagger_dart_code_generator/src/models/generator_options.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/requests/parameter_item.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/requests/swagger_parameter_schema.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/requests/swagger_request.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/requests/swagger_request_items.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/requests/swagger_request_parameter.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/responses/swagger_response.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/swagger_path.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/swagger_root.dart';
import 'package:test/test.dart';

import '../requests_generator_definitions.dart';

void main() {
  final generator = SwaggerRequestsGeneratorV3();
  const fileName = 'order_service';
  const className = 'OrderSerice';

  group('Tests for getDefaultParameter', () {
    test('Should use parameter -> schema -> enumValues', () {
      final parameter = SwaggerRequestParameter(
          isRequired: true,
          inParameter: 'query',
          name: 'number',
          schema: SwaggerParameterSchema(enumValues: ['one', 'two']));

      final result = generator.getDefaultParameter(parameter, '/path', 'get');

      expect(result,
          equals('@Query(\'number\') @required enums.PathGetNumber? number'));
    });

    test('Should use parameter -> items -> enumValues', () {
      final parameter = SwaggerRequestParameter(
          isRequired: true,
          inParameter: 'query',
          name: 'number',
          items: SwaggerRequestItems(enumValues: ['one', 'two']));

      final result = generator.getDefaultParameter(parameter, '/path', 'get');

      expect(
          result,
          equals(
              '@Query(\'number\') @required List<enums.PathGetNumber>? number'));
    });
  });

  group('Tests for additional methids', () {
    test('Should transform "parametersGET1" to "parametersGet1"', () {
      const str = 'parametersGET1';
      final result = generator.abbreviationToCamelCase(str);

      expect(result, equals('parametersGet1'));
    });

    test('Should get parameter summary', () {
      const name = 'orderId';
      const description = 'Id of the order';
      final result = generator.createSummaryParameters(
          name, description, 'query', GeneratorOptions());

      expect(result, contains('///@param orderId Id of the order'));
    });

    test('Should get parameter type name', () {
      final result = generator.getParameterTypeName('array', 'integer');

      expect(result, contains('List<int>'));
    });

    test('Should get validate name', () {
      const name = 'x-application';
      final result = generator.validateParameterName(name);

      expect(result, contains('xApplication'));
    });

    test('Should add \$ if name is key word', () {
      const name = 'null';
      final result = generator.validateParameterName(name);

      expect(result, contains('\$null'));
    });

    test('Should create chopper client', () {
      const name = 'OrderService';
      const host = 'some.host';
      const path = '/path';
      final result = generator.getChopperClientContent(
          name, host, path, GeneratorOptions(), true);

      expect(result, contains('static OrderService create'));
      expect(result, contains('services: [_\$OrderService()],'));
    });
  });

  group('Tests for parameters', () {
    test('Should ignore headers if option is true', () {
      final result = generator.generate(
          request_with_header,
          className,
          fileName,
          GeneratorOptions(
            ignoreHeaders: true,
          ));

      final isContainHeader = result.contains('@Header');

      expect(isContainHeader, equals(false));
    });

    test('Should generate response from ref for Dynamic types', () {
      final result = generator.generate(
          request_with_ref_response,
          className,
          fileName,
          GeneratorOptions(
            ignoreHeaders: true,
          ));

      expect(result, contains('Response<Object>'));
    });

    test('Should accept requestBody enum', () {
      final result = generator.generate(
          request_with_enum_request_body,
          className,
          fileName,
          GeneratorOptions(
            ignoreHeaders: true,
          ));

      expect(result, contains('@Body() @required String? body'));
    });

    test('Should generate method name from path if such option is true', () {
      final result = generator.generate(
          request_with_header,
          className,
          fileName,
          GeneratorOptions(
            usePathForRequestNames: true,
          ));

      expect(result, contains('modelItemsGet'));
    });

    test('Should NOT ignore headers if option is true', () {
      final result = generator.generate(
          request_with_header,
          className,
          fileName,
          GeneratorOptions(
            ignoreHeaders: false,
          ));

      final isContainHeader = result.contains('@Header');

      expect(isContainHeader, equals(true));
    });

    test(
        'Should generate List<String> for query parameters type array and items.type string',
        () {
      final result = generator.generate(
          request_with_array_string,
          className,
          fileName,
          GeneratorOptions(
            ignoreHeaders: false,
          ));

      expect(result, contains('List<String>? testName'));
    });

    test(
        'Should generate List<String> for query parameters type array and items.type string',
        () {
      final result = generator.generate(
          request_with_array_item_summary,
          className,
          fileName,
          GeneratorOptions(
            ignoreHeaders: false,
          ));

      expect(result, contains('Future<chopper.Response<List<ItemSummary>>>'));
    });
  });

  group('Tests for getReturnTypeName', () {
    test(
        'Should generate List<String> for return type parameters type array and items.type string',
        () {
      final result = generator.generate(
          request_with_list_string_return_type,
          className,
          fileName,
          GeneratorOptions(
            ignoreHeaders: false,
          ));

      expect(result, contains('Future<chopper.Response<List<String>>>'));
    });

    test('Should generate MyObject if ref is #definitions/MyObject', () {
      final result = generator.generate(
          request_with_object_ref_response,
          className,
          fileName,
          GeneratorOptions(
            ignoreHeaders: false,
          ));

      expect(result, contains('Future<chopper.Response<MyObject>>'));
    });

    test(
        'Should generate List<TestItem> for return type parameters type array and items.type string',
        () {
      final result = generator.generate(
          request_with_list_test_item_return_type,
          className,
          fileName,
          GeneratorOptions(
            ignoreHeaders: false,
          ));

      expect(result, contains('Future<chopper.Response<List<TestItem>>>'));
    });

    test(
        'Should generate List<OverriddenType> for return type parameters type array and items.type string',
        () {
      final result = generator.generate(
          request_with_list_test_item_return_type,
          className,
          fileName,
          GeneratorOptions(
              ignoreHeaders: false,
              responseOverrideValueMap: <ResponseOverrideValueMap>[
                ResponseOverrideValueMap(
                    method: 'get',
                    url: '/model/items',
                    overriddenValue: 'List<OverriddenType>')
              ]));

      expect(
          result, contains('Future<chopper.Response<List<OverriddenType>>>'));
    });

    test('Should generate return type by originalRef', () {
      final result = generator.generate(request_with_original_ref_return_type,
          className, fileName, GeneratorOptions(ignoreHeaders: false));

      expect(result, contains('Future<chopper.Response<TestItem>>'));
    });

    test(
        'Should generate return type by content -> first -> responseType originalRef',
        () {
      final result = generator.generate(
          request_with_content_first_response_type,
          className,
          fileName,
          GeneratorOptions(ignoreHeaders: false));

      expect(result, contains('Future<chopper.Response<String>>'));
    });

    test('Should generate return type by content -> first -> responseType ref',
        () {
      final result = generator.generate(request_with_content_first_response_ref,
          className, fileName, GeneratorOptions(ignoreHeaders: false));

      expect(result,
          contains('Future<chopper.Response<TestType>> getModelItems();'));
    });

    test('Should generate return type by content -> first -> ref', () {
      final result = generator.getReturnTypeName(
          <SwaggerResponse>[
            SwaggerResponse(code: '200', content: <Content>[
              Content(ref: '#components/schemas/TestItem')
            ])
          ],
          '/test/items',
          'get',
          <ResponseOverrideValueMap>[],
          [],
          {});

      expect(result, equals('TestItem'));
    });
  });

  group('Tests for getSuccessedResponse', () {
    test('Should return response if code 200', () {
      final responses = <SwaggerResponse>[
        SwaggerResponse(code: '200', description: 'success response'),
        SwaggerResponse(code: '401', description: 'unauthorized')
      ];
      final result = generator.getSuccessedResponse(responses);

      expect(result, equals(responses.first));
    });

    test('Should return response if description is OK', () {
      final responses = <SwaggerResponse>[
        SwaggerResponse(code: '201', description: 'OK'),
        SwaggerResponse(code: '401', description: 'unauthorized')
      ];
      final result = generator.getSuccessedResponse(responses);

      expect(result, equals(responses.first));
    });

    test('Should return response if code is 201', () {
      final responses = <SwaggerResponse>[
        SwaggerResponse(code: '201', description: 'Cool'),
        SwaggerResponse(code: '401', description: 'unauthorized')
      ];
      final result = generator.getSuccessedResponse(responses);

      expect(result, equals(responses.first));
    });

    test('Should return null if there is no success response', () {
      final responses = <SwaggerResponse>[
        SwaggerResponse(code: '204', description: 'No content'),
        SwaggerResponse(code: '401', description: 'unauthorized')
      ];
      final result = generator.getSuccessedResponse(responses);

      expect(result, equals(null));
    });
  });

  group('Tests for getParameterContent', () {
    test('Should generate body parameter by schema -> ref', () {
      final parameter = SwaggerRequestParameter(
          inParameter: 'body',
          name: 'testParameter',
          isRequired: true,
          schema: SwaggerParameterSchema(originalRef: 'TestItem'));

      final result = generator.getParameterContent(
          parameter: parameter,
          ignoreHeaders: false,
          path: '/path',
          requestType: 'get');

      expect(result, contains('@Body() @required TestItem? testParameter'));
    });

    test('Should generate formData parameter by schema -> ref', () {
      final parameter = SwaggerRequestParameter(
          inParameter: 'formData',
          name: 'testParameter',
          isRequired: true,
          schema: SwaggerParameterSchema(originalRef: 'TestItem'));

      final result = generator.getParameterContent(
          parameter: parameter,
          ignoreHeaders: false,
          path: '/path',
          requestType: 'get');

      expect(result,
          contains("@Field('testParameter') @required dynamic? testParameter"));
    });

    test('Should generate body parameter by schema -> enum values', () {
      final parameter = SwaggerRequestParameter(
          inParameter: 'body',
          name: 'testParameter',
          isRequired: true,
          schema: SwaggerParameterSchema(enumValues: <String>['one', 'two']));

      final result = generator.getParameterContent(
          parameter: parameter,
          ignoreHeaders: false,
          path: '/path',
          requestType: 'get');

      expect(
          result,
          contains(
              '@Body() @required enums.PathGetTestParameter? testParameter'));
    });

    test('Should generate body parameter if no ref and no schema', () {
      final parameter = SwaggerRequestParameter(
          inParameter: 'body', name: 'testParameter', isRequired: true);

      final result = generator.getParameterContent(
          parameter: parameter, ignoreHeaders: false);

      expect(result, contains('@Body() @required Object? testParameter'));
    });

    test('Should generate header parameter if not ignore', () {
      final parameter = SwaggerRequestParameter(
          inParameter: 'header', name: 'testParameter', isRequired: true);

      final result = generator.getParameterContent(
          parameter: parameter,
          ignoreHeaders: false,
          useRequiredAttribute: true);

      expect(result,
          contains("@Header('testParameter') @required String testParameter"));
    });

    test('Should generate header parameter if ignore headers == true', () {
      final parameter = SwaggerRequestParameter(
          inParameter: 'header', name: 'testParameter', isRequired: true);

      final result = generator.getParameterContent(
          parameter: parameter,
          ignoreHeaders: true,
          useRequiredAttribute: true);

      expect(result, equals(''));
    });

    test('Should NOT generate header parameter if ignore headers == false', () {
      final parameter = SwaggerRequestParameter(
          inParameter: 'header', name: 'testParameter', isRequired: true);

      final result = generator.getParameterContent(
          parameter: parameter,
          ignoreHeaders: false,
          useRequiredAttribute: false);

      expect(
          result, equals('@Header(\'testParameter\')  String testParameter'));
    });

    test('Should generate custom parameter types -> schema', () {
      final parameter = SwaggerRequestParameter(
          inParameter: 'MyCustomType',
          name: 'testParameter',
          isRequired: true,
          schema: SwaggerParameterSchema(type: 'MyCustomType'));

      final result = generator.getParameterContent(
          parameter: parameter, ignoreHeaders: true);

      expect(
          result,
          equals(
              "@MyCustomType('testParameter') @required MyCustomType? testParameter"));
    });

    test('Should ignore cookie parameters', () {
      final parameter = SwaggerRequestParameter(
          inParameter: 'cookie', name: 'testParameter', isRequired: true);

      final result = generator.getParameterContent(
          parameter: parameter, ignoreHeaders: false);

      expect(result, contains(''));
    });
  });

  group('Tests for getParameterTypeName', () {
    test('Should convert string -> String', () {
      final result = generator.getParameterTypeName('string');

      expect(result, 'String');
    });

    test('Should convert file to List<int>', () {
      final result = generator.getParameterTypeName('file');

      expect(result, 'List<int>');
    });

    test('Should convert array of int to List<int>', () {
      final result = generator.getParameterTypeName('array', 'integer');

      expect(result, 'List<int>');
    });

    test('Should convert array of TestItem to List<TestItem>', () {
      final result = generator.getParameterTypeName('array', 'TestItem');

      expect(result, 'List<TestItem>');
    });

    test('Should convert unknown type to unknown type', () {
      final result = generator.getParameterTypeName('Super_cool_type');

      expect(result, 'Super_cool_type');
    });

    test('Should convert null to dynamic', () {
      final result = generator.getParameterTypeName(null);

      expect(result, 'dynamic');
    });
  });

  group('Tests for createSummaryParameters', () {
    test('Should generate description for parameter', () {
      final result = generator.createSummaryParameters('testParameterName',
          'testParameterDescription', 'query', GeneratorOptions());
      expect(result,
          equals('	///@param testParameterName testParameterDescription'));
    });

    test('Should replace special characters in description', () {
      final result = generator.createSummaryParameters(
          'testParameterName',
          'test\tParameter\nDescription\rSplitted',
          'query',
          GeneratorOptions());
      expect(
          result,
          equals(
              '	///@param testParameterName test Parameter Description Splitted'));
    });
  });

  group('Tests for abbreviationToCamelCase', () {
    test('Should make CamelCase for belarusCOUNTRY', () {
      final result = generator.abbreviationToCamelCase('BELARUS');
      expect(result, equals('Belarus'));
    });
  });

  group('Tests for getAllMethodsContent', () {
    test('Should generate default name for method without operationId', () {
      final result = generator.getAllMethodsContent(
          SwaggerRoot(paths: <SwaggerPath>[
            SwaggerPath(path: '/test/path', requests: <SwaggerRequest>[
              SwaggerRequest(
                  type: 'get',
                  operationId: null,
                  parameters: <SwaggerRequestParameter>[],
                  responses: <SwaggerResponse>[])
            ])
          ]),
          '',
          GeneratorOptions(),
          [],
          [],
          {});

      expect(result, contains('Future<chopper.Response> testPathGet();'));
    });

    test(
        'Should generate additional method for enum in body for items -> enumValues',
        () {
      final result = generator.getAllMethodsContent(
          SwaggerRoot(paths: <SwaggerPath>[
            SwaggerPath(path: '/test/path', requests: <SwaggerRequest>[
              SwaggerRequest(type: 'get', operationId: null, parameters: [
                SwaggerRequestParameter(
                    name: 'parameterName',
                    inParameter: 'body',
                    isRequired: true,
                    items: SwaggerRequestItems(enumValues: ['one'])),
              ], responses: <SwaggerResponse>[])
            ])
          ]),
          '',
          GeneratorOptions(),
          [],
          [],
          {});

      expect(result, contains('Future<chopper.Response> _testPathGet'));
    });

    test(
        'Should generate additional method for enum in body for -> schema -> enumValues',
        () {
      final result = generator.getAllMethodsContent(
          SwaggerRoot(paths: <SwaggerPath>[
            SwaggerPath(path: '/test/path', requests: <SwaggerRequest>[
              SwaggerRequest(type: 'get', operationId: null, parameters: [
                SwaggerRequestParameter(
                    name: 'parameterName',
                    inParameter: 'body',
                    isRequired: true,
                    schema: SwaggerParameterSchema(enumValues: ['one'])),
              ], responses: <SwaggerResponse>[])
            ])
          ]),
          '',
          GeneratorOptions(),
          [],
          [],
          {});

      expect(result, contains('Future<chopper.Response> _testPathGet'));
    });

    test(
        'Should generate additional method for enum in body for item -> enumValues',
        () {
      final result = generator.getAllMethodsContent(
          SwaggerRoot(paths: <SwaggerPath>[
            SwaggerPath(path: '/test/path', requests: <SwaggerRequest>[
              SwaggerRequest(type: 'get', operationId: null, parameters: [
                SwaggerRequestParameter(
                    name: 'parameterName',
                    inParameter: 'body',
                    isRequired: true,
                    item: ParameterItem(enumValues: ['one'])),
              ], responses: <SwaggerResponse>[])
            ])
          ]),
          '',
          GeneratorOptions(),
          [],
          [],
          {});

      expect(result, contains('Future<chopper.Response> _testPathGet'));
    });
  });
  group('Tests for getMethodContent', () {
    test('Should', () {
      final result = generator.getMethodContent(
          hasFormData: true,
          methodName: 'methodName',
          parametersComments: 'parameters',
          requestPath: 'path',
          parametersContent: 'requiredParameters',
          returnType: 'returnType',
          hasEnums: false,
          summary: 'summary',
          typeRequest: 'typeRequests');

      expect(result, contains('@FactoryConverter'));
    });

    test('Should generate private and public methods for enums in bodies', () {
      final result = generator.getMethodContent(
          hasFormData: true,
          methodName: 'methodName',
          parametersComments: 'parameters',
          requestPath: 'path',
          parametersContent: 'requiredParameters',
          returnType: 'returnType',
          summary: 'summary',
          hasEnums: true,
          ignoreHeaders: true,
          typeRequest: 'typeRequests',
          enumInBodyName: 'enumInBody',
          allEnumNames: [],
          parameters: [
            SwaggerRequestParameter(inParameter: 'body', name: 'pet')
          ]);

      expect(
          result, contains('Future<chopper.Response<ReturnType>> _methodName'));
    });
  });

  group('Tests for getBodyParameter', () {
    test('Should return MyObject from schema->ref', () {
      final parameter = SwaggerRequestParameter(
          inParameter: 'body',
          name: 'myName',
          isRequired: true,
          schema: SwaggerParameterSchema(ref: '#definitions/MyObject'));
      final result = generator.getBodyParameter(parameter, 'path', 'type', []);

      expect(result, equals('@Body() @required MyObject? myName'));
    });
  });

  group('Tests for generatePublicMethod', () {
    test('Should generate correct original method usage', () {
      final methodName = 'getSomePet';
      final returnType = 'String';
      final path = 'path';
      final type = 'type';
      final parameters = '@Body() pet';
      final parametersList = [
        SwaggerRequestParameter(
            inParameter: 'body',
            name: 'pet',
            items: SwaggerRequestItems(enumValues: ['one']))
      ];

      final result = generator.generatePublicMethod(methodName, returnType,
          parameters, path, type, true, parametersList, []);

      expect(result, contains('getSomePet(pet)'));
    });
  });

  group('Tests for getEnumParameter', () {
    test('Should generate enum parameter from items -> enum values', () {
      final result = generator.getEnumParameter('path', 'get', 'myParameter', [
        SwaggerRequestParameter(
            type: 'array',
            items: SwaggerRequestItems(enumValues: ['one', 'two']))
      ]);

      expect(result, equals('enums.\$PathGetMyParameterMap[myParameter]'));
    });

    test('Should generate enum parameter from item -> enum values', () {
      final result = generator.getEnumParameter('path', 'get', 'myParameter', [
        SwaggerRequestParameter(
          item: ParameterItem(enumValues: ['one', 'two']),
          type: 'array',
        )
      ]);

      expect(result, equals('enums.\$PathGetMyParameterMap[myParameter]'));
    });

    test('Should generate enum parameter from schema -> enum values', () {
      final result = generator.getEnumParameter('path', 'get', 'myParameter', [
        SwaggerRequestParameter(
          schema: SwaggerParameterSchema(enumValues: ['one', 'two']),
          type: 'array',
        )
      ]);

      expect(result, equals('enums.\$PathGetMyParameterMap[myParameter]'));
    });

    test('Should', () {
      final result = generator.getEnumParameter('path', 'get', 'myParameter', [
        SwaggerRequestParameter(
          name: 'myParameter',
          schema: SwaggerParameterSchema(
            enumValues: ['one', 'two'],
          ),
          type: 'array',
        )
      ]);

      expect(
          result,
          equals(
              'myParameter!.map((element) {enums.\$PathGetMyParameterMap[element];}).toList()'));
    });
  });
}
