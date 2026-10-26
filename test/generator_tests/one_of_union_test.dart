import 'dart:convert';

import 'package:swagger_dart_code_generator/src/code_generators/swagger_additions_generator.dart';
import 'package:swagger_dart_code_generator/src/code_generators/swagger_requests_generator.dart';
import 'package:swagger_dart_code_generator/src/code_generators/v3/swagger_enums_generator_v3.dart';
import 'package:swagger_dart_code_generator/src/code_generators/v3/swagger_models_generator_v3.dart';
import 'package:swagger_dart_code_generator/src/models/generator_options.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/swagger_root.dart';
import 'package:test/test.dart';

void main() {
  String generate(Map<String, dynamic> spec, {bool enabled = true}) =>
      SwaggerModelsGeneratorV3(
        GeneratorOptions(
          inputFolder: '',
          outputFolder: '',
          generateOneOfUnions: enabled,
          overrideEqualsAndHashcode: false,
          overrideToString: false,
        ),
      ).generate(
        root: SwaggerRoot.parse(jsonEncode(spec)),
        fileName: 'fileName',
        allEnums: [],
      );

  final account = {
    'type': 'object',
    'required': ['account_number'],
    'properties': {
      'account_number': {'type': 'string'},
    },
  };

  Map<String, dynamic> specWith(
    Map<String, dynamic> property, {
    Map<String, dynamic> schemas = const {},
  }) => {
    'openapi': '3.0.0',
    'info': {'title': 'test', 'version': '1'},
    'paths': {},
    'components': {
      'schemas': {
        ...schemas,
        'Holder': {
          'type': 'object',
          'required': ['data'],
          'properties': {'data': property},
        },
      },
    },
  };

  group('oneOf unions', () {
    test('keeps the property dynamic when the option is off', () {
      final result = generate(
        specWith({
          'oneOf': [
            account,
            {'type': 'array', 'items': account},
          ],
        }),
        enabled: false,
      );

      expect(result, contains('final dynamic data;'));
      expect(result, isNot(contains('sealed class')));
    });

    test('types an object or array of inline objects', () {
      final result = generate(
        specWith({
          'oneOf': [
            account,
            {'type': 'array', 'items': account},
          ],
        }),
      );

      expect(result, contains('final Holder\$Data data;'));
      expect(result, contains('sealed class Holder\$Data {'));
      expect(
        result,
        contains(
          "final Map<String, dynamic> json when json.containsKey('account_number') => "
          'Holder\$Data\$Object(Holder\$Data\$Object\$Value.fromJson(json)),',
        ),
      );
      expect(
        result,
        contains(
          'final List<dynamic> json when json.every((item) => item is Map<String, dynamic>) => '
          'Holder\$Data\$Array(json.whereType<Map<String, dynamic>>().map(Holder\$Data\$Array\$Item.fromJson).toList()),',
        ),
      );
      expect(result, contains('_ => Holder\$Data\$Unknown(json),'));
      expect(
        result,
        contains('final class Holder\$Data\$Unknown extends Holder\$Data {'),
      );
      expect(
        result,
        contains('final class Holder\$Data\$Object extends Holder\$Data {'),
      );
      expect(result, contains('class Holder\$Data\$Object\$Value{'));
      expect(result, contains('class Holder\$Data\$Array\$Item{'));
    });

    test('matches two inline objects by their required keys', () {
      final result = generate(
        specWith({
          'oneOf': [
            account,
            {
              'type': 'object',
              'required': ['iban', 'bic'],
              'properties': {
                'iban': {'type': 'string'},
                'bic': {'type': 'string'},
              },
            },
          ],
        }),
      );

      final iban = result.indexOf(
        "final Map<String, dynamic> json when json.containsKey('iban') && json.containsKey('bic') => Holder\$Data\$Object2(",
      );
      final accountNumber = result.indexOf(
        "final Map<String, dynamic> json when json.containsKey('account_number') => Holder\$Data\$Object1(",
      );
      expect(iban, isNonNegative);
      expect(accountNumber, greaterThan(iban));
    });

    test('matches arrays by the type of their items', () {
      final result = generate(
        specWith(
          {
            'oneOf': [
              {
                'type': 'array',
                'items': {'type': 'number'},
              },
              {
                'type': 'array',
                'items': {r'$ref': '#/components/schemas/Card'},
              },
            ],
          },
          schemas: {'Card': account},
        ),
      );

      expect(
        result,
        contains(
          'final List<dynamic> json when json.every((item) => item is num) => '
          'Holder\$Data\$Array1(json.whereType<num>().map((item) => item.toDouble()).toList()),',
        ),
      );
      expect(
        result,
        contains(
          'final List<dynamic> json when json.every((item) => item is Map<String, dynamic>) => '
          'Holder\$Data\$Array2(json.whereType<Map<String, dynamic>>().map(Card.fromJson).toList()),',
        ),
      );
    });

    test('types a string or a map of strings', () {
      final result = generate(
        specWith({
          'oneOf': [
            {'type': 'string'},
            {
              'type': 'object',
              'additionalProperties': {'type': 'string'},
            },
          ],
        }),
      );

      expect(
        result,
        contains('final String json => Holder\$Data\$String(json),'),
      );
      expect(
        result,
        contains(
          'final Map<String, dynamic> json when json.values.every((value) => value is String) => '
          'Holder\$Data\$Object({for (final MapEntry(:key, :value) in json.entries) if (value is String) key: value}),',
        ),
      );
      expect(result, contains('final Map<String, String> value;'));
    });

    test('matches referenced objects by discriminator', () {
      final result = generate(
        specWith(
          {
            'oneOf': [
              {r'$ref': '#/components/schemas/Card'},
              {r'$ref': '#/components/schemas/Bank'},
            ],
            'discriminator': {
              'propertyName': 'kind',
              'mapping': {'card': '#/components/schemas/Card'},
            },
          },
          schemas: {'Card': account, 'Bank': account},
        ),
      );

      expect(
        result,
        contains(
          "final Map<String, dynamic> json when json['kind'] == 'card' => Holder\$Data\$Card(Card.fromJson(json)),",
        ),
      );
      expect(
        result,
        contains(
          "final Map<String, dynamic> json when json['kind'] == 'Bank' => Holder\$Data\$Bank(Bank.fromJson(json)),",
        ),
      );
    });

    test('generates the enums used inside inline branches', () {
      final account = {
        'type': 'object',
        'properties': {
          'payment_meta': {
            'type': 'object',
            'properties': {
              'payment_methods': {
                'type': 'array',
                'items': {
                  'type': 'string',
                  'enum': ['bank_transfer', 'card'],
                },
              },
            },
          },
        },
      };
      final spec = jsonEncode(
        specWith({
          'oneOf': [
            account,
            {'type': 'array', 'items': account},
          ],
        }),
      );
      final options = GeneratorOptions(
        inputFolder: '',
        outputFolder: '',
        generateOneOfUnions: true,
      );

      final enums = SwaggerEnumsGeneratorV3(
        options,
      ).generateAllEnums(root: SwaggerRoot.parse(spec), fileName: 'fileName');
      final models = SwaggerModelsGeneratorV3(options).generate(
        root: SwaggerRoot.parse(spec),
        fileName: 'fileName',
        allEnums: enums,
      );

      final referenced = RegExp(
        r'enums\.([A-Za-z0-9_$]+)',
      ).allMatches(models).map((match) => match.group(1)).toSet();
      expect(
        referenced,
        containsAll([
          'Holder\$Data\$Object\$Value\$PaymentMetaPaymentMethods',
          'Holder\$Data\$Array\$Item\$PaymentMetaPaymentMethods',
        ]),
      );
      expect(enums.map((e) => e.name), containsAll(referenced));
    });

    test('narrows JSON values without casts or throws', () {
      final result = generate(
        specWith(
          {
            'oneOf': [
              {
                'type': 'array',
                'items': {'type': 'number'},
              },
              {
                'type': 'array',
                'items': {r'$ref': '#/components/schemas/Card'},
              },
              {
                'type': 'object',
                'additionalProperties': {'type': 'string'},
              },
            ],
          },
          schemas: {'Card': account},
        ),
      );

      final union = RegExp(
        r'sealed class Holder\$Data \{[\s\S]*?(?=\n@JsonSerializable|\nclass |$)',
      ).firstMatch(result)?.group(0);
      expect(union, isNotNull);
      expect(union, isNot(contains(' as ')));
      expect(union, isNot(contains('throw')));
      expect(union, isNot(matches(RegExp(r'[\w)\]]!(?!=)'))));
    });

    test('names referenced branches after their schema', () {
      final result = generate(
        specWith(
          {
            'oneOf': [
              {r'$ref': '#/components/schemas/Card'},
              {r'$ref': '#/components/schemas/Card'},
              {r'$ref': '#/components/schemas/Unknown'},
              account,
            ],
          },
          schemas: {'Card': account, 'Unknown': account},
        ),
      );

      expect(
        result,
        contains('final class Holder\$Data\$Card1 extends Holder\$Data {'),
      );
      expect(
        result,
        contains('final class Holder\$Data\$Card2 extends Holder\$Data {'),
      );
      expect(
        result,
        contains('final class Holder\$Data\$Unknown1 extends Holder\$Data {'),
      );
      expect(
        result,
        contains('final class Holder\$Data\$Object extends Holder\$Data {'),
      );
      expect(
        result,
        contains('final class Holder\$Data\$Unknown extends Holder\$Data {'),
      );
    });

    test('matches string and integer branches by their enum values', () {
      final result = generate(
        specWith({
          'oneOf': [
            {'type': 'string'},
            {
              'type': 'string',
              'enum': ['card', "it's \$5"],
            },
            {
              'type': 'integer',
              'enum': [1, 2],
            },
          ],
        }),
      );

      final enumString = result.indexOf(
        "final String json when const {'card', 'it\\'s \\\$5'}.contains(json) => Holder\$Data\$String2(json),",
      );
      final anyString = result.indexOf(
        'final String json => Holder\$Data\$String1(json),',
      );
      expect(enumString, isNonNegative);
      expect(anyString, greaterThan(enumString));
      expect(
        result,
        contains(
          'final int json when const {1, 2}.contains(json) => Holder\$Data\$Integer(json),',
        ),
      );
    });

    test('warns about branches that can never be matched', () {
      expect(
        () => generate(
          specWith({
            'oneOf': [
              {'type': 'string'},
              {'type': 'string'},
              {
                'type': 'object',
                'properties': {
                  'a': {'type': 'string'},
                },
              },
              {
                'type': 'object',
                'properties': {
                  'b': {'type': 'string'},
                },
              },
            ],
          }),
        ),
        prints(
          allOf(
            contains('[WARNING] oneOf Holder\$Data:'),
            contains('Holder\$Data\$Object2'),
            contains('Holder\$Data\$String2'),
          ),
        ),
      );
    });

    test('keeps the first of several identical branches, in spec order', () {
      final result = generate(
        specWith({
          'oneOf': [
            for (var i = 0; i < 40; i++) {'type': 'string'},
          ],
        }),
      );

      expect(
        result,
        contains('final String json => Holder\$Data\$String1(json),'),
      );
      expect(RegExp(r'final String json').allMatches(result), hasLength(1));
    });

    test('does not warn when every branch can be matched', () {
      expect(
        () => generate(
          specWith({
            'oneOf': [
              account,
              {'type': 'array', 'items': account},
            ],
          }),
        ),
        prints(isEmpty),
      );
    });

    test('names variants of a property with a reserved name', () {
      final result = generate({
        'openapi': '3.0.0',
        'info': {'title': 'test', 'version': '1'},
        'paths': {},
        'components': {
          'schemas': {
            'Holder': {
              'type': 'object',
              'properties': {
                'method': {
                  'oneOf': [
                    {'type': 'string'},
                    {'type': 'integer'},
                  ],
                },
              },
            },
          },
        },
      });

      expect(result, contains('final Holder\$Method\$? method;'));
      expect(
        result,
        contains(
          'final class Holder\$Method\$String extends Holder\$Method\$ {',
        ),
      );
      expect(result, contains('_ => Holder\$Method\$Unknown(json),'));
      expect(result, isNot(contains('\$\$')));
    });

    test('keeps the property dynamic when a branch cannot be typed', () {
      final result = generate(
        specWith({
          'oneOf': [
            {'type': 'string'},
            {
              'type': 'array',
              'items': {
                'oneOf': [
                  {'type': 'string'},
                  {'type': 'integer'},
                ],
              },
            },
          ],
        }),
      );

      expect(result, contains('final dynamic data;'));
    });
  });

  group('oneOf unions in array items', () {
    test('types a property whose items are a oneOf', () {
      final result = generate(
        specWith({
          'type': 'array',
          'items': {
            'oneOf': [
              {'type': 'string'},
              {'type': 'integer'},
            ],
          },
        }),
      );

      expect(result, contains('final List<Holder\$Data\$Item> data;'));
      expect(result, contains('sealed class Holder\$Data\$Item {'));
      expect(
        result,
        contains('final int json => Holder\$Data\$Item\$Integer(json),'),
      );
    });

    test('types a top-level array schema whose items are a oneOf', () {
      final result = generate(
        specWith(
          {r'$ref': '#/components/schemas/Ids'},
          schemas: {
            'Ids': {
              'type': 'array',
              'items': {
                'oneOf': [
                  {'type': 'string'},
                  account,
                ],
              },
            },
          },
        ),
      );

      expect(result, contains('typedef Ids = List<Ids\$Item>;'));
      expect(result, contains('sealed class Ids\$Item {'));
      expect(result, contains('class Ids\$Item\$Object\$Value{'));
    });
  });

  group('nullable oneOf', () {
    test(
      'types a single branch left after the null branch as a nullable property',
      () {
        final result = generate(
          specWith({
            'oneOf': [
              {'type': 'string'},
              {'type': 'null'},
            ],
          }),
        );

        expect(result, contains('final String? data;'));
        expect(result, isNot(contains('sealed class')));
      },
    );

    test('makes a union with a null branch nullable', () {
      final result = generate(
        specWith({
          'oneOf': [
            account,
            {'type': 'array', 'items': account},
            {'type': 'null'},
          ],
        }),
      );

      expect(result, contains('final Holder\$Data? data;'));
      expect(result, isNot(contains('Holder\$Data\$Null')));
    });
  });

  group('oneOf request bodies and responses', () {
    final spec = jsonEncode({
      'openapi': '3.0.0',
      'info': {'title': 'test', 'version': '1'},
      'paths': {
        '/things': {
          'put': {
            'requestBody': {
              'content': {
                'application/json': {
                  'schema': {
                    'oneOf': [
                      account,
                      {'type': 'array', 'items': account},
                    ],
                  },
                },
              },
            },
            'responses': {
              '200': {
                'description': 'ok',
                'content': {
                  'application/json': {
                    'schema': {
                      'oneOf': [
                        {'type': 'string'},
                        account,
                      ],
                    },
                  },
                },
              },
            },
          },
        },
      },
      'components': {'schemas': {}},
    });
    final options = GeneratorOptions(
      inputFolder: '',
      outputFolder: '',
      generateOneOfUnions: true,
    );

    test('types the body and the response as unions', () {
      final models = SwaggerModelsGeneratorV3(options).generate(
        root: SwaggerRoot.parse(spec),
        fileName: 'fileName',
        allEnums: [],
      );
      final requests = SwaggerRequestsGenerator(options).generate(
        swaggerRoot: SwaggerRoot.parse(spec),
        className: 'ThingsService',
        fileName: 'things_service',
        allEnums: [],
      );

      expect(models, contains('sealed class ThingsPut\$RequestBody {'));
      expect(models, contains('sealed class ThingsPut\$Response {'));
      expect(requests, contains('ThingsPut\$RequestBody? body'));
      expect(
        requests,
        contains('Future<chopper.Response<ThingsPut\$Response>> thingsPut('),
      );
      expect(
        requests,
        contains(
          'generatedMapping.putIfAbsent(ThingsPut\$Response, () => ThingsPut\$Response.fromJsonFactory);',
        ),
      );
    });

    test('uses the model postfix for union bodies and responses', () {
      final postfixed = GeneratorOptions(
        inputFolder: '',
        outputFolder: '',
        generateOneOfUnions: true,
        modelPostfix: 'Dto',
      );
      final models = SwaggerModelsGeneratorV3(postfixed).generate(
        root: SwaggerRoot.parse(spec),
        fileName: 'fileName',
        allEnums: [],
      );
      final requests = SwaggerRequestsGenerator(postfixed).generate(
        swaggerRoot: SwaggerRoot.parse(spec),
        className: 'ThingsService',
        fileName: 'things_service',
        allEnums: [],
      );

      expect(models, contains('sealed class ThingsPut\$RequestBodyDto {'));
      expect(models, contains('sealed class ThingsPut\$ResponseDto {'));
      expect(requests, contains('ThingsPut\$RequestBodyDto? body'));
      expect(
        requests,
        contains('Future<chopper.Response<ThingsPut\$ResponseDto>> thingsPut('),
      );
      expect(
        requests,
        contains(
          'generatedMapping.putIfAbsent(ThingsPut\$ResponseDto, () => ThingsPut\$ResponseDto.fromJsonFactory);',
        ),
      );
    });

    test('decodes union bodies and union list items in the converter', () {
      String converter({required bool enabled}) => SwaggerAdditionsGenerator(
        GeneratorOptions(
          inputFolder: '',
          outputFolder: '',
          generateOneOfUnions: enabled,
        ),
      ).generateCustomJsonConverter('things_service');

      expect(
        converter(enabled: true),
        allOf(
          contains('if (unionFactory is ResultType Function(Object?)) {'),
          contains('if (jsonFactory is T Function(Object?)) {'),
        ),
      );
      expect(converter(enabled: false), isNot(contains('Function(Object?)')));
    });
  });

  group('review fixes', () {
    Map<String, dynamic> api({
      Map<String, dynamic> paths = const {},
      Map<String, dynamic> schemas = const {},
    }) => {
      'openapi': '3.0.0',
      'info': {'title': 'test', 'version': '1'},
      'paths': paths,
      'components': {'schemas': schemas},
    };
    Map<String, dynamic> ref(String name) => {
      r'$ref': '#/components/schemas/$name',
    };
    Map<String, dynamic> json(
      Map<String, dynamic> schema, {
      String code = '200',
    }) => {
      code: {
        'description': 'ok',
        'content': {
          'application/json': {'schema': schema},
        },
      },
    };
    final pets = {
      'Pet': {
        'type': 'object',
        'required': ['petType', 'name'],
        'properties': {
          'petType': {'type': 'string'},
          'name': {'type': 'string'},
        },
      },
      'Cat': {
        'allOf': [
          ref('Pet'),
          {
            'type': 'object',
            'properties': {
              'livesLeft': {'type': 'integer'},
            },
          },
        ],
      },
      'Dog': {
        'allOf': [
          ref('Pet'),
          {
            'type': 'object',
            'properties': {
              'barks': {'type': 'boolean'},
            },
          },
        ],
      },
    };
    String models(Map<String, dynamic> spec, [GeneratorOptions? options]) =>
        SwaggerModelsGeneratorV3(
          options ??
              GeneratorOptions(
                inputFolder: '',
                outputFolder: '',
                generateOneOfUnions: true,
              ),
        ).generate(
          root: SwaggerRoot.parse(jsonEncode(spec)),
          fileName: 'f',
          allEnums: [],
        );
    String requests(Map<String, dynamic> spec, [GeneratorOptions? options]) =>
        SwaggerRequestsGenerator(
          options ??
              GeneratorOptions(
                inputFolder: '',
                outputFolder: '',
                generateOneOfUnions: true,
              ),
        ).generate(
          swaggerRoot: SwaggerRoot.parse(jsonEncode(spec)),
          className: 'S',
          fileName: 's',
          allEnums: [],
        );

    test(
      'names inline union responses after the path when request names come from operationId',
      () {
        final spec = api(
          paths: {
            '/ops': {
              'get': {
                'operationId': 'listOps',
                'responses': json({
                  'oneOf': [
                    {'type': 'string'},
                    {'type': 'integer'},
                  ],
                }),
              },
            },
          },
        );
        final options = GeneratorOptions(
          inputFolder: '',
          outputFolder: '',
          generateOneOfUnions: true,
          usePathForRequestNames: false,
        );

        expect(
          models(spec, options),
          contains('sealed class OpsGet\$Response {'),
        );
        expect(
          requests(spec, options),
          contains('Future<chopper.Response<OpsGet\$Response>> listOps('),
        );
      },
    );

    test('types a union response under any 2xx code', () {
      final spec = api(
        paths: {
          '/accepted': {
            'post': {
              'responses': json({
                'oneOf': [
                  {'type': 'string'},
                  {'type': 'integer'},
                ],
              }, code: '202'),
            },
          },
        },
      );

      expect(models(spec), contains('sealed class AcceptedPost\$Response {'));
      expect(
        requests(spec),
        contains(
          'Future<chopper.Response<AcceptedPost\$Response>> acceptedPost(',
        ),
      );
    });

    test(
      'tells allOf subtypes apart by required keys they inherit and properties only they declare',
      () {
        final result = models(
          api(
            schemas: {
              ...pets,
              'Owner': {
                'type': 'object',
                'properties': {
                  'pet': {
                    'oneOf': [ref('Cat'), ref('Dog')],
                  },
                },
              },
            },
          ),
        );

        expect(
          result,
          contains(
            "final Map<String, dynamic> json when json.containsKey('petType') && json.containsKey('name') && "
            "(json.containsKey('livesLeft')) && !json.containsKey('barks') => Owner\$Pet\$Cat(Cat.fromJson(json)),",
          ),
        );
        expect(
          result,
          contains(
            "final Map<String, dynamic> json when json.containsKey('petType') && json.containsKey('name') && "
            "(json.containsKey('barks')) && !json.containsKey('livesLeft') => Owner\$Pet\$Dog(Dog.fromJson(json)),",
          ),
        );
      },
    );

    test(
      'warns when object branches are told apart only by their properties',
      () {
        expect(
          () => models(
            api(
              schemas: {
                ...pets,
                'Owner': {
                  'type': 'object',
                  'properties': {
                    'pet': {
                      'oneOf': [ref('Cat'), ref('Dog')],
                    },
                  },
                },
              },
            ),
          ),
          prints(
            contains(
              '[WARNING] oneOf Owner\$Pet: Owner\$Pet\$Cat, Owner\$Pet\$Dog are told apart only by',
            ),
          ),
        );
      },
    );

    test(
      'uses a discriminator inherited from a base schema, with aliases and escaping',
      () {
        final result = models(
          api(
            schemas: {
              'Animal': {
                'type': 'object',
                'required': [r'$type'],
                'properties': {
                  r'$type': {'type': 'string'},
                },
                'discriminator': {
                  'propertyName': r'$type',
                  'mapping': {
                    'lion': '#/components/schemas/Lion',
                    "big'cat": '#/components/schemas/Lion',
                    'wolf': '#/components/schemas/Wolf',
                  },
                },
              },
              'Lion': {
                'allOf': [ref('Animal')],
              },
              'Wolf': {
                'allOf': [ref('Animal')],
              },
              'Zoo': {
                'type': 'object',
                'properties': {
                  'animal': {
                    'oneOf': [ref('Lion'), ref('Wolf')],
                  },
                },
              },
            },
          ),
        );

        expect(
          result,
          contains(
            "final Map<String, dynamic> json when const {'lion', 'big\\'cat'}.contains(json['\\\$type']) => Zoo\$Animal\$Lion(Lion.fromJson(json)),",
          ),
        );
        expect(
          result,
          contains(
            "final Map<String, dynamic> json when json['\\\$type'] == 'wolf' => Zoo\$Animal\$Wolf(Wolf.fromJson(json)),",
          ),
        );
      },
    );

    test('types a single remaining branch through the usual rules', () {
      final spec = api(
        paths: {
          '/status': {
            'get': {
              'responses': json({
                'oneOf': [
                  ref('Status'),
                  {'type': 'null'},
                ],
              }),
            },
          },
          '/id': {
            'get': {
              'responses': json({
                'oneOf': [
                  ref('Id'),
                  {'type': 'null'},
                ],
              }),
            },
          },
        },
        schemas: {
          'Status': {
            'type': 'string',
            'enum': ['on', 'off'],
          },
          'Id': {'type': 'string'},
          'Cat': {
            'type': 'object',
            'properties': {
              'name': {'type': 'string'},
            },
          },
          'MaybeCat': {
            'oneOf': [
              ref('Cat'),
              {'type': 'null'},
            ],
          },
        },
      );

      final generated = requests(spec);
      expect(generated, contains('Future<chopper.Response> statusGet('));
      expect(generated, contains('Future<chopper.Response<String>> idGet('));
      expect(models(spec), contains('typedef MaybeCat = Cat;'));
    });

    test('does not emit a request body class when the union falls back', () {
      final result = models(
        api(
          paths: {
            '/eb': {
              'post': {
                'requestBody': {
                  'content': {
                    'application/json': {
                      'schema': {
                        'oneOf': [ref('Status'), ref('Cat')],
                      },
                    },
                  },
                },
                'responses': json({'type': 'string'}),
              },
            },
          },
          schemas: {
            'Status': {
              'type': 'string',
              'enum': ['on', 'off'],
            },
            'Cat': {
              'type': 'object',
              'properties': {
                'name': {'type': 'string'},
              },
            },
          },
        ),
      );

      expect(result, isNot(contains('EbPost\$RequestBody')));
    });

    test(
      'makes nullable item unions nullable and keeps custom annotations on union fields',
      () {
        final result = models(
          api(
            schemas: {
              'Holder': {
                'type': 'object',
                'properties': {
                  'tags': {
                    'type': 'array',
                    'items': {
                      'oneOf': [
                        {'type': 'string'},
                        {'type': 'integer'},
                        {'type': 'null'},
                      ],
                    },
                  },
                  'note': {
                    'oneOf': [
                      {'type': 'string'},
                      {'type': 'integer'},
                    ],
                    'x-deprecated-message': 'use tags',
                  },
                },
              },
            },
          ),
          GeneratorOptions(
            inputFolder: '',
            outputFolder: '',
            generateOneOfUnions: true,
            customAnnotations: [
              CustomAnnotationMap(
                typeName: 'Deprecated',
                swaggerKey: 'x-deprecated-message',
              ),
            ],
          ),
        );

        expect(result, contains('final List<Holder\$Tags\$Item?>? tags;'));
        expect(
          result,
          contains("@Deprecated('use tags')\n  final Holder\$Note? note;"),
        );
      },
    );
  });

  group('second review fixes', () {
    Map<String, dynamic> api({
      Map<String, dynamic> paths = const {},
      Map<String, dynamic> schemas = const {},
    }) => {
      'openapi': '3.0.0',
      'info': {'title': 'test', 'version': '1'},
      'paths': paths,
      'components': {'schemas': schemas},
    };
    Map<String, dynamic> ref(String name) => {
      r'$ref': '#/components/schemas/$name',
    };
    Map<String, dynamic> json(Map<String, dynamic> schema) => {
      '200': {
        'description': 'ok',
        'content': {
          'application/json': {'schema': schema},
        },
      },
    };
    final on = GeneratorOptions(
      inputFolder: '',
      outputFolder: '',
      generateOneOfUnions: true,
    );
    String models(Map<String, dynamic> spec, [GeneratorOptions? options]) =>
        SwaggerModelsGeneratorV3(options ?? on).generate(
          root: SwaggerRoot.parse(jsonEncode(spec)),
          fileName: 'f',
          allEnums: [],
        );
    String requests(Map<String, dynamic> spec) =>
        SwaggerRequestsGenerator(on).generate(
          swaggerRoot: SwaggerRoot.parse(jsonEncode(spec)),
          className: 'S',
          fileName: 's',
          allEnums: [],
        );
    final cat = {
      'type': 'object',
      'properties': {
        'name': {'type': 'string'},
      },
    };

    test(
      'lets required keys separate branches before looking at other properties',
      () {
        final result = models(
          api(
            schemas: {
              'Cat': {
                'type': 'object',
                'required': ['name'],
                'properties': {
                  'name': {'type': 'string'},
                  'livesLeft': {'type': 'integer'},
                },
              },
              'Dog': {
                'type': 'object',
                'required': ['name', 'barks'],
                'properties': {
                  'name': {'type': 'string'},
                  'barks': {'type': 'boolean'},
                },
              },
              'Owner': {
                'type': 'object',
                'properties': {
                  'pet': {
                    'oneOf': [ref('Cat'), ref('Dog')],
                  },
                },
              },
            },
          ),
        );

        final dog = result.indexOf(
          "final Map<String, dynamic> json when json.containsKey('name') && json.containsKey('barks') => Owner\$Pet\$Dog(",
        );
        final catGuard = result.indexOf(
          "final Map<String, dynamic> json when json.containsKey('name') => Owner\$Pet\$Cat(",
        );
        expect(dog, isNonNegative);
        expect(catGuard, greaterThan(dog));
      },
    );

    test('types a single inline object branch of a response as its class', () {
      final spec = api(
        paths: {
          '/single': {
            'get': {
              'responses': json({
                'oneOf': [
                  {
                    'type': 'object',
                    'properties': {
                      'id': {'type': 'string'},
                    },
                  },
                  {'type': 'null'},
                ],
              }),
            },
          },
        },
      );

      expect(
        requests(spec),
        contains('Future<chopper.Response<SingleGet\$Response>> singleGet('),
      );
      expect(models(spec), contains('class SingleGet\$Response{'));
    });

    test('types a single inline array branch of a response as a list', () {
      final generated = requests(
        api(
          paths: {
            '/cats': {
              'get': {
                'responses': json({
                  'oneOf': [
                    {'type': 'array', 'items': ref('Cat')},
                    {'type': 'null'},
                  ],
                }),
              },
            },
          },
          schemas: {'Cat': cat},
        ),
      );

      expect(
        generated,
        contains('Future<chopper.Response<List<Cat>>> catsGet('),
      );
      expect(
        generated,
        contains(
          'generatedMapping.putIfAbsent(Cat, () => Cat.fromJsonFactory);',
        ),
      );
    });

    test(
      'aliases single-branch components of arrays, and leaves enums to the old behaviour',
      () {
        final result = models(
          api(
            schemas: {
              'Cat': cat,
              'Cats': {'type': 'array', 'items': ref('Cat')},
              'MaybeCats': {
                'oneOf': [
                  ref('Cats'),
                  {'type': 'null'},
                ],
              },
              'Status': {
                'type': 'string',
                'enum': ['on', 'off'],
              },
              'MaybeStatus': {
                'oneOf': [
                  ref('Status'),
                  {'type': 'null'},
                ],
              },
            },
          ),
        );

        expect(result, contains('typedef MaybeCats = Cats;'));
        expect(result, isNot(contains('typedef MaybeStatus')));
      },
    );

    test('numbers repeated variant names without collisions', () {
      final result = models(
        api(
          schemas: {
            'Cat': cat,
            'Cat2': cat,
            'Holder': {
              'type': 'object',
              'properties': {
                'pet': {
                  'oneOf': [ref('Cat'), ref('Cat2'), ref('Cat')],
                },
              },
            },
          },
        ),
      );

      expect(result, contains('final class Holder\$Pet\$Cat1 extends'));
      expect(result, contains('final class Holder\$Pet\$Cat2 extends'));
      expect(result, contains('final class Holder\$Pet\$Cat3 extends'));
    });

    test(
      'keeps the outer property keywords and nullable scalars when collapsing',
      () {
        final result = models(
          api(
            schemas: {
              'Holder': {
                'type': 'object',
                'properties': {
                  'note': {
                    'oneOf': [
                      {'type': 'string'},
                      {'type': 'null'},
                    ],
                    'x-deprecated-message': 'old',
                  },
                  'ids': {
                    'type': 'array',
                    'items': {
                      'oneOf': [
                        {'type': 'integer'},
                        {'type': 'null'},
                      ],
                    },
                  },
                },
              },
            },
          ),
          GeneratorOptions(
            inputFolder: '',
            outputFolder: '',
            generateOneOfUnions: true,
            customAnnotations: [
              CustomAnnotationMap(
                typeName: 'Deprecated',
                swaggerKey: 'x-deprecated-message',
              ),
            ],
          ),
        );

        expect(result, contains("@Deprecated('old')"));
        expect(result, contains('final List<int?>? ids;'));
      },
    );

    test(
      'generates enums for unions inside the items of an array response',
      () {
        final spec = jsonEncode(
          api(
            paths: {
              '/orders': {
                'get': {
                  'responses': json({
                    'type': 'array',
                    'items': {
                      'type': 'object',
                      'properties': {
                        'pay_with': {
                          'oneOf': [
                            {
                              'type': 'object',
                              'properties': {
                                'the_mode': {
                                  'type': 'string',
                                  'enum': ['card', 'bank'],
                                },
                              },
                            },
                            {'type': 'string'},
                          ],
                        },
                      },
                    },
                  }),
                },
              },
            },
          ),
        );

        final enums = SwaggerEnumsGeneratorV3(
          on,
        ).generateAllEnums(root: SwaggerRoot.parse(spec), fileName: 'f');
        final generated = SwaggerModelsGeneratorV3(on).generate(
          root: SwaggerRoot.parse(spec),
          fileName: 'f',
          allEnums: enums,
        );
        final referenced = RegExp(
          r'enums\.([A-Za-z0-9_$]+)',
        ).allMatches(generated).map((m) => m.group(1)).toSet();

        expect(referenced, isNotEmpty);
        expect(enums.map((e) => e.name), containsAll(referenced));
      },
    );

    test('passes a body that is not JSON to union responses as text', () {
      final converter = SwaggerAdditionsGenerator(
        on,
      ).generateCustomJsonConverter('s');

      expect(converter, contains('on FormatException {'));
      expect(converter, contains('body = response.bodyString;'));
    });
  });
}
