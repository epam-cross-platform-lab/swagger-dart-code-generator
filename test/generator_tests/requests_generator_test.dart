// import 'package:swagger_dart_code_generator/src/code_generators/v3/swagger_requests_generator_v3.dart';
// import 'package:swagger_dart_code_generator/src/models/generator_options.dart';
// import 'package:swagger_dart_code_generator/src/swagger_models/requests/parameter_item.dart';
// import 'package:swagger_dart_code_generator/src/swagger_models/requests/swagger_parameter_schema.dart';
// import 'package:swagger_dart_code_generator/src/swagger_models/requests/swagger_request.dart';
// import 'package:swagger_dart_code_generator/src/swagger_models/requests/swagger_request_items.dart';
// import 'package:swagger_dart_code_generator/src/swagger_models/requests/swagger_request_parameter.dart';
// import 'package:swagger_dart_code_generator/src/swagger_models/responses/swagger_response.dart';
// import 'package:swagger_dart_code_generator/src/swagger_models/swagger_path.dart';
// import 'package:swagger_dart_code_generator/src/swagger_models/swagger_root.dart';
// import 'package:test/test.dart';

// import '../code_examples.dart';

// void main() {
//   final generator = SwaggerRequestsGeneratorV3();
//   const fileName = 'order_service';
//   const className = 'OrderSerice';

//   group('Tests for getDefaultParameter', () {
//     test('Should use parameter -> schema -> enumValues', () {
//       final parameter = SwaggerRequestParameter(
//           isRequired: true,
//           inParameter: 'query',
//           name: 'number',
//           schema: SwaggerParameterSchema(enumValues: ['one', 'two']));

//       final result = generator.getDefaultParameter(parameter, '/path', 'get');

//       expect(result,
//           equals('@Query(\'number\') @required enums.PathGetNumber? number'));
//     });

//     test('Should use parameter -> items -> enumValues', () {
//       final parameter = SwaggerRequestParameter(
//           isRequired: true,
//           inParameter: 'query',
//           name: 'number',
//           items: SwaggerRequestItems(enumValues: ['one', 'two']));

//       final result = generator.getDefaultParameter(parameter, '/path', 'get');

//       expect(
//           result,
//           equals(
//               '@Query(\'number\') @required List<enums.PathGetNumber>? number'));
//     });
//   });

//   group('Tests for additional methids', () {
//     test('Should transform "parametersGET1" to "parametersGet1"', () {
//       const str = 'parametersGET1';
//       final result = generator.abbreviationToCamelCase(str);

//       expect(result, equals('parametersGet1'));
//     });

//     test('Should get parameter summary', () {
//       const name = 'orderId';
//       const description = 'Id of the order';
//       final result = generator.createSummaryParameters(name, description,
//           'query', GeneratorOptions(inputFolder: '', outputFolder: ''));

//       expect(result, contains('///@param orderId Id of the order'));
//     });

//     test('Should get parameter type name', () {
//       final result = generator.getParameterTypeName('array', 'integer');

//       expect(result, contains('List<int>'));
//     });

//     test('Should get validate name', () {
//       const name = 'x-application';
//       final result = generator.validateParameterName(name);

//       expect(result, contains('xApplication'));
//     });

//     test('Should add \$ if name is key word', () {
//       const name = 'null';
//       final result = generator.validateParameterName(name);

//       expect(result, contains('\$null'));
//     });

//     test('Should create chopper client', () {
//       const name = 'OrderService';
//       const host = 'some.host';
//       const path = '/path';
//       final result = generator.getChopperClientContent(name, host, path,
//           GeneratorOptions(inputFolder: '', outputFolder: ''), true);

//       expect(result, contains('static OrderService create'));
//       expect(result, contains('services: [_\$OrderService()],'));
//     });
//   });

//   group('Tests for parameters', () {
//     test('Should ignore headers if option is true', () {
//       final result = generator.generate(
//           request_with_header,
//           className,
//           fileName,
//           GeneratorOptions(
//             ignoreHeaders: true,
//             inputFolder: '',
//             outputFolder: '',
//           ));

//       final isContainHeader = result.contains('@Header');

//       expect(isContainHeader, equals(false));
//     });

//     test('Should generate response from ref for Dynamic types', () {
//       final result = generator.generate(
//           request_with_ref_response,
//           className,
//           fileName,
//           GeneratorOptions(
//             ignoreHeaders: true,
//             inputFolder: '',
//             outputFolder: '',
//           ));

//       expect(result, contains('Response<Object>'));
//     });

//     test('Should accept requestBody enum', () {
//       final result = generator.generate(
//           request_with_enum_request_body,
//           className,
//           fileName,
//           GeneratorOptions(
//             ignoreHeaders: true,
//             inputFolder: '',
//             outputFolder: '',
//           ));

//       expect(result, contains('@Body() @required String? body'));
//     });

//     test('Should generate method name from path if such option is true', () {
//       final result = generator.generate(
//           request_with_header,
//           className,
//           fileName,
//           GeneratorOptions(
//             usePathForRequestNames: true,
//             inputFolder: '',
//             outputFolder: '',
//           ));

//       expect(result, contains('v2OrderSummariesGet'));
//     });

//     test('Should NOT ignore headers if option is true', () {
//       final result = generator.generate(
//           request_with_header,
//           className,
//           fileName,
//           GeneratorOptions(
//             ignoreHeaders: false,
//             inputFolder: '',
//             outputFolder: '',
//           ));

//       final isContainHeader = result.contains('@Header');

//       expect(isContainHeader, equals(true));
//     });

//     test(
//         'Should generate List<String> for query parameters type array and items.type string',
//         () {
//       final result = generator.generate(
//           request_with_array_string,
//           className,
//           fileName,
//           GeneratorOptions(
//             ignoreHeaders: false,
//             inputFolder: '',
//             outputFolder: '',
//           ));

//       expect(result, contains('List<String>? applications'));
//     });

//     test(
//         'Should generate List<String> for query parameters type array and items.type string',
//         () {
//       final result = generator.generate(
//           request_with_array_item_summary,
//           className,
//           fileName,
//           GeneratorOptions(
//             ignoreHeaders: false,
//             inputFolder: '',
//             outputFolder: '',
//           ));

//       expect(result, contains('Future<chopper.Response<List<ItemSummary>>>'));
//     });
//   });

//   group('Tests for getReturnTypeName', () {
//     test(
//         'Should generate List<String> for return type parameters type array and items.type string',
//         () {
//       final result = generator.generate(
//           request_with_list_string_return_type,
//           className,
//           fileName,
//           GeneratorOptions(
//             ignoreHeaders: false,
//             inputFolder: '',
//             outputFolder: '',
//           ));

//       expect(result, contains('Future<chopper.Response<List<String>>>'));
//     });

//     test('Should generate MyObject if ref is #definitions/MyObject', () {
//       final result = generator.generate(
//           request_with_object_ref_response,
//           className,
//           fileName,
//           GeneratorOptions(
//             ignoreHeaders: false,
//             inputFolder: '',
//             outputFolder: '',
//           ));

//       expect(result, contains('Future<chopper.Response<MyObject>>'));
//     });

//     test(
//         'Should generate List<TestItem> for return type parameters type array and items.type string',
//         () {
//       final result = generator.generate(
//           request_with_list_test_item_return_type,
//           className,
//           fileName,
//           GeneratorOptions(
//             ignoreHeaders: false,
//             inputFolder: '',
//             outputFolder: '',
//           ));

//       expect(result, contains('Future<chopper.Response<List<TestItem>>>'));
//     });

//     test(
//         'Should generate List<OverriddenType> for return type parameters type array and items.type string',
//         () {
//       final result = generator.generate(
//           request_with_list_test_item_return_type,
//           className,
//           fileName,
//           GeneratorOptions(
//               ignoreHeaders: false,
//               inputFolder: '',
//               outputFolder: '',
//               responseOverrideValueMap: <ResponseOverrideValueMap>[
//                 ResponseOverrideValueMap(
//                     method: 'get',
//                     url: '/model/items',
//                     overriddenValue: 'List<OverriddenType>')
//               ]));

