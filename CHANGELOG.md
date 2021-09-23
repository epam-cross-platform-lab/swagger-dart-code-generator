# 2.1.3+2

* Fixed Issue ([#245](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/245))
* Fixed ability to set exclude_path and include_path

# 2.1.3+1

* Fixed Issue ([#248](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/248))
* Fix cases when responses was named like numbers

# 2.1.3

* Fixed cases when swagger has not put post get requests
* Added validation for requests names generation

# 2.1.2

* Updated packages json_serializable, json_annotation, build_runner

# 2.1.1+4

* Fix for default value for named parameters

# 2.1.1+3

* Fixed Issue ([#240](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/240))
* Fixed Issue ([#211](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/211))
* Fixed cases when parameters named by keywords, for example In, For, Class etx
* Added generation of parameters from, path (not only from requests)

# 2.1.1+2

* Fixed issues when content has no application/json child

# 2.1.1+1

* Fixed Issue ([#235](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/235))
* Fixed cases when field number 'number' generated as $num
* Fixed cases when field 'num' generated ad 'num' (basic dart type)

# 2.1.1

* Stabilized generator
* Fixed issue when parameters named like int, double etc.
* Fixed Issue ([#108](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/108))

# 2.1.0-prerelease.9

* Fixed Issue ([#228](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/228))
* Fixed Issue ([#206](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/206))
* Fixed cases when file names like some_file.extension.swagger.json.dart.json
* Removed generation of converter when build_only_models is true


# 2.1.0-prerelease.8

* Fixed Issue ([#221](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/221))
* Added generation of int get hashCode
* Added example

# 2.1.0-prerelease.7

* Fixed Issue ([#186](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/186))
* Fixed Issue ([#204](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/204))

# 2.1.0-prerelease.6

* **BREAKING**: Added dollar signs to generated converter and mappings

# 2.1.0-prerelease.5

* Fixed Issue ([#212](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/212))
* Fixed border cases with parameters with duplicated names (for ex 'book' and 'book[]')
* Fixed cases when Parameters contains forbidden characters

# 2.1.0-prerelease.4

* Fixed Issue ([#208](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/208))
* Fixed cases with dashes in request named
* Fixed models from responses names generation

# 2.1.0-prerelease.3

* **BREAKING**: includeIfNull now just bool? value. Needs update of build.yaml if this feature used

# 2.1.0-prerelease.2

* Fixed Issue ([#201](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/201))

* Fixed Issue ([#202](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/202))

* Added support .json files instead .swagger (.swagger are supported too)

* Fixed errors when models has symbols, dots, numbers...


# 2.1.0-prerelease.1

* Fully refactored requests generator

# 2.0.8+1

* Fixed Issue ([#187](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/187)) It's about request parameters named "client"

* Fixed Issue ([#188](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/188)) It's about isses with enum names generation.

# 2.0.8

* Fix case when enum in model has name with underscores.
* Updated logo design

# 2.0.7+1

* Fixed Issue ([#190](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/190))
* Fixed case when request does not have type specified. Made it Object.

# 2.0.7

* Fixed models generator in cases of List of Lists of Lists of... of some type
* Formatted code

# 2.0.6+1

* Fixed Issue ([#72](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/72))

# 2.0.6

* Fixed Issue ([#163](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/163))
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

* Fixed Issues #167 and #168

# 2.0.0-nullsafety.7+2

* Fixed critical error

# 2.0.0-nullsafety.7+1

* Made header default values not sensative

# 2.0.0-nullsafety.7

* Added build option to set default values for headers

# 2.0.0-nullsafety.6

* Made ALL models parameter not required

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
* Setted Date parsing to yyyy-MM-dd

# 1.6.6

* Added generation of custom Date to json mapping.
* Added build parameter with Date format date_formatter (String)

# 1.6.5+2

* Hotfix for body generation

# 1.6.5+1

* Hotfix of using meta

# 1.6.5

* Fix issue with requestBody parameter. It was not used, currently it adds 'body' parameter to requests

# 1.6.4

* Added support of default value per item for bool properties. For ex. "name": bool, "defalut": true => defaultValue: true

# 1.6.3

* Fixed issue with allOf exception

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

* Fixed Issue ([#102](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/102))

# 1.4.6

* Added generation of copyWith method for models

# 1.4.5

* Fixed Issue ([#99](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/99))
* **BREAKING**: Fixed enums naming. Enums with _ are replaced by PascalCase. For example, Response_type replaced by ResponseType.

# 1.4.4

* Fixed issue with build_only_models flag
* **BREAKING**: fix misspelling with `overridden` word. If you use it, please add additional `d`.

# 1.4.3

* Fixed error with ref in allOf and bool values in enums

# 1.4.2

* Fixed issue with adding responses to JsonSerializableConverter mapping

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

* Fixed commas in request parameters
* Removed defaultValue property for generated Lists of Enums
* Added new flag use_path_for_request_names. Read README to learn more about it
* Fixed extends+ClassName structure for Swagger v3

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

* Fixed Issue ([#68](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/68))

# 1.2.2

* Fixed enums names

# 1.2.1

* Added sorting of imports and exports in alphabetical order

# 1.2.0

* Enums become being generated in separate file
* Fixed Issue ([#58](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/58))
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

* Added support of unknownEnumValue: MyClass.swaggerGeneratedUnknown

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

* First release
