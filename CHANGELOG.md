# 2.10.4

* Fixed generation of multipart body parameters

# 2.10.3

* Fixed generation `putIfAbsent` in requests for not needed schemas ([#554](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/554))

* Added `hashCode` to exception words ([#577](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/577))

* Fixed syntax issues with generation ([#572](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/572))

* Fixed generation of array of integers ([#570](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/570))

* Added generation of int64 as `int` ([#568](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/568))

* Some fixes with generation arrays ([#571](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/571))

# 2.10.2

* Fixed generation of enumMaps in case when no models defined ([#540](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/540))

# 2.10.1

* Fixed some issues

# 2.10.0

* Fixed generation very comples swaggers with enums ([#528](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/528))
* Implemented new enums support (Dart 2.17 and higher required) ([#408](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/408))

# 2.9.0

* Fixed generation of nullable model properties ([#522](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/522))

# 2.9.0

* Fixed generation of nullable model properties ([#522](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/522))

# 2.9.0

* Fixed generation of @OptionalBody annotations ([#509](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/509))
* Fixed generation of nullable model properties ([#506](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/506))
* ***Breaking*** Changed String path to Uri in Chopper lib ([#515](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/515))

# 2.8.9

* Fixed generation of request bodies and defined lists types

# 2.8.8

* Fixed generation of some List models

# 2.8.7

* Fixed generation `allOf` properties with just properties ([#507](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/507))

* Fixed generation of basic types refs and lists of them ([#502](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/502))

# 2.8.6

* Make Object in List of Object nullable ([#498](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/498))

* Fixed generation of request bodies in some cases ([#489](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/489))

* Added `Method` to key classes ([#492](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/492))

* Fixed generation of list request bodies ([#493](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/493))

# 2.8.5

* Fixed generation of request bodies with refs ([#484](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/484))

# 2.8.4

* Fixed issue with duplicated enums ([#470](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/470))

# 2.8.3

* Fixed issue with duplicated enums ([#469](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/469))

# 2.8.1

* Fixed generation of some enums and classes ([#458](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/458))
# 2.8.0

* Added Chopper 5.+ Support ([#464](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/464))

# 2.7.9

* Fixed generation of List of enums using nullableLists properties

# 2.7.8

* Added option not to override `toString()` method

# 2.7.7+1

* Returned generation of @JsonValue for enums

# 2.7.6

* Fixed copyWith method generation ([#438](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/438))
* Fixed generation of names with dots and other bad things ([#449](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/449))

# 2.7.5

* Added new build options flag `override_equals_and_hashcode` to disable generation of hashCode and equals if need to decrease codebase

# 2.7.3

* Fixed issue with generation `+` and `-` signs as enum names ([#444](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/444))

# 2.7.2

* Implemented generation of copyWithWrapped ([#438](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/438))

# 2.7.1

* Fixed generation of putIfAbsent for responses ([#436](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/436))

# 2.7.0

* Fixed and optimizations
* Improved multipart support ([#440](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/440))

# 2.6.0

* ***Breaking*** Removed  `use_default_null_for_lists` option
* Added new option: `classes_with_nullabe_lists` option to have avility to customise nullable lists on separate class. Use `.*` regex

# 2.5.8

* Fixed generation of `path` parameters ([#415](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/415))
* Implemented generation of `FormData` ([#385](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/385))

# 2.5.7

* Fixed some issues in swagger examples

# 2.5.6

* Fixed generation of basic types in responses by ref

# 2.5.5

* Fixed cases when enums has integer values in models
* Fixed cases with enums in request bodies

# 2.5.4

* Fixed generation of models with allOf ([#410](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/410))

# 2.5.3

* Bugfixing

# 2.5.2

* Added new build option `additionalHeaders`. It allows to add some headers for ALL service requests

# 2.5.1

* Changed generation of dynamics enums to string enums in requests

# 2.5.0+2

* Code format

# 2.5.0+1

* Fixed generation of lists of objects in schemas ([#398](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/398))
* Duplicated issue ([#397](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/397))
* Global refactoring of Models generator

# 2.4.10

* Fixed generation of requrst properties annotations ([#384](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/384))
* Various fixes and improvements
* Refactored generator caching flow

# 2.4.9

* Added generation of `allOff` models to not class, but to have ability to map it to any type

```dart
typedef ClassName = Map<String, dynamic>
```

# 2.4.8

* Added import `dart:convert`; when generate only models ([#372](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/372))
# 2.4.7

* Made required properties in models not nullable ([#324](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/324))
* Added `nullableModels` build option to made exeptions

# 2.4.6

* Added authentication to `create` method ([#360](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/360))
* Added ability to refactor model names ([#361](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/361))

# 2.4.5

* Fixed generation on Windows ([#354](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/354))

# 2.4.4

* Fixed responses named `Query` ([#343](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/343))
* Fixed Bad state: no element on special swagger ([#355](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/355))

# 2.4.3

* Rid of generation temp file while generation in process ([#352](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/352))
# 2.4.2

* Added linter rule `ignore_for_file` for generated files ([#350](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/350))
* Fixed `dateToJson` generation when `separateModels=true` ([#347](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/347))
* Added ability to add interceptors to create method ([#349](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/349))
* Fixed code generation on Windows platform ([#346](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/346))
# 2.4.1

* Fixed cases when class has name `Query` ([#343](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/343))
* Fixed cases when we have class and field named `class` and it's enum ([#283](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/283))
* Fixed names duplication when generator generates list of outputs

# 2.4.0

* Downgraded `path` dependency

# 2.4.0-prerelease.5

* :partying_face: Implemented yaml format support :partying_face: ([#337](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/337))

# 2.4.0-prerelease.4

* Updated lints ([#339](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/339))
* Added generation enum names with `x-enumNames` or `x-enum-varnames` ([#307](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/307))

# 2.4.0-prerelease.3

* Added toString generation for models ([#340](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/340))
# 2.4.0-prerelease.2

* Added ability to use swagger files from internet ([#316](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/316))
* `input_folder` option is not requited now
* Fixed naming issues and enum names generation

# 2.3.13

* Fixed generation of `Response<List<List<SomeClass>>>` ([#331](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/331))

# 2.3.12

* Upgraded allOf generation without parameters ([#329](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/329))

# 2.3.11

* Fixed cases when classes has name `Type` ([#328](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/328))

# 2.3.10

* Fixed cases when we have `Stream<SomeClass>` as request parameter
* Fixed cases when we have `List<List<....<SomeClass>>>` in model properties

# 2.3.9

* Fixed cases with array string definitions([#313](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/313))

# 2.3.8

* Added generation of `Map<String, dynamic>` for fields with additional properties([#296](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/296))

# 2.3.7

* Fixed enum prefix for list of enums in requests when Enums contain names with symbols([#305](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/305))

# 2.3.6

* Fixed some borded cases in Swagger generator([#311](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/311))

# 2.3.5

* Fixed generation of Enums, defined in /parameters/ and used in request parameters([#263](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/263))

# 2.3.4+1

* Fixed fromJson method for integer Enum fields in models

# 2.3.4

* Added support of integer enum values([#268](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/268))

# 2.3.3

* Removed use_inheritance option. Inheritance is supported by copy-pasting parent fields([#297](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/297))

# 2.3.2

* Fixed cases with Num instead of num in responses([#290](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/290))
* Remove prints

# 2.3.1

* Fix build warnings with no explanation during build([#291](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/291))

# 2.3.0

* [**BREAKING**]: Removed json map generation. Applied new approach([#289](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/289))

# 2.2.10

* Fixed support of int64 fields in Models

# 2.2.9

* Fixed support of fields type integer and format int64

# 2.2.8

* Fixed generation of enum fields in requests
* Changed int64 parsing to double([#285](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/285))

# 2.2.7

* Fix cases with complex enum names, which are duplicated in result([#265](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/264))

# 2.2.6

* Added example project

# 2.2.5

* Returned possibility to use operationId for request name([#275](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/275))
* Added generation of requestBodies integrated to requests, when it's complex model([#265](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/265))

# 2.2.4

* Fixes issues with allOf support
* Fixed issue with basic types in responses models

# 2.2.3

* Added support `AllOf`([#138](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/138))

* Fixed problem with underscore (_) in form field names([#269](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/269))
* Fixed generation of fields with type int32, int64. Parsing it like int
* Fixed generation of responses and request bodies in separate file([#265](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/265))

# 2.2.1

* Added ability to generated models to separate file([#244](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/244))
* [**BREAKING**]: Removed generation of client_index if generate only models

# 2.2.0+1

* Updated changelog (see previous version changes)

# 2.2.0

* [**BREAKING**]: Upgraded to support json_serializable 5.0.0

# 2.1.3+2

* Fixed ability to set exclude_path and include_path([#245](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/245))

# 2.1.3+1

* Fix cases when responses was named like numbers([#248](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/248))

# 2.1.3

* Fixed cases when swagger has not put post get requests
* Added validation for requests names generation

# 2.1.2

* Updated packages json_serializable, json_annotation, build_runner

# 2.1.1+4

* Fix for default value for named parameters

# 2.1.1+3

* Fixed cases when parameters named by keywords, for example In, For, Class etx([#211](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/211))
* Added generation of parameters from, path (not only from requests)([#240](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/240))

# 2.1.1+2

* Fixed issues when content has no application/json child

# 2.1.1+1

* Fixed cases when field number 'number' generated as $num([#235](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/235))
* Fixed cases when field 'num' generated ad 'num' (basic dart type)

# 2.1.1

* Fixed issue when parameters named like int, double etc.([#108](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/108))

# 2.1.0-prerelease.9

* Fixed cases when file names like some_file.extension.swagger.json.dart.json([#228](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/228))
* Removed generation of converter when build_only_models is true([#206](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/206))


# 2.1.0-prerelease.8

* Added generation of int get hashCode([#221](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/221))
* Added example project

# 2.1.0-prerelease.7

* Make dynamic non nullable([#186](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/186))
* Always generate request names from path([#204](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/204))
* [**BREAKING**]: Remove `use_path_for_request_names` build option([#204](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/204))

# 2.1.0-prerelease.6

* [**BREAKING**]: Added dollar signs to generated converter and mappings

# 2.1.0-prerelease.5

* Fixed border cases with parameters with duplicated names (for ex 'book' and 'book[]')([#212](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/212))
* Fixed cases when Parameters contains forbidden characters([#212](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/212))

# 2.1.0-prerelease.4

* Fixed cases with dashes in request named
* Fixed models from responses names generation
* Fixed type `YamlMap` is not a subtype of type `bool?` in type cast([#208](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/208))

# 2.1.0-prerelease.3

* [**BREAKING**]: `includeIfNull` now `bool?` value. Needs update of `build.yaml` if this feature used

# 2.1.0-prerelease.2

* Added support .json files instead .swagger (.swagger are supported too)([#201](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/201))
* Fixed errors when models has symbols, dots, numbers...([#202](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/202))

# 2.1.0-prerelease.1

* Fully refactored requests generator

# 2.0.8+1

* Fixed class Attribute / Request Param collision([#187](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/187))
* Fixed enum maps in swagger.g.dart are missing `enums.`([#188](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/188)) 

# 2.0.8

* Fix case when enum in model has name with underscores.
* Updated logo design

# 2.0.7+1

* Fixed case when request does not have type specified. Made it Object.([#190](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/190))

# 2.0.7

* Fixed models generator in cases of List of Lists of Lists of... of some type
* Formatted code

# 2.0.6+1

* Add support for swagger 3.0.1([#72](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/72))

# 2.0.6

* Generate objects from injected objects([#163](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/163))
* Updated logo design

# 2.0.5+2

* Fixed issue with list of enums in request parameter

# 2.0.5

* Added new generator_options

# 2.0.4

* Added equals override method to all Models

# 2.0.3

* Removed meta dependency

# 2.0.2

* Fixed meta version to 1.3.0

# 2.0.1

* Updated dependencies
* Added possibility to made postfix for models

# 2.0.0-nullsafety.9

* Removed ..RemoveWhere spike on generated models

# 2.0.0-nullsafety.8

* Fixed Incorrect generated param name([#168](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/168))
* Fixed unsupported generated import in client_mapping.dart([#167](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/167))

# 2.0.0-nullsafety.7+2

* Fixed critical error

# 2.0.0-nullsafety.7+1

* Made header default values not sensitive

# 2.0.0-nullsafety.7

* Added build option to set default values for headers

# 2.0.0-nullsafety.6

* Made all models parameter not required

# 2.0.0-nullsafety.5

* Fixed generation of Lists of Strings for models

# 2.0.0-nullsafety.4

* Fixed issues with null-safety

# 2.0.0-nullsafety.3+3

* Fixed analyser issues

# 2.0.0-nullsafety.3+2

* Updated documentation

# 2.0.0-nullsafety.3+1

* Updated dependencies

# 2.0.0-nullsafety.3

* Implemented generation of models from responses injected

# 2.0.0-nullsafety.2+1

* Improve documentation

# 2.0.0-nullsafety.2

* Made generated enums not nullable

# 2.0.0-nullsafety.1

* Removed nullable from fields with default values

# 2.0.0-nullsafety.0

* Added support for null safety

# 1.7.1

* Generate models for 201 HTTP Responses too

# 1.7.0

* Added support of requestBody field for POST requests

# 1.6.8

* Fixed issue with usage of KEY instead of NAME on defined parametets

# 1.6.7

* Fixed issue with basic types in array elements

# 1.6.6+2

* Added null-check for _formatDate method

# 1.6.6+1

* Removed dependency to intl
* Removed support of template of date
* Set date parsing to `yyyy-MM-dd`

# 1.6.6

* Added generation of custom date to json mapping.
* Added string build parameter with date format `date_formatter`

# 1.6.5+2

* Hotfix for body generation

# 1.6.5+1

* Hotfix of using meta

# 1.6.5

* Fix issue with requestBody parameter. It was not used, currently it adds 'body' parameter to requests

# 1.6.4

* Added support of default value per item for bool properties. For ex. `"name": bool`, default is `true`

# 1.6.3

* Fixed issue with `allOf` exception

# 1.6.2

* Fixed issue with datetime in refs

# 1.6.1

* Fixed issue with enums in definitions and Date time

# 1.6.0

* Added new build option use_inheritance to enable/disable inheritance support for v3
* Fixed issue with basic types (String, int...) used as definitions

# 1.5.1

* Added 'export file_name.swagger.enums.dart' to main generated file

# 1.5.0

* Fixed issue with pre-defined parameters on V3 version

# 1.4.9

* Fixed issue with Lists of enums in definitions
* Fixed issue with defined parameters on v2

# 1.4.8

* Introduced new flag to manage @required attribute of Headers

# 1.4.7

* Fixed problems with dash in file name([#102](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/102))

# 1.4.6

* Added generation of copyWith method for models

# 1.4.5

* Fixed problems with dash in file name([#99](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/99))
* [**BREAKING**]: Fixed enums naming. Enums with _ are replaced by PascalCase. For example, Response_type replaced by ResponseType.

# 1.4.4

* Fixed issue with `build_only_models` flag
* [**BREAKING**]: fix misspelling with `overridden` word. If you use it, please add additional `d`.

# 1.4.3

* Fixed error with ref in `allOf` and bool values in enums

# 1.4.2

* Fixed issue with adding responses to `JsonSerializableConverter` mapping

# 1.4.1

* Fixed issue with enum names in requests
* Fixed reusable Components - Parameters map

# 1.4.0

* Added support of int in request fields and models fields (Previously was only integer)

# 1.3.9

* Added ignoring of request parameters with empty IN parameter

# 1.3.8

* Added includeIfEmpty option to build options
* Added support of requestBody parameter (And enums as requestBody parameter)
* Fixed some minor bugs

# 1.3.7

* Fixed case when empty Enums generated from models

# 1.3.6

* Removed generation of empty Enums files

# 1.3.5

* Added new flag use_path_for_request_names. Read README to learn more about it
* Fixed commas in request parameters
* Fixed extends+ClassName structure for Swagger v3
* [**BREAKING**]:Removed `defaultValue` property for generated Lists of Enums

# 1.3.4

* Fixed not valid strings in FromJson method

# 1.3.3

* Added new property to build config named enums_case_sensitive

# 1.3.2

* Fixed issue when parsing List of Enums

# 1.3.0

# 1.3.1

* Code refactoring
* Removed swaggerGeneratedUnknown for Enums

# 1.3.0

* Remove code duplicates([#68](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/68))

# 1.2.2

* Fixed enums names

# 1.2.1

* Added sorting of imports and exports in alphabetical order

# 1.2.0

* Enums become being generated in separate file
* Fixed issues with big swagger files([#58](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/58))
* Fixed some bugs

## 1.1.0

* Fixed issues with Enums usage
* Fixed issues with enum naming name
* Fixed some bugs

## 1.0.10

* Fixed issue with enums in request bodies

## 1.0.9

* Implemented possibility to have enums in request body

## 1.0.8

* Fixed not standard request parameter Type names
* Added output message in case of formatting error

## 1.0.7

* Fixed a lot of issues with Enums in request parameters
* Changed naming approach for Enums in request parameters
* Fixed issue with key words in Enum/Model names

## 1.0.6

* Added support of `unknownEnumValue: MyClass.swaggerGeneratedUnknown`

## 1.0.5

* Added usage of auto formatting code

## 1.0.4

* Fixed build error on Example
* Removed empty lines in pubspec.yaml
* Added defined type to generated converters

## 1.0.3

* Remove unnecessary braces
* Fixed client_index.dart file

## 1.0.2

* Implemented inheritance support. Models can extend others.
* Fixed bug with build_only_models flag
* Added missing tests for models_generator

## 1.0.1

* Fixed bug with request parameter and result type, when schema.ref used
* Added real example of usage with Pet Store

## 1.0.0+2

* Fix score on pub.dev

## 1.0.0+1

* Add more info to readme
* Fix warnings
* Add code coverage(codecov)

## 1.0.0

* Initial release