//       expect(
//           result, contains('Future<chopper.Response<List<OverriddenType>>>'));
//     });

//     test('Should generate return type by originalRef', () {
//       final result = generator.generate(
//           request_with_original_ref_return_type,
//           className,
//           fileName,
//           GeneratorOptions(
//               ignoreHeaders: false, inputFolder: '', outputFolder: ''));

//       expect(result, contains('Future<chopper.Response<TestItem>>'));
//     });

//     test(
//         'Should generate return type by content -> first -> responseType originalRef',
//         () {
//       final result = generator.generate(
//           request_with_content_first_response_type,
//           className,
//           fileName,
//           GeneratorOptions(
//               ignoreHeaders: false, inputFolder: '', outputFolder: ''));

//       expect(result, contains('Future<chopper.Response<String>>'));
//     });

//     test('Should generate return type by content -> first -> responseType ref',
//         () {
//       final result = generator.generate(
//           request_with_content_first_response_ref,
//           className,
//           fileName,
//           GeneratorOptions(
//               ignoreHeaders: false, inputFolder: '', outputFolder: ''));

//       expect(result,
//           contains('Future<chopper.Response<TestType>> getModelItems();'));
//     });

//     test('Should generate return type by content -> first -> ref', () {
//       final result = generator.getReturnTypeName(
//         <SwaggerResponse>[
//           SwaggerResponse(
//               code: '200',
//               content: <Content>[Content(ref: '#components/schemas/TestItem')])
//         ],
//         '/test/items',
//         'get',
//         <ResponseOverrideValueMap>[],
//         [],
//         {},
//         GeneratorOptions(inputFolder: '', outputFolder: ''),
//       );

//       expect(result, equals('TestItem'));
//     });
//   });

//   group('Tests for getSuccessedResponse', () {
//     test('Should return response if code 200', () {
//       final responses = <SwaggerResponse>[
//         SwaggerResponse(code: '200', description: 'success response'),
//         SwaggerResponse(code: '401', description: 'unauthorized')
//       ];
//       final result = generator.getSuccessedResponse(responses);

//       expect(result, equals(responses.first));
//     });

//     test('Should return response if description is OK', () {
//       final responses = <SwaggerResponse>[
//         SwaggerResponse(code: '201', description: 'OK'),
//         SwaggerResponse(code: '401', description: 'unauthorized')
//       ];
//       final result = generator.getSuccessedResponse(responses);

//       expect(result, equals(responses.first));
//     });

//     test('Should return response if code is 201', () {
//       final responses = <SwaggerResponse>[
//         SwaggerResponse(code: '201', description: 'Cool'),
//         SwaggerResponse(code: '401', description: 'unauthorized')
//       ];
//       final result = generator.getSuccessedResponse(responses);

//       expect(result, equals(responses.first));
//     });

//     test('Should return null if there is no success response', () {
//       final responses = <SwaggerResponse>[
//         SwaggerResponse(code: '204', description: 'No content'),
//         SwaggerResponse(code: '401', description: 'unauthorized')
//       ];
//       final result = generator.getSuccessedResponse(responses);

//       expect(result, equals(null));
//     });
//   });

//   group('Tests for getParameterContent', () {
//     test('Should generate body parameter by schema -> ref', () {
//       final parameter = SwaggerRequestParameter(
//           inParameter: 'body',
//           name: 'testParameter',
//           isRequired: true,
//           schema: SwaggerParameterSchema(originalRef: 'TestItem'));

//       final result = generator.getParameterContent(
//         parameter: parameter,
//         ignoreHeaders: false,
//         path: '/path',
//         requestType: 'get',
//         useRequiredAttribute: false,
//         allEnumNames: [],
//         options: GeneratorOptions(inputFolder: '', outputFolder: ''),
//       );

//       expect(result, contains('@Body() @required TestItem? testParameter'));
//     });

//     test('Should generate formData parameter by schema -> ref', () {
//       final parameter = SwaggerRequestParameter(
//           inParameter: 'formData',
//           name: 'testParameter',
//           isRequired: true,
//           schema: SwaggerParameterSchema(originalRef: 'TestItem'));

//       final result = generator.getParameterContent(
//         parameter: parameter,
//         ignoreHeaders: false,
//         path: '/path',
//         requestType: 'get',
//         useRequiredAttribute: false,
//         allEnumNames: [],
//         options: GeneratorOptions(inputFolder: '', outputFolder: ''),
//       );

//       expect(result,
//           contains("@Field('testParameter') @required dynamic? testParameter"));
//     });

//     test('Should generate body parameter by schema -> enum values', () {
//       final parameter = SwaggerRequestParameter(
//           inParameter: 'body',
//           name: 'testParameter',
//           isRequired: true,
//           schema: SwaggerParameterSchema(enumValues: <String>['one', 'two']));

//       final result = generator.getParameterContent(
//         parameter: parameter,
//         ignoreHeaders: false,
//         path: '/path',
//         requestType: 'get',
//         useRequiredAttribute: false,
//         allEnumNames: [],
//         options: GeneratorOptions(inputFolder: '', outputFolder: ''),
//       );

//       expect(
//           result,
//           contains(
//               '@Body() @required enums.PathGetTestParameter? testParameter'));
//     });

//     test('Should generate body parameter if no ref and no schema', () {
//       final parameter = SwaggerRequestParameter(
//           inParameter: 'body', name: 'testParameter', isRequired: true);

//       final result = generator.getParameterContent(
//         parameter: parameter,
//         ignoreHeaders: false,
//         useRequiredAttribute: false,
//         allEnumNames: [],
//         path: '',
//         requestType: '',
//         options: GeneratorOptions(inputFolder: '', outputFolder: ''),
//       );

//       expect(result, contains('@Body() @required Object? testParameter'));
//     });

//     test('Should generate header parameter if not ignore', () {
//       final parameter = SwaggerRequestParameter(
//           inParameter: 'header', name: 'testParameter', isRequired: true);

//       final result = generator.getParameterContent(
//         parameter: parameter,
//         ignoreHeaders: false,
//         useRequiredAttribute: true,
//         requestType: '',
//         path: '',
//         allEnumNames: [],
//         options: GeneratorOptions(inputFolder: '', outputFolder: ''),
//       );

//       expect(result,
//           contains("@Header('testParameter') required String? testParameter"));
//     });

//     test('Should generate header parameter if ignore headers == true', () {
//       final parameter = SwaggerRequestParameter(
//           inParameter: 'header', name: 'testParameter', isRequired: true);

//       final result = generator.getParameterContent(
//         parameter: parameter,
//         ignoreHeaders: true,
//         useRequiredAttribute: true,
//         allEnumNames: [],
//         path: '',
//         requestType: '',
//         options: GeneratorOptions(inputFolder: '', outputFolder: ''),
//       );

//       expect(result, equals(''));
//     });

//     test('Should NOT generate header parameter if ignore headers == false', () {
//       final parameter = SwaggerRequestParameter(
//           inParameter: 'header', name: 'testParameter', isRequired: true);

//       final result = generator.getParameterContent(
//         parameter: parameter,
//         ignoreHeaders: false,
//         useRequiredAttribute: false,
//         allEnumNames: [],
//         path: '',
//         requestType: '',
//         options: GeneratorOptions(inputFolder: '', outputFolder: ''),
//       );

//       expect(
//           result, equals('@Header(\'testParameter\')  String? testParameter'));
//     });

//     test('Should generate custom parameter types -> schema', () {
//       final parameter = SwaggerRequestParameter(
//           inParameter: 'MyCustomType',
//           name: 'testParameter',
//           isRequired: true,
//           schema: SwaggerParameterSchema(type: 'MyCustomType'));

//       final result = generator.getParameterContent(
//         parameter: parameter,
//         ignoreHeaders: true,
//         allEnumNames: [],
//         path: '',
//         useRequiredAttribute: false,
//         requestType: '',
//         options: GeneratorOptions(inputFolder: '', outputFolder: ''),
//       );

