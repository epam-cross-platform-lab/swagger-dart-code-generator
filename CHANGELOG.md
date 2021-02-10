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
