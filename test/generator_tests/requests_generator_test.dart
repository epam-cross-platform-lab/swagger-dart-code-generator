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
import 'package:swagger_dart_code_generator/src/code_generators/v2/swagger_models_generator_v2.dart';
import 'package:swagger_dart_code_generator/src/models/generator_options.dart';

void main() {
  // final generator = SwaggerRequestsGenerator();
  // final res = generator.generate(
  //     code: aaa,
  //     className: 'ExampleSwagger',
  //     fileName: 'example_swagger',
  //     options: GeneratorOptions(
  //       inputFolder: '',
  //       outputFolder: '',
  //       modelPostfix: 'Dto',
  //     ));
  final generator = SwaggerModelsGeneratorV2();
  final res = generator.generate(aaa, 'aa_aa', GeneratorOptions(modelPostfix: 'Dto', inputFolder: '', outputFolder: ''));

  final ttt = 0;
}

const aaa = '''
{
    "swagger": "2.0",
    "info": {
        "description": "Bff for getting delivery slots",
        "version": "v1 [gitID: 2206523] [gitTag: 1.39.0-SNAPSHOT-29]",
        "title": "Appie-Slot-Bff",
        "termsOfService": "urn:tos",
        "contact": {},
        "license": {
            "name": "Apache 2.0",
            "url": "http://www.apache.org/licenses/LICENSE-2.0"
        }
    },
    "host": "appie-slot-bff.ah-tst.k8s.digitaldev.nl",
    "basePath": "/",
    "tags": [
        {
            "name": "basic-error-controller",
            "description": "Basic Error Controller"
        },
        {
            "name": "slot-controller",
            "description": "Slot Controller"
        }
    ],
    "paths": {
        "/error": {
            "get": {
                "tags": [
                    "basic-error-controller"
                ],
                "summary": "errorHtml",
                "operationId": "errorHtmlUsingGET",
                "produces": [
                    "text/html"
                ],
                "responses": {
                    "200": {
                        "description": "OK",
                        "schema": {
                            "originalRef": "ModelAndView",
                            "$ref": "#/definitions/ModelAndView"
                        }
                    },
                    "401": {
                        "description": "Unauthorized"
                    },
                    "403": {
                        "description": "Forbidden"
                    },
                    "404": {
                        "description": "Not Found"
                    }
                },
                "security": [
                    {
                        "apiKey": []
                    }
                ],
                "deprecated": false
            },
            "head": {
                "tags": [
                    "basic-error-controller"
                ],
                "summary": "errorHtml",
                "operationId": "errorHtmlUsingHEAD",
                "consumes": [
                    "application/json"
                ],
                "produces": [
                    "text/html"
                ],
                "responses": {
                    "200": {
                        "description": "OK",
                        "schema": {
                            "originalRef": "ModelAndView",
                            "$ref": "#/definitions/ModelAndView"
                        }
                    },
                    "204": {
                        "description": "No Content"
                    },
                    "401": {
                        "description": "Unauthorized"
                    },
                    "403": {
                        "description": "Forbidden"
                    }
                },
                "security": [
                    {
                        "apiKey": []
                    }
                ],
                "deprecated": false
            },
            "post": {
                "tags": [
                    "basic-error-controller"
                ],
                "summary": "errorHtml",
                "operationId": "errorHtmlUsingPOST",
                "consumes": [
                    "application/json"
                ],
                "produces": [
                    "text/html"
                ],
                "responses": {
                    "200": {
                        "description": "OK",
                        "schema": {
                            "originalRef": "ModelAndView",
                            "$ref": "#/definitions/ModelAndView"
                        }
                    },
                    "201": {
                        "description": "Created"
                    },
                    "401": {
                        "description": "Unauthorized"
                    },
                    "403": {
                        "description": "Forbidden"
                    },
                    "404": {
                        "description": "Not Found"
                    }
                },
                "security": [
                    {
                        "apiKey": []
                    }
                ],
                "deprecated": false
            },
            "put": {
                "tags": [
                    "basic-error-controller"
                ],
                "summary": "errorHtml",
                "operationId": "errorHtmlUsingPUT",
                "consumes": [
                    "application/json"
                ],
                "produces": [
                    "text/html"
                ],
                "responses": {
                    "200": {
                        "description": "OK",
                        "schema": {
                            "originalRef": "ModelAndView",
                            "$ref": "#/definitions/ModelAndView"
                        }
                    },
                    "201": {
                        "description": "Created"
                    },
                    "401": {
                        "description": "Unauthorized"
                    },
                    "403": {
                        "description": "Forbidden"
                    },
                    "404": {
                        "description": "Not Found"
                    }
                },
                "security": [
                    {
                        "apiKey": []
                    }
                ],
                "deprecated": false
            },
            "delete": {
                "tags": [
                    "basic-error-controller"
                ],
                "summary": "errorHtml",
                "operationId": "errorHtmlUsingDELETE",
                "produces": [
                    "text/html"
                ],
                "responses": {
                    "200": {
                        "description": "OK",
                        "schema": {
                            "originalRef": "ModelAndView",
                            "$ref": "#/definitions/ModelAndView"
                        }
                    },
                    "204": {
                        "description": "No Content"
                    },
                    "401": {
                        "description": "Unauthorized"
                    },
                    "403": {
                        "description": "Forbidden"
                    }
                },
                "security": [
                    {
                        "apiKey": []
                    }
                ],
                "deprecated": false
            },
            "options": {
                "tags": [
                    "basic-error-controller"
                ],
                "summary": "errorHtml",
                "operationId": "errorHtmlUsingOPTIONS",
                "consumes": [
                    "application/json"
                ],
                "produces": [
                    "text/html"
                ],
                "responses": {
                    "200": {
                        "description": "OK",
                        "schema": {
                            "originalRef": "ModelAndView",
                            "$ref": "#/definitions/ModelAndView"
                        }
                    },
                    "204": {
                        "description": "No Content"
                    },
                    "401": {
                        "description": "Unauthorized"
                    },
                    "403": {
                        "description": "Forbidden"
                    }
                },
                "security": [
                    {
                        "apiKey": []
                    }
                ],
                "deprecated": false
            },
            "patch": {
                "tags": [
                    "basic-error-controller"
                ],
                "summary": "errorHtml",
                "operationId": "errorHtmlUsingPATCH",
                "consumes": [
                    "application/json"
                ],
                "produces": [
                    "text/html"
                ],
                "responses": {
                    "200": {
                        "description": "OK",
                        "schema": {
                            "originalRef": "ModelAndView",
                            "$ref": "#/definitions/ModelAndView"
                        }
                    },
                    "204": {
                        "description": "No Content"
                    },
                    "401": {
                        "description": "Unauthorized"
                    },
                    "403": {
                        "description": "Forbidden"
                    }
                },
                "security": [
                    {
                        "apiKey": []
                    }
                ],
                "deprecated": false
            }
        },
        "/v1/slots": {
            "get": {
                "tags": [
                    "slot-controller"
                ],
                "summary": "Get the delivery slots for a given Pick Up Point or postal code of the user",
                "operationId": "getSlotsUsingGET",
                "produces": [
                    "application/json"
                ],
                "parameters": [
                    {
                        "name": "city",
                        "in": "query",
                        "description": "City",
                        "required": false,
                        "type": "string",
                        "allowEmptyValue": false
                    },
                    {
                        "name": "houseNumber",
                        "in": "query",
                        "description": "House number",
                        "required": false,
                        "type": "string",
                        "allowEmptyValue": false
                    },
                    {
                        "name": "postalCode",
                        "in": "query",
                        "description": "Postal code (trailing alphabetic part is discarded)",
                        "required": false,
                        "type": "string",
                        "allowEmptyValue": false
                    },
                    {
                        "name": "productIds",
                        "in": "query",
                        "description": "IDs of the ordered products. If not supplied, product lead times are not considered.",
                        "required": false,
                        "type": "array",
                        "items": {
                            "type": "integer",
                            "format": "int64"
                        },
                        "collectionFormat": "multi",
                        "allowEmptyValue": false
                    },
                    {
                        "name": "pupId",
                        "in": "query",
                        "description": "ID of the Pick Up Point. When not provided, the users postal code is used to search for available slots",
                        "required": false,
                        "type": "integer",
                        "format": "int64",
                        "allowEmptyValue": false
                    },
                    {
                        "name": "street",
                        "in": "query",
                        "description": "Street",
                        "required": false,
                        "type": "string",
                        "allowEmptyValue": false
                    },
                    {
                        "name": "x-application",
                        "in": "header",
                        "description": "x-application",
                        "required": true,
                        "type": "string"
                    }
                ],
                "responses": {
                    "200": {
                        "description": "Success",
                        "schema": {
                            "type": "array",
                            "items": {
                                "originalRef": "SlotDay",
                                "$ref": "#/definitions/SlotDay"
                            }
                        }
                    },
                    "400": {
                        "description": "Bad request"
                    },
                    "401": {
                        "description": "Unauthorized"
                    },
                    "403": {
                        "description": "Forbidden"
                    },
                    "404": {
                        "description": "Not Found"
                    },
                    "409": {
                        "description": "No delivery possible"
                    },
                    "412": {
                        "description": "Invalid address"
                    }
                },
                "security": [
                    {
                        "apiKey": []
                    }
                ],
                "deprecated": false
            }
        },
        "/v1/validate-address": {
            "get": {
                "tags": [
                    "slot-controller"
                ],
                "summary": "Validate address",
                "operationId": "validateAddressUsingGET",
                "produces": [
                    "application/json"
                ],
                "parameters": [
                    {
                        "name": "city",
                        "in": "query",
                        "description": "city",
                        "required": false,
                        "type": "string"
                    },
                    {
                        "name": "houseNumber",
                        "in": "query",
                        "description": "houseNumber",
                        "required": false,
                        "type": "string"
                    },
                    {
                        "name": "postalCode",
                        "in": "query",
                        "description": "postalCode",
                        "required": true,
                        "type": "string"
                    },
                    {
                        "name": "street",
                        "in": "query",
                        "description": "street",
                        "required": false,
                        "type": "string"
                    }
                ],
                "responses": {
                    "200": {
                        "description": "Success",
                        "schema": {
                            "originalRef": "AddressValidationResponse",
                            "$ref": "#/definitions/AddressValidationResponse"
                        }
                    },
                    "400": {
                        "description": "Bad request"
                    },
                    "401": {
                        "description": "Unauthorized"
                    },
                    "403": {
                        "description": "Forbidden"
                    },
                    "404": {
                        "description": "Not Found"
                    }
                },
                "security": [
                    {
                        "apiKey": []
                    }
                ],
                "deprecated": false
            }
        }
    },
    "securityDefinitions": {
        "apiKey": {
            "type": "apiKey",
            "name": "x-authorization",
            "in": "header"
        }
    },
    "definitions": {
        "AddressValidationResponse": {
            "type": "object",
            "required": [
                "isSuccessful"
            ],
            "properties": {
                "isSuccessful": {
                    "type": "boolean"
                },
                "message": {
                    "type": "string"
                }
            },
            "title": "AddressValidationResponse"
        },
        "ModelAndView": {
            "type": "object",
            "properties": {
                "empty": {
                    "type": "boolean"
                },
                "model": {
                    "type": "object"
                },
                "modelMap": {
                    "type": "object",
                    "additionalProperties": {
                        "type": "object"
                    }
                },
                "reference": {
                    "type": "boolean"
                },
                "status": {
                    "type": "string",
                    "enum": [
                        "100 CONTINUE",
                        "101 SWITCHING_PROTOCOLS",
                        "102 PROCESSING",
                        "103 CHECKPOINT",
                        "200 OK",
                        "201 CREATED",
                        "202 ACCEPTED",
                        "203 NON_AUTHORITATIVE_INFORMATION",
                        "204 NO_CONTENT",
                        "205 RESET_CONTENT",
                        "206 PARTIAL_CONTENT",
                        "207 MULTI_STATUS",
                        "208 ALREADY_REPORTED",
                        "226 IM_USED",
                        "300 MULTIPLE_CHOICES",
                        "301 MOVED_PERMANENTLY",
                        "302 FOUND",
                        "302 MOVED_TEMPORARILY",
                        "303 SEE_OTHER",
                        "304 NOT_MODIFIED",
                        "305 USE_PROXY",
                        "307 TEMPORARY_REDIRECT",
                        "308 PERMANENT_REDIRECT",
                        "400 BAD_REQUEST",
                        "401 UNAUTHORIZED",
                        "402 PAYMENT_REQUIRED",
                        "403 FORBIDDEN",
                        "404 NOT_FOUND",
                        "405 METHOD_NOT_ALLOWED",
                        "406 NOT_ACCEPTABLE",
                        "407 PROXY_AUTHENTICATION_REQUIRED",
                        "408 REQUEST_TIMEOUT",
                        "409 CONFLICT",
                        "410 GONE",
                        "411 LENGTH_REQUIRED",
                        "412 PRECONDITION_FAILED",
                        "413 PAYLOAD_TOO_LARGE",
                        "413 REQUEST_ENTITY_TOO_LARGE",
                        "414 URI_TOO_LONG",
                        "414 REQUEST_URI_TOO_LONG",
                        "415 UNSUPPORTED_MEDIA_TYPE",
                        "416 REQUESTED_RANGE_NOT_SATISFIABLE",
                        "417 EXPECTATION_FAILED",
                        "418 I_AM_A_TEAPOT",
                        "419 INSUFFICIENT_SPACE_ON_RESOURCE",
                        "420 METHOD_FAILURE",
                        "421 DESTINATION_LOCKED",
                        "422 UNPROCESSABLE_ENTITY",
                        "423 LOCKED",
                        "424 FAILED_DEPENDENCY",
                        "426 UPGRADE_REQUIRED",
                        "428 PRECONDITION_REQUIRED",
                        "429 TOO_MANY_REQUESTS",
                        "431 REQUEST_HEADER_FIELDS_TOO_LARGE",
                        "451 UNAVAILABLE_FOR_LEGAL_REASONS",
                        "500 INTERNAL_SERVER_ERROR",
                        "501 NOT_IMPLEMENTED",
                        "502 BAD_GATEWAY",
                        "503 SERVICE_UNAVAILABLE",
                        "504 GATEWAY_TIMEOUT",
                        "505 HTTP_VERSION_NOT_SUPPORTED",
                        "506 VARIANT_ALSO_NEGOTIATES",
                        "507 INSUFFICIENT_STORAGE",
                        "508 LOOP_DETECTED",
                        "509 BANDWIDTH_LIMIT_EXCEEDED",
                        "510 NOT_EXTENDED",
                        "511 NETWORK_AUTHENTICATION_REQUIRED"
                    ]
                },
                "view": {
                    "originalRef": "View",
                    "$ref": "#/definitions/View"
                },
                "viewName": {
                    "type": "string"
                }
            },
            "title": "ModelAndView"
        },
        "Slot": {
            "type": "object",
            "required": [
                "endTime",
                "productionRunCode",
                "startTime"
            ],
            "properties": {
                "defaultServiceCharge": {
                    "type": "number"
                },
                "deliveryLocationId": {
                    "type": "integer",
                    "format": "int64"
                },
                "discountType": {
                    "type": "string",
                    "enum": [
                        "NORMAL",
                        "DISCOUNTED",
                        "LOWEST"
                    ]
                },
                "eco": {
                    "type": "boolean"
                },
                "endTime": {
                    "type": "string",
                    "format": "date-time"
                },
                "productionRunCode": {
                    "type": "string",
                    "enum": [
                        "PO",
                        "PA"
                    ]
                },
                "serviceCharge": {
                    "type": "number"
                },
                "shiftCode": {
                    "type": "string"
                },
                "startTime": {
                    "type": "string",
                    "format": "date-time"
                },
                "status": {
                    "type": "string",
                    "enum": [
                        "OPEN",
                        "CLOSED",
                        "SELECTED",
                        "FULL",
                        "EXPIRED"
                    ]
                }
            },
            "title": "Slot"
        },
        "SlotDay": {
            "type": "object",
            "required": [
                "date",
                "freeDelivery",
                "slots"
            ],
            "properties": {
                "date": {
                    "type": "string",
                    "format": "date"
                },
                "freeDelivery": {
                    "type": "boolean"
                },
                "freeDeliveryTitle": {
                    "type": "string"
                },
                "slots": {
                    "type": "array",
                    "items": {
                        "originalRef": "Slot",
                        "$ref": "#/definitions/Slot"
                    }
                }
            },
            "title": "SlotDay"
        },
        "View": {
            "type": "object",
            "properties": {
                "contentType": {
                    "type": "string"
                }
            },
            "title": "View"
        }
    }
}

''';

const ref = '\$ref';