//       expect(
//           result,
//           equals(
//               "@MyCustomType('testParameter') @required MyCustomType? testParameter"));
//     });

//     test('Should ignore cookie parameters', () {
//       final parameter = SwaggerRequestParameter(
//           inParameter: 'cookie', name: 'testParameter', isRequired: true);

//       final result = generator.getParameterContent(
//         parameter: parameter,
//         ignoreHeaders: false,
//         allEnumNames: [],
//         path: '',
//         requestType: '',
//         useRequiredAttribute: false,
//         options: GeneratorOptions(inputFolder: '', outputFolder: ''),
//       );

//       expect(result, contains(''));
//     });
//   });

//   group('Tests for getParameterTypeName', () {
//     test('Should convert string -> String', () {
//       final result = generator.getParameterTypeName('string');

//       expect(result, 'String');
//     });

//     test('Should convert file to List<int>', () {
//       final result = generator.getParameterTypeName('file');

//       expect(result, 'List<int>');
//     });

//     test('Should convert array of int to List<int>', () {
//       final result = generator.getParameterTypeName('array', 'integer');

//       expect(result, 'List<int>');
//     });

//     test('Should convert array of TestItem to List<TestItem>', () {
//       final result = generator.getParameterTypeName('array', 'TestItem');

//       expect(result, 'List<TestItem>');
//     });

//     test('Should convert unknown type to unknown type', () {
//       final result = generator.getParameterTypeName('Super_cool_type');

//       expect(result, 'Super_cool_type');
//     });

//     test('Should convert null to dynamic', () {
//       final result = generator.getParameterTypeName('');

//       expect(result, 'dynamic');
//     });
//   });

//   group('Tests for createSummaryParameters', () {
//     test('Should generate description for parameter', () {
//       final result = generator.createSummaryParameters(
//           'testParameterName',
//           'testParameterDescription',
//           'query',
//           GeneratorOptions(
//             inputFolder: '',
//             outputFolder: '',
//           ));
//       expect(result,
//           equals('	///@param testParameterName testParameterDescription'));
//     });

//     test('Should replace special characters in description', () {
//       final result = generator.createSummaryParameters(
//           'testParameterName',
//           'test\tParameternnDescription\rSplitted',
//           'query',
//           GeneratorOptions(
//             inputFolder: '',
//             outputFolder: '',
//           ));
//       expect(
//           result,
//           equals(
//               '	///@param testParameterName test Parameter Description Splitted'));
//     });
//   });

//   group('Tests for abbreviationToCamelCase', () {
//     test('Should make CamelCase for belarusCOUNTRY', () {
//       final result = generator.abbreviationToCamelCase('BELARUS');
//       expect(result, equals('Belarus'));
//     });
//   });

//   group('Tests for getAllMethodsContent', () {
//     test('Should generate default name for method without operationId', () {
//       final result = generator.getAllMethodsContent(
//           SwaggerRoot(paths: <SwaggerPath>[
//             SwaggerPath(path: '/test/path', requests: <SwaggerRequest>[
//               SwaggerRequest(
//                   type: 'get',
//                   operationId: '',
//                   parameters: <SwaggerRequestParameter>[],
//                   responses: <SwaggerResponse>[])
//             ])
//           ]),
//           '',
//           GeneratorOptions(inputFolder: '', outputFolder: ''),
//           [],
//           [],
//           {});

//       expect(result, contains('Future<chopper.Response> testPathGet();'));
//     });

//     test(
//         'Should generate additional method for enum in body for items -> enumValues',
//         () {
//       final result = generator.getAllMethodsContent(
//           SwaggerRoot(paths: <SwaggerPath>[
//             SwaggerPath(path: '/test/path', requests: <SwaggerRequest>[
//               SwaggerRequest(type: 'get', operationId: '', parameters: [
//                 SwaggerRequestParameter(
//                     name: 'parameterName',
//                     inParameter: 'body',
//                     isRequired: true,
//                     items: SwaggerRequestItems(enumValues: ['one'])),
//               ], responses: <SwaggerResponse>[])
//             ])
//           ]),
//           '',
//           GeneratorOptions(inputFolder: '', outputFolder: ''),
//           [],
//           [],
//           {});

//       expect(result, contains('Future<chopper.Response> _testPathGet'));
//     });

//     test(
//         'Should generate additional method for enum in body for -> schema -> enumValues',
//         () {
//       final result = generator.getAllMethodsContent(
//           SwaggerRoot(paths: <SwaggerPath>[
//             SwaggerPath(path: '/test/path', requests: <SwaggerRequest>[
//               SwaggerRequest(type: 'get', operationId: '', parameters: [
//                 SwaggerRequestParameter(
//                     name: 'parameterName',
//                     inParameter: 'body',
//                     isRequired: true,
//                     schema: SwaggerParameterSchema(enumValues: ['one'])),
//               ], responses: <SwaggerResponse>[])
//             ])
//           ]),
//           '',
//           GeneratorOptions(inputFolder: '', outputFolder: ''),
//           [],
//           [],
//           {});

//       expect(result, contains('Future<chopper.Response> _testPathGet'));
//     });

//     test(
//         'Should generate additional method for enum in body for item -> enumValues',
//         () {
//       final result = generator.getAllMethodsContent(
//           SwaggerRoot(paths: <SwaggerPath>[
//             SwaggerPath(path: '/test/path', requests: <SwaggerRequest>[
//               SwaggerRequest(type: 'get', operationId: '', parameters: [
//                 SwaggerRequestParameter(
//                     name: 'parameterName',
//                     inParameter: 'body',
//                     isRequired: true,
//                     item: ParameterItem(enumValues: ['one'])),
//               ], responses: <SwaggerResponse>[])
//             ])
//           ]),
//           '',
//           GeneratorOptions(inputFolder: '', outputFolder: ''),
//           [],
//           [],
//           {});

//       expect(result, contains('Future<chopper.Response> _testPathGet'));
//     });
//   });
//   group('Tests for getMethodContent', () {
//     test('Should', () {
//       final result = generator.getMethodContent(
//         hasFormData: true,
//         methodName: 'methodName',
//         parametersComments: 'parameters',
//         requestPath: 'path',
//         parametersContent: 'requiredParameters',
//         returnType: 'returnType',
//         hasEnums: false,
//         summary: 'summary',
//         typeRequest: 'typeRequests',
//         ignoreHeaders: false,
//         enumInBodyName: '',
//         allEnumNames: [],
//         parameters: [],
//       );

//       expect(result, contains('@FactoryConverter'));
//     });

//     test('Should generate private and public methods for enums in bodies', () {
//       final result = generator.getMethodContent(
//           hasFormData: true,
//           methodName: 'methodName',
//           parametersComments: 'parameters',
//           requestPath: 'path',
//           parametersContent: 'requiredParameters',
//           returnType: 'returnType',
//           summary: 'summary',
//           hasEnums: true,
//           ignoreHeaders: true,
//           typeRequest: 'typeRequests',
//           enumInBodyName: 'enumInBody',
//           allEnumNames: [],
//           parameters: [
//             SwaggerRequestParameter(inParameter: 'body', name: 'pet')
//           ]);

//       expect(
//           result, contains('Future<chopper.Response<ReturnType>> _methodName'));
//     });
//   });

//   group('Tests for getBodyParameter', () {
//     test('Should return MyObject from schema->ref', () {
//       final parameter = SwaggerRequestParameter(
//           inParameter: 'body',
//           name: 'myName',
//           isRequired: true,
//           schema: SwaggerParameterSchema(ref: '#definitions/MyObject'));
//       final result = generator.getBodyParameter(
//         parameter,
//         'path',
//         'type',
//         [],
//         GeneratorOptions(inputFolder: '', outputFolder: ''),
//       );

//       expect(result, equals('@Body() @required MyObject? myName'));
//     });
//   });

//   group('Tests for generatePublicMethod', () {
//     test('Should generate correct original method usage', () {
//       final methodName = 'getSomePet';
//       final returnType = 'String';
//       final path = 'path';
//       final type = 'type';
//       final parameters = '@Body() pet';
//       final parametersList = [
//         SwaggerRequestParameter(
//             inParameter: 'body',
//             name: 'pet',
//             items: SwaggerRequestItems(enumValues: ['one']))
//       ];

//       final result = generator.generatePublicMethod(methodName, returnType,
//           parameters, path, type, true, parametersList, []);

//       expect(result, contains('getSomePet(pet)'));
//     });
//   });

//   group('Tests for getEnumParameter', () {
//     test('Should generate enum parameter from items -> enum values', () {
//       final result = generator.getEnumParameter('path', 'get', 'myParameter', [
//         SwaggerRequestParameter(
//             type: 'array',
//             items: SwaggerRequestItems(enumValues: ['one', 'two']))
//       ]);

//       expect(result, equals('enums.\$PathGetMyParameterMap[myParameter]'));
//     });

//     test('Should generate enum parameter from item -> enum values', () {
//       final result = generator.getEnumParameter('path', 'get', 'myParameter', [
//         SwaggerRequestParameter(
//           item: ParameterItem(enumValues: ['one', 'two']),
//           type: 'array',
//         )
//       ]);

//       expect(result, equals('enums.\$PathGetMyParameterMap[myParameter]'));
//     });

//     test('Should generate enum parameter from schema -> enum values', () {
//       final result = generator.getEnumParameter('path', 'get', 'myParameter', [
//         SwaggerRequestParameter(
//           schema: SwaggerParameterSchema(enumValues: ['one', 'two']),
//           type: 'array',
//         )
//       ]);

//       expect(result, equals('enums.\$PathGetMyParameterMap[myParameter]'));
//     });

//     test('Should', () {
//       final result = generator.getEnumParameter('path', 'get', 'myParameter', [
//         SwaggerRequestParameter(
//           name: 'myParameter',
//           schema: SwaggerParameterSchema(
//             enumValues: ['one', 'two'],
//           ),
//           type: 'array',
//         )
//       ]);

//       expect(
//           result,
//           equals(
//               'myParameter!.map((element) {enums.\$PathGetMyParameterMap[element];}).toList()'));
//     });
//   });

//   group('Tests for models from responses', () {
//     test('Should generate correct response type name', () {
//       final result = generator.generate(
//           request_with_return_type_injected,
//           'MyService',
//           'my_service',
//           GeneratorOptions(
//             inputFolder: '',
//             outputFolder: '',
//           ));

//       expect(result,
//           contains('Future<chopper.Response<ModelItemsGet\$Response>>'));
//     });
//   });
// }

import 'package:swagger_dart_code_generator/src/code_generators/swagger_requests_generator.dart';
import 'package:swagger_dart_code_generator/src/code_generators/v3/swagger_enums_generator_v3.dart';
import 'package:swagger_dart_code_generator/src/code_generators/v3/swagger_models_generator_v3.dart';
import 'package:swagger_dart_code_generator/src/models/generator_options.dart';

void main() {
  final generator = SwaggerRequestsGenerator();
  final result = generator.generate(
      code: aaa,
      className: 'ExampleSwagger',
      fileName: 'swagger_example',
      options: GeneratorOptions(
        inputFolder: '',
        outputFolder: '',
      ));

  final aaaa = 0;
}

final aaa = '''
{
  "openapi" : "3.0.1",
  "info" : {
    "title" : "Image Service",
    "version" : "V1"
  },
  "paths" : {
    "/intent" : {
      "get" : {
        "tags" : [ "Image intent resource operations" ],
        "summary" : "API for retrieving the actual location of images matching certain CRID + imageType combinations",
        "operationId" : "getImageMetadataIntent",
        "parameters" : [ {
          "name" : "jsonBody",
          "in" : "query",
          "description" : "JSON body",
          "required" : true,
          "schema" : {
            "type" : "string"
          }
        } ],
        "responses" : {
          "default" : {
            "content" : {
              "application/json" : {
                "schema" : {
                  "type" : "array",
                  "items" : {
                    "type" : "string"
                  }
                }
              }
            }
          },
          "404" : {
            "description" : "Error: Cannot find style named 'unknownStyle'",
            "content" : {
              "application/json" : {
                "schema" : {
                  "type" : "array",
                  "items" : {
                    "$ref" : "#/components/schemas/KrakenError"
                  }
                }
              }
            }
          },
          "500" : {
            "description" : "Unknown error",
            "content" : {
              "application/json" : {
                "schema" : {
                  "type" : "array",
                  "items" : {
                    "$ref" : "#/components/schemas/KrakenError"
                  }
                }
              }
            }
          },
          "200" : {
            "description" : "OK",
            "content" : {
              "application/json" : {
                "schema" : {
                  "type" : "array",
                  "items" : {
                    "$ref" : "#/components/schemas/ContentResponse"
                  }
                }
              }
            }
          }
        }
      },
      "post" : {
        "tags" : [ "Image intent resource operations" ],
        "summary" : "API for retrieving the actual location of images matching certain CRID + imageType combinations",
        "operationId" : "getImageMetadataIntent_1",
        "requestBody" : {
          "content" : {
            "application/json" : {
              "schema" : {
                "type" : "array",
                "items" : {
                  "$ref" : "#/components/schemas/ContentRequest"
                }
              }
            }
          }
        },
        "responses" : {
          "default" : {
            "content" : {
              "application/json" : {
                "schema" : {
                  "type" : "array",
                  "items" : {
                    "type" : "string"
                  }
                }
              }
            }
          },
          "404" : {
            "description" : "Error: Cannot find style named 'unknownStyle'",
            "content" : {
              "application/json" : {
                "schema" : {
                  "type" : "array",
                  "items" : {
                    "$ref" : "#/components/schemas/KrakenError"
                  }
                }
              }
            }
          },
          "500" : {
            "description" : "Unknown error",
            "content" : {
              "application/json" : {
                "schema" : {
                  "type" : "array",
                  "items" : {
                    "$ref" : "#/components/schemas/KrakenError"
                  }
                }
              }
            }
          },
          "200" : {
            "description" : "OK",
            "content" : {
              "application/json" : {
                "schema" : {
                  "type" : "array",
                  "items" : {
                    "$ref" : "#/components/schemas/ContentResponse"
                  }
                }
              }
            }
          }
        }
      }
    },
    "/intent/{resourceId}/{imageType}" : {
      "get" : {
        "tags" : [ "Image intent resource operations" ],
        "summary" : "API for retrieving the actual location of the image matching the resource id + imageType",
        "operationId" : "getImageIntent",
        "parameters" : [ {
          "name" : "width",
          "in" : "query",
          "description" : "The width the picture should be resized to",
          "schema" : {
            "type" : "integer",
            "format" : "int32"
          }
        }, {
          "name" : "height",
          "in" : "query",
          "description" : "The height the picture should be resized to",
          "schema" : {
            "type" : "integer",
            "format" : "int32"
          }
        }, {
          "name" : "mode",
          "in" : "query",
          "description" : "One of the resize modes for returned image: crop, box, stretch, fill.nnNote: when resize mode is set to crop then both width and height must be given. nnNote2: when resize mode is set to stretch or box and either height or width is missing → the image is resized keeping the original aspect ratio.",
          "schema" : {
            "type" : "string",
            "enum" : [ "stretch", "box", "crop", "fill", "fill-NorthWest", "fill-North", "fill-NorthEast", "fill-West", "fill-Center", "fill-East", "fill-SouthWest", "fill-South", "fill-SouthEast" ]
          }
        }, {
          "name" : "blur",
          "in" : "query",
          "description" : "The blurring value for manipulating the picture",
          "schema" : {
            "type" : "number",
            "format" : "double"
          }
        }, {
          "name" : "brightness",
          "in" : "query",
          "description" : "The brightness value in percents for manipulating the picture. Negative numbers are for darkening the image, positive numbers for brightening the image. Min value -100, max value 100.",
          "schema" : {
            "type" : "integer",
            "format" : "int32"
          }
        }, {
          "name" : "format",
          "in" : "query",
          "description" : "The output image format (supported formats: jpg, jpeg, png, webp, jp2, jxr)",
          "schema" : {
            "type" : "string",
            "enum" : [ "jpg", "jpeg", "png", "webp", "jp2", "jxr" ]
          }
        }, {
          "name" : "style",
          "in" : "query",
          "description" : "The style used for manipulating the picture. Style values can be overriden by parameters in query.",
          "schema" : {
            "type" : "string"
          }
        }, {
          "name" : "channel",
          "in" : "query",
          "description" : "The grayscale image made of just one of primary colors (RED, GREEN, BLUE, OPACITY, GRAY)",
          "schema" : {
            "type" : "string",
            "enum" : [ "Red", "Green", "Blue", "Opacity", "Gray" ]
          }
        }, {
          "name" : "colorSpace",
          "in" : "query",
          "description" : "The color space type for a specific organization of colors (one of: CineonLog, CMYK, GRAY, HSL, HWB, OHTA, RGB, Rec601Luma, Rec709Luma, Rec601YCbCr, Rec709YCbCr, Transparent, XYZ, YCbCr, YIQ, YPbPr, YUV)",
          "schema" : {
            "type" : "string",
            "enum" : [ "CMY", "CMYK", "Gray", "HCL", "HCLp", "HSB", "HSI", "HSL", "HSV", "HWB", "Lab", "LCHab", "LCHuv", "LMS", "Log", "Luv", "OHTA", "Rec601YCbCr", "Rec709YCbCr", "RGB", "scRGB", "sRGB", "Transparent", "xyY", "XYZ", "YCbCr", "YCC", "YDbDr", "YIQ", "YPbPr", "YUV" ]
          }
        }, {
          "name" : "overlay",
          "in" : "query",
          "description" : "The overlay support (specification: https://wikiprojects.upc.biz/display/SPARK/Image-Service%2B-%2BOverlay%2Bsupport)",
          "style" : "form",
          "schema" : {
            "type" : "array",
            "items" : {
              "type" : "string"
            }
          }
        }, {
          "name" : "metadata",
          "in" : "query",
          "description" : "The flag specifying if image metadata (dominant colors) should added to headers",
          "schema" : {
            "type" : "boolean"
          }
        }, {
          "name" : "quality",
          "in" : "query",
          "description" : "The output image compression level. Min value 1, max value 100. If quality argument is not provided the default compression level is 89.",
          "schema" : {
            "type" : "number",
            "format" : "double"
          }
        }, {
          "name" : "stylePlaceholders",
          "in" : "query",
          "description" : "Styles can have dynamic content which is replaced by value from properties in stylePlaceholders. More details: https://wikiprojects.upc.biz/display/SPARK/Image-Service%2B-%2BDynamic%2Bstyle%2Bplaceholders",
          "schema" : {
            "type" : "string"
          }
        }, {
          "name" : "cornerRadius",
          "in" : "query",
          "description" : "The radius of rounded corners of an image ('max' equals an ellipse)",
          "schema" : {
            "type" : "string"
          }
        }, {
          "name" : "resourceId",
          "in" : "path",
          "description" : "Resource id",
          "required" : true,
          "schema" : {
            "type" : "string"
          }
        }, {
          "name" : "type",
          "in" : "query",
          "description" : "The type the resource id represents",
          "schema" : {
            "type" : "string",
            "enum" : [ "CHANNEL", "PROVIDER" ]
          }
        }, {
          "name" : "imageType",
          "in" : "path",
          "description" : "The requested imageType",
          "required" : true,
          "schema" : {
            "type" : "string"
          }
        }, {
          "name" : "If-None-Match",
          "in" : "header",
          "description" : "If-None-Match",
          "schema" : {
            "type" : "string"
          }
        } ],
        "responses" : {
          "default" : {
            "content" : {
              "text/plain; charset=utf-8" : {
                "schema" : {
                  "type" : "array",
                  "items" : {
                    "type" : "string"
                  }
                }
              }
            }
          },
          "204" : {
            "description" : "The resource id 'resourceId' does not have an image asset mappable on image type 'imageType'"
          },
          "304" : {
            "description" : "Image was not modified.",
            "content" : {
              "text/plain; charset=utf-8" : {
                "schema" : {
                  "type" : "array",
                  "items" : {
                    "type" : "string"
                  }
                }
              }
            }
          },
          "400" : {
            "description" : "Error: content request is null.",
            "content" : {
              "text/plain; charset=utf-8" : {
                "schema" : {
                  "type" : "array",
                  "items" : {
                    "$ref" : "#/components/schemas/KrakenError"
                  }
                }
              }
            }
          },
          "404" : {
            "description" : "Error: The resource id 'resourceId' does not exist",
            "content" : {
              "text/plain; charset=utf-8" : {
                "schema" : {
                  "type" : "array",
                  "items" : {
                    "$ref" : "#/components/schemas/KrakenError"
                  }
                }
              }
            }
          },
          "500" : {
            "description" : "Unknown error",
            "content" : {
              "text/plain; charset=utf-8" : {
                "schema" : {
                  "type" : "array",
                  "items" : {
                    "$ref" : "#/components/schemas/KrakenError"
                  }
                }
              }
            }
          },
          "502" : {
            "description" : "Error: The found asset for resource id 'resourceId' and image Type 'imageType' contains no (valid) url",
            "content" : {
              "text/plain; charset=utf-8" : {
                "schema" : {
                  "type" : "array",
                  "items" : {
                    "type" : "string"
                  }
                }
              }
            }
          }
        }
      }
    },
    "/{resourceLocation}" : {
      "delete" : {
        "tags" : [ "Image cleanup operations" ],
        "summary" : "API for deleting images",
        "operationId" : "deleteImage",
        "parameters" : [ {
          "name" : "resourceLocation",
          "in" : "path",
          "description" : "The image resource location",
          "required" : true,
          "schema" : {
            "type" : "string"
          }
        } ],
        "responses" : {
          "200" : {
            "description" : "Ok",
            "content" : {
              "*/*" : {
                "schema" : {
                  "type" : "array",
                  "items" : {
                    "type" : "string"
                  }
                }
              }
            }
          },
          "400" : {
            "description" : "Parameters were missing or incorrect",
            "content" : {
              "*/*" : {
                "schema" : {
                  "type" : "array",
                  "items" : {
                    "$ref" : "#/components/schemas/KrakenError"
                  }
                }
              }
            }
          },
          "401" : {
            "description" : "Invalid credentials",
            "content" : {
              "*/*" : {
                "schema" : {
                  "type" : "array",
                  "items" : {
                    "type" : "string"
                  }
                }
              }
            }
          },
          "404" : {
            "description" : "Image not found",
            "content" : {
              "*/*" : {
                "schema" : {
                  "type" : "array",
                  "items" : {
                    "$ref" : "#/components/schemas/KrakenError"
                  }
                }
              }
            }
          },
          "500" : {
            "description" : "Unknown error",
            "content" : {
              "*/*" : {
                "schema" : {
                  "type" : "array",
                  "items" : {
                    "$ref" : "#/components/schemas/KrakenError"
                  }
                }
              }
            }
          }
        },
        "security" : [ {
          "basicAuth" : [ ]
        } ]
      }
    },
    "/{folder}" : {
      "post" : {
        "tags" : [ "Image resource operations" ],
        "summary" : "API for uploading images",
        "operationId" : "uploadImages",
        "parameters" : [ {
          "name" : "folder",
          "in" : "path",
          "description" : "The folder the files (located in the body) should be stored",
          "required" : true,
          "schema" : {
            "type" : "string"
          }
        } ],
        "requestBody" : {
          "content" : {
            "multipart/form-data" : {
              "schema" : {
                "$ref" : "#/components/schemas/MultiRequest"
              }
            }
          }
        },
        "responses" : {
          "200" : {
            "description" : "Ok",
            "content" : {
              "text/plain; charset=utf-8" : {
                "schema" : {
                  "type" : "array",
                  "items" : {
                    "type" : "string"
                  }
                }
              }
            }
          },
          "400" : {
            "description" : "Error: Unable to process the uploaded files. No multipart 'files' content detectednnError: The file '%s' is not a valid '%s' image - The file has a wrong start/end signature",
            "content" : {
              "text/plain; charset=utf-8" : {
                "schema" : {
                  "type" : "array",
                  "items" : {
                    "$ref" : "#/components/schemas/KrakenError"
                  }
                }
              }
            }
          },
          "401" : {
            "description" : "Error: Credentials are required to access this resource.",
            "content" : {
              "text/plain; charset=utf-8" : {
                "schema" : {
                  "type" : "array",
                  "items" : {
                    "type" : "string"
                  }
                }
              }
            }
          },
          "413" : {
            "description" : "Error: Unable to upload all images. Content length exceeds %s bytes",
            "content" : {
              "text/plain; charset=utf-8" : {
                "schema" : {
                  "type" : "array",
                  "items" : {
                    "$ref" : "#/components/schemas/KrakenError"
                  }
                }
              }
            }
          },
          "415" : {
            "description" : "Error: Unsupported Image file encoding upload. No mapping content type for '%s' extension found (file '%s')",
            "content" : {
              "text/plain; charset=utf-8" : {
                "schema" : {
                  "type" : "array",
                  "items" : {
                    "$ref" : "#/components/schemas/KrakenError"
                  }
                }
              }
            }
          },
          "500" : {
            "description" : "Unknown error",
            "content" : {
              "text/plain; charset=utf-8" : {
                "schema" : {
                  "$ref" : "#/components/schemas/KrakenError"
                }
              }
            }
          }
        },
        "security" : [ {
          "basicAuth" : [ ]
        } ]
      }
    },
    "/{path}" : {
      "get" : {
        "tags" : [ "Image resource operations" ],
        "summary" : "API for requesting images with filters and mutation capabil",
        "operationId" : "getImage",
        "parameters" : [ {
          "name" : "path",
          "in" : "path",
          "description" : "The image resource location",
          "required" : true,
          "schema" : {
            "type" : "string"
          }
        }, {
          "name" : "If-None-Match",
          "in" : "header",
          "description" : "E-tag values for standard 'IF-NONE-MATCH' header behavior",
          "schema" : {
            "type" : "string"
          }
        }, {
          "name" : "w",
          "in" : "query",
          "description" : "The width the picture should be resized to",
          "schema" : {
            "type" : "integer",
            "format" : "int32"
          }
        }, {
          "name" : "h",
          "in" : "query",
          "description" : "The height the picture should be resized to",
          "schema" : {
            "type" : "integer",
            "format" : "int32"
          }
        }, {
          "name" : "mode",
          "in" : "query",
          "description" : "One of the resize modes for returned image: crop, box, stretch, fill.nnNote: when resize mode is set to crop then both width and height must be given. nnNote2: when resize mode is set to stretch or box and either height or width is missing → the image is resized keeping the original aspect ratio.",
          "schema" : {
            "type" : "string",
            "enum" : [ "stretch", "box", "crop", "fill", "fill-NorthWest", "fill-North", "fill-NorthEast", "fill-West", "fill-Center", "fill-East", "fill-SouthWest", "fill-South", "fill-SouthEast" ]
          }
        }, {
          "name" : "blur",
          "in" : "query",
          "description" : "The blurring value for manipulating the picture",
          "schema" : {
            "type" : "number",
            "format" : "double"
          }
        }, {
          "name" : "brightness",
          "in" : "query",
          "description" : "The brightness value in percents for manipulating the picture. Negative numbers are for darkening the image, positive numbers for brightening the image. Min value -100, max value 100.",
          "schema" : {
            "type" : "integer",
            "format" : "int32"
          }
        }, {
          "name" : "format",
          "in" : "query",
          "description" : "The output image format (supported formats: jpg, jpeg, png, webp, jp2, jxr)",
          "schema" : {
            "type" : "string",
            "enum" : [ "jpg", "jpeg", "png", "webp", "jp2", "jxr" ]
          }
        }, {
          "name" : "style",
          "in" : "query",
          "description" : "The style used for manipulating the picture. Style values can be overriden by parameters in query.",
          "schema" : {
            "type" : "string"
          }
        }, {
          "name" : "channel",
          "in" : "query",
          "description" : "The grayscale image made of just one of primary colors (RED, GREEN, BLUE, OPACITY, GRAY)",
          "schema" : {
            "type" : "string",
            "enum" : [ "Red", "Green", "Blue", "Opacity", "Gray" ]
          }
        }, {
          "name" : "colorspace",
          "in" : "query",
          "description" : "The color space type for a specific organization of colors (one of: CineonLog, CMYK, GRAY, HSL, HWB, OHTA, RGB, Rec601Luma, Rec709Luma, Rec601YCbCr, Rec709YCbCr, Transparent, XYZ, YCbCr, YIQ, YPbPr, YUV)",
          "schema" : {
            "type" : "string",
            "enum" : [ "CMY", "CMYK", "Gray", "HCL", "HCLp", "HSB", "HSI", "HSL", "HSV", "HWB", "Lab", "LCHab", "LCHuv", "LMS", "Log", "Luv", "OHTA", "Rec601YCbCr", "Rec709YCbCr", "RGB", "scRGB", "sRGB", "Transparent", "xyY", "XYZ", "YCbCr", "YCC", "YDbDr", "YIQ", "YPbPr", "YUV" ]
          }
        }, {
          "name" : "overlay",
          "in" : "query",
          "description" : "The overlay support (specification: https://wikiprojects.upc.biz/display/SPARK/Image-Service%2B-%2BOverlay%2Bsupport)",
          "schema" : {
            "type" : "array",
            "items" : {
              "type" : "string"
            }
          }
        }, {
          "name" : "metadata",
          "in" : "query",
          "description" : "The flag specifying if image metadata (dominant colors) should added to headers",
          "schema" : {
            "type" : "boolean"
          }
        }, {
          "name" : "quality",
          "in" : "query",
          "description" : "The output image compression level. Min value 1, max value 100. If quality argument is not provided the default compression level is 89.",
          "schema" : {
            "type" : "number",
            "format" : "double"
          }
        }, {
          "name" : "stylePlaceholders",
          "in" : "query",
          "description" : "Styles can have dynamic content which is replaced by value from properties in stylePlaceholders. More details: https://wikiprojects.upc.biz/display/SPARK/Image-Service%2B-%2BDynamic%2Bstyle%2Bplaceholders",
          "schema" : {
            "type" : "string"
          }
        }, {
          "name" : "cornerRadius",
          "in" : "query",
          "description" : "The radius of rounded corners of an image ('max' equals an ellipse)",
          "schema" : {
            "type" : "string"
          }
        }, {
          "name" : "trim",
          "in" : "query",
          "description" : "The flag specifying if image should be trimmed",
          "schema" : {
            "type" : "boolean"
          }
        }, {
          "name" : "wedgeWidth",
          "in" : "query",
          "description" : "The minimum width used for Wedge shape resize",
          "schema" : {
            "type" : "integer",
            "format" : "int32"
          }
        }, {
          "name" : "wedgeHeight",
          "in" : "query",
          "description" : "The minimum height used for wedge shape resize",
          "schema" : {
            "type" : "integer",
            "format" : "int32"
          }
        } ],
        "responses" : {
          "default" : {
            "content" : {
              "image/jpeg" : {
                "schema" : {
                  "type" : "array",
                  "items" : {
                    "type" : "string"
                  }
                }
              },
              "image/png" : {
                "schema" : {
                  "type" : "array",
                  "items" : {
                    "type" : "string"
                  }
                }
              },
              "image/webp" : {
                "schema" : {
                  "type" : "array",
                  "items" : {
                    "type" : "string"
                  }
                }
              },
              "image/jp2" : {
                "schema" : {
                  "type" : "array",
                  "items" : {
                    "type" : "string"
                  }
                }
              },
              "image/jxr" : {
                "schema" : {
                  "type" : "array",
                  "items" : {
                    "type" : "string"
                  }
                }
              }
            }
          },
          "200" : {
            "description" : "OK",
            "content" : {
              "image/jpeg" : {
                "schema" : {
                  "type" : "array",
                  "items" : {
                    "type" : "string"
                  }
                }
              },
              "image/png" : {
                "schema" : {
                  "type" : "array",
                  "items" : {
                    "type" : "string"
                  }
                }
              },
              "image/webp" : {
                "schema" : {
                  "type" : "array",
                  "items" : {
                    "type" : "string"
                  }
                }
              },
              "image/jp2" : {
                "schema" : {
                  "type" : "array",
                  "items" : {
                    "type" : "string"
                  }
                }
              },
              "image/jxr" : {
                "schema" : {
                  "type" : "array",
                  "items" : {
                    "type" : "string"
                  }
                }
              }
            }
          },
          "304" : {
            "description" : "Image was not modified.",
            "content" : {
              "image/jpeg" : {
                "schema" : {
                  "type" : "array",
                  "items" : {
                    "$ref" : "#/components/schemas/KrakenError"
                  }
                }
              },
              "image/png" : {
                "schema" : {
                  "type" : "array",
                  "items" : {
                    "$ref" : "#/components/schemas/KrakenError"
                  }
                }
              },
              "image/webp" : {
                "schema" : {
                  "type" : "array",
                  "items" : {
                    "$ref" : "#/components/schemas/KrakenError"
                  }
                }
              },
              "image/jp2" : {
                "schema" : {
                  "type" : "array",
                  "items" : {
                    "$ref" : "#/components/schemas/KrakenError"
                  }
                }
              },
              "image/jxr" : {
                "schema" : {
                  "type" : "array",
                  "items" : {
                    "$ref" : "#/components/schemas/KrakenError"
                  }
                }
              }
            }
          },
          "404" : {
            "description" : "Error: Cannot find image '%s'nnError: Cannot find style named 'unknownStyle'",
            "content" : {
              "image/jpeg" : {
                "schema" : {
                  "type" : "array",
                  "items" : {
                    "type" : "string"
                  }
                }
              },
              "image/png" : {
                "schema" : {
                  "type" : "array",
                  "items" : {
                    "type" : "string"
                  }
                }
              },
              "image/webp" : {
                "schema" : {
                  "type" : "array",
                  "items" : {
                    "type" : "string"
                  }
                }
              },
              "image/jp2" : {
                "schema" : {
                  "type" : "array",
                  "items" : {
                    "type" : "string"
                  }
                }
              },
              "image/jxr" : {
                "schema" : {
                  "type" : "array",
                  "items" : {
                    "type" : "string"
                  }
                }
              }
            }
          },
          "500" : {
            "description" : "Unknown error",
            "content" : {
              "image/jpeg" : {
                "schema" : {
                  "type" : "array",
                  "items" : {
                    "$ref" : "#/components/schemas/KrakenError"
                  }
                }
              },
              "image/png" : {
                "schema" : {
                  "type" : "array",
                  "items" : {
                    "$ref" : "#/components/schemas/KrakenError"
                  }
                }
              },
              "image/webp" : {
                "schema" : {
                  "type" : "array",
                  "items" : {
                    "$ref" : "#/components/schemas/KrakenError"
                  }
                }
              },
              "image/jp2" : {
                "schema" : {
                  "type" : "array",
                  "items" : {
                    "$ref" : "#/components/schemas/KrakenError"
                  }
                }
              },
              "image/jxr" : {
                "schema" : {
                  "type" : "array",
                  "items" : {
                    "$ref" : "#/components/schemas/KrakenError"
                  }
                }
              }
            }
          },
          "400" : {
            "description" : "Error: Parameters were missing or incorrect nnError: Width should be higher than or equal to zero but was '%d' nnError: Width should be lower than or equal to '%d' but was '%d'nnError: Height should be higher than or equal to zero but was '%d'nnError: Height should be lower than or equal to '%d' but was '%d'nnError: Resize mode requires both width and height setnnError: Blurring factor should be higher than or equal to '%d' but was '%d'nnError: Blurring factor should be lower than or equal to '%d' but was '%d'nnError: Query param format must be one of [jpg, jpeg, png, webp, jp2, jxr]nnError: Brightness factor should be higher than or equal to '%d' but was '%d'nnError: Brightness factor should be lower than or equal to '%d' but was '%d'nnError: Query param channel must be one of [Red, Green, Blue, Opacity, Gray]nnError: Query param colorspace must be one of [CineonLog, CMYK, GRAY, HSL, HWB, OHTA, RGB, Rec601Luma, Rec709Luma, Rec601YCbCr, Rec709YCbCr, Transparent, XYZ, YCbCr, YIQ, YPbPr, YUV]nnError: Image quality percentage should be lower than or equal to '%d' but was '%d'nnError: Image quality percentage should be higher than or equal to '%d' but was '%d'nnError: CornerRadius requires width and height set and resizeMode crop or stretch. nnError: Rounded corners should have an integer value, or 'max'nnError: Rounded corners should be lower than or equal to '%d' but was '%d'",
            "content" : {
              "image/jpeg" : {
                "schema" : {
                  "type" : "array",
                  "items" : {
                    "$ref" : "#/components/schemas/KrakenError"
                  }
                }
              },
              "image/png" : {
                "schema" : {
                  "type" : "array",
                  "items" : {
                    "$ref" : "#/components/schemas/KrakenError"
                  }
                }
              },
              "image/webp" : {
                "schema" : {
                  "type" : "array",
                  "items" : {
                    "$ref" : "#/components/schemas/KrakenError"
                  }
                }
              },
              "image/jp2" : {
                "schema" : {
                  "type" : "array",
                  "items" : {
                    "$ref" : "#/components/schemas/KrakenError"
                  }
                }
              },
              "image/jxr" : {
                "schema" : {
                  "type" : "array",
                  "items" : {
                    "$ref" : "#/components/schemas/KrakenError"
                  }
                }
              }
            }
          }
        }
      }
    },
    "/metadata/{path}" : {
      "get" : {
        "tags" : [ "Image resource operations" ],
        "summary" : "Returns json with dominant colours from the image after optional processing given as query parameters.",
        "operationId" : "getDominantColorCodes",
        "parameters" : [ {
          "name" : "path",
          "in" : "path",
          "description" : "The image resource location",
          "required" : true,
          "schema" : {
            "type" : "string"
          }
        }, {
          "name" : "If-None-Match",
          "in" : "header",
          "description" : "E-tag values for standard 'IF-NONE-MATCH' header behavior",
          "schema" : {
            "type" : "string"
          }
        }, {
          "name" : "w",
          "in" : "query",
          "description" : "The width the picture should be resized to",
          "schema" : {
            "type" : "integer",
            "format" : "int32"
          }
        }, {
          "name" : "h",
          "in" : "query",
          "description" : "The height the picture should be resized to",
          "schema" : {
            "type" : "integer",
            "format" : "int32"
          }
        }, {
          "name" : "mode",
          "in" : "query",
          "description" : "One of the resize modes for returned image: crop, box, stretch, fill.nnNote: when resize mode is set to crop then both width and height must be given nnNote2: when resize mode is set to stretch or box and either height or width is missng → the image is resized keeping the original aspect ratio.",
          "schema" : {
            "type" : "string",
            "enum" : [ "stretch", "box", "crop", "fill", "fill-NorthWest", "fill-North", "fill-NorthEast", "fill-West", "fill-Center", "fill-East", "fill-SouthWest", "fill-South", "fill-SouthEast" ]
          }
        }, {
          "name" : "blur",
          "in" : "query",
          "description" : "The blurring value for manipulating the picture",
          "schema" : {
            "type" : "number",
            "format" : "double"
          }
        }, {
          "name" : "brightness",
          "in" : "query",
          "description" : "The brightness value in percents for manipulating the picture. Negative numbers are for darkening the image, positive numbers for brightnening the image. Min value -100, max value 100.",
          "schema" : {
            "type" : "integer",
            "format" : "int32"
          }
        }, {
          "name" : "format",
          "in" : "query",
          "description" : "The output image format (supported formats: jpg, jpeg, png, webp, jp2, jxr)",
          "schema" : {
            "type" : "string",
            "enum" : [ "jpg", "jpeg", "png", "webp", "jp2", "jxr" ]
          }
        }, {
          "name" : "style",
          "in" : "query",
          "description" : "The style used for manipulating the picture",
          "schema" : {
            "type" : "string"
          }
        }, {
          "name" : "channel",
          "in" : "query",
          "description" : "The grayscale image made of just one of primary colors (RED, GREEN, BLUE, OPACITY, GRAY)",
          "schema" : {
            "type" : "string",
            "enum" : [ "Red", "Green", "Blue", "Opacity", "Gray" ]
          }
        }, {
          "name" : "colorspace",
          "in" : "query",
          "description" : "The color space type for specific organization of colors (one of: CineonLog, CMYK, GRAY, HSL, HWB, OHTA, RGB, Rec601Luma, Rec709Luma, Rec601YCbCr, Rec709YCbCr, Transparent, XYZ, YCbCr, YIQ, YPbPr, YUV)",
          "schema" : {
            "type" : "string",
            "enum" : [ "CMY", "CMYK", "Gray", "HCL", "HCLp", "HSB", "HSI", "HSL", "HSV", "HWB", "Lab", "LCHab", "LCHuv", "LMS", "Log", "Luv", "OHTA", "Rec601YCbCr", "Rec709YCbCr", "RGB", "scRGB", "sRGB", "Transparent", "xyY", "XYZ", "YCbCr", "YCC", "YDbDr", "YIQ", "YPbPr", "YUV" ]
          }
        }, {
          "name" : "quality",
          "in" : "query",
          "description" : "The image compression level. Min value 1, max value 100. If quality argument is not provided the default compression level is 89.",
          "schema" : {
            "type" : "number",
            "format" : "double"
          }
        }, {
          "name" : "cornerRadius",
          "in" : "query",
          "description" : "The radius of rounded corners of an image ('max' equals an ellipse)",
          "schema" : {
            "type" : "string"
          }
        }, {
          "name" : "trim",
          "in" : "query",
          "description" : "The flag specifying if image should be trimmed",
          "schema" : {
            "type" : "boolean"
          }
        }, {
          "name" : "wedgeWidth",
          "in" : "query",
          "description" : "The minimum width used for Wedge shape resize",
          "schema" : {
            "type" : "integer",
            "format" : "int32"
          }
        }, {
          "name" : "wedgeHeight",
          "in" : "query",
          "description" : "The minimum height used for wedge shape resize",
          "schema" : {
            "type" : "integer",
            "format" : "int32"
          }
        } ],
        "responses" : {
          "default" : {
            "content" : {
              "application/json" : {
                "schema" : {
                  "type" : "array",
                  "items" : {
                    "type" : "string"
                  }
                }
              }
            }
          },
          "200" : {
            "description" : "OK",
            "content" : {
              "application/json" : {
                "schema" : {
                  "$ref" : "#/components/schemas/DominantColorPaletteOutput"
                }
              }
            }
          },
          "304" : {
            "description" : "Image was not modified.",
            "content" : {
              "application/json" : {
                "schema" : {
                  "type" : "array",
                  "items" : {
                    "type" : "string"
                  }
                }
              }
            }
          },
          "404" : {
            "description" : "Error: Cannot find image '%s'nnError: Cannot find style named 'unknownStyle'",
            "content" : {
              "application/json" : {
                "schema" : {
                  "type" : "array",
                  "items" : {
                    "$ref" : "#/components/schemas/KrakenError"
                  }
                }
              }
            }
          },
          "500" : {
            "description" : "Unknown error",
            "content" : {
              "application/json" : {
                "schema" : {
                  "type" : "array",
                  "items" : {
                    "$ref" : "#/components/schemas/KrakenError"
                  }
                }
              }
            }
          },
          "400" : {
            "description" : "Parameters were missing or incorrect.Error: Width should be higher than or equal to zero but was '%d' Error: Width should be lower than or equal to '%d' but was '%d'Error: Height should be higher than or equal to zero but was '%d'Error: Height should be lower than or equal to '%d' but was '%d'nnError: Resize mode equires both width and height setnnError: Blurring factor should be higher than or equal to '%d' but was '%d'nnError: Blurring factor should be lower than or equal to '%d' but was '%d'nnError: Query param format must be one of [jpg, jpeg, png, webp, jp2, jxr]nnError: Brightness factor should be higher than or equal to '%d' but was '%d'nnError: Brightness factor should be lower than or equal to '%d' but was '%d'nnError: query param channel must be one of [Red, Green, Blue, Opacity, Gray]nnError: Query param colorspace must be one of [CineonLog, CMYK, GRAY, HSL, HWB, OHTA, RGB, Rec601Luma, Rec709Luma, Rec601YCbCr, Rec709YCbCr, Transparent, XYZ, YCbCr, YIQ, YPbPr, YUV]nnError: Image quality percentage should be lower than or equal to '%d' but was '%d'nnError: Image quality percentage should be higher than or equal to '%d' but was '%d'nnError: CornerRadius requires width and height set and resizeMode crop or stretch. nnError: Rounded corners should have an integer value, or 'max'nnError: Rounded corners should be lower than or equal to '%d' but was '%d'",
            "content" : {
              "application/json" : {
                "schema" : {
                  "type" : "array",
                  "items" : {
                    "$ref" : "#/components/schemas/KrakenError"
                  }
                }
              }
            }
          }
        }
      }
    }
  },
  "components" : {
    "schemas" : {
      "KrakenError" : {
        "required" : [ "httpStatusCode", "message" ],
        "type" : "object",
        "properties" : {
          "httpStatusCode" : {
            "type" : "integer",
            "format" : "int32"
          },
          "statusCode" : {
            "type" : "integer",
            "format" : "int32"
          },
          "message" : {
            "type" : "string"
          },
          "details" : {
            "type" : "string"
          },
          "allErrors" : {
            "type" : "array",
            "items" : {
              "type" : "string"
            }
          },
          "correlationId" : {
            "type" : "string"
          }
        }
      },
      "ContentResponse" : {
        "type" : "object",
        "properties" : {
          "intents" : {
            "type" : "array",
            "items" : {
              "$ref" : "#/components/schemas/IntentResultResponse"
            }
          },
          "id" : {
            "type" : "string"
          }
        }
      },
      "IntentResultResponse" : {
        "type" : "object",
        "properties" : {
          "intent" : {
            "type" : "string"
          },
          "url" : {
            "type" : "string"
          },
          "imageAge" : {
            "type" : "object",
            "properties" : {
              "seconds" : {
                "type" : "integer",
                "format" : "int64"
              },
              "nano" : {
                "type" : "integer",
                "format" : "int32"
              },
              "negative" : {
                "type" : "boolean"
              },
              "zero" : {
                "type" : "boolean"
              },
              "units" : {
                "type" : "array",
                "items" : {
                  "type" : "object",
                  "properties" : {
                    "durationEstimated" : {
                      "type" : "boolean"
                    },
                    "dateBased" : {
                      "type" : "boolean"
                    },
                    "timeBased" : {
                      "type" : "boolean"
                    }
                  }
                }
              }
            }
          }
        }
      },
      "ContentRequest" : {
        "required" : [ "id", "intents" ],
        "type" : "object",
        "properties" : {
          "id" : {
            "type" : "string"
          },
          "type" : {
            "type" : "string",
            "enum" : [ "CHANNEL", "PROVIDER" ]
          },
          "intents" : {
            "type" : "array",
            "items" : {
              "type" : "string"
            }
          },
          "allowMultipleImages" : {
            "type" : "boolean"
          }
        }
      },
      "MultiRequest" : {
        "required" : [ "files" ],
        "type" : "object",
        "properties" : {
          "files" : {
            "type" : "string",
            "description" : "image file",
            "format" : "binary"
          }
        }
      },
      "DominantColorPaletteOutput" : {
        "type" : "object",
        "properties" : {
          "dominantColorCodes" : {
            "type" : "array",
            "items" : {
              "type" : "string"
            }
          }
        }
      }
    }
  }
}
''';

const ref = '\$ref';
