<p align="center">
<img src="https://raw.githubusercontent.com/epam-cross-platform-lab/swagger-dart-code-generator/master/assets/lib_full_logo.png" height="100" alt="Swagger dart code generator" />
</p>

# :mega: **Build dart types from Swagger/OpenAPI schemas** :mega:

[![pub package](https://img.shields.io/pub/v/swagger_dart_code_generator.svg)](https://pub.dartlang.org/packages/swagger_dart_code_generator)
![GitHub issues](https://img.shields.io/github/issues-raw/epam-cross-platform-lab/swagger-dart-code-generator?style=flat-square)
![GitHub last commit](https://img.shields.io/github/last-commit/epam-cross-platform-lab/swagger-dart-code-generator?style=flat-square)
<a href="https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/actions"><img src="https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/actions/workflows/master.yml/badge.svg" alt="build"></a>
[![codecov](https://codecov.io/gh/epam-cross-platform-lab/swagger-dart-code-generator/branch/master/graph/badge.svg)](https://codecov.io/gh/epam-cross-platform-lab/swagger-dart-code-generator)
<a href="https://github.com/epam-cross-platform-lab/swagger-dart-code-generator"><img src="https://img.shields.io/github/stars/epam-cross-platform-lab/swagger-dart-code-generator?style=social" alt="Discord"></a>

SwaggerDartCodeGenerator is a code generator that looks for `*.swagger` files and builds `.swagger.dart` files, based on the schema. Code generation based on Chopper and JsonAnnotation models and can be configured for your needs.

---

## **Overview**
In general case for each .swagger file three outputs will be created. </br>
<b>.dart</b> generated by <b>Swagger dart code generator</b>, contains all models, requests, converters, etc.</br>
[Since v1.2.0] <b>.enums.dart</b> generated by <b>Swagger dart code generator</b>, contains all enums and enums mappings.</br>
<b>.chopper.dart</b> - generated by <a href="https://pub.dev/packages/chopper">chopper</a>.</br>
<b>.g.dart</b> - generated by <a href="https://pub.dev/packages/json_serializable">json_serializable</a>.</br>

<img src="https://raw.githubusercontent.com/epam-cross-platform-lab/swagger-dart-code-generator/master/assets/overview_image.png" width="320" alt="Bloc" />

## **Installation**
The generated code uses the following packages in run-time:
```yaml
dependencies:
  chopper: ^6.1.1
  json_annotation: ^4.8.0
```

Add the following to your `pubspec.yaml` file to be able to do code generation:
```yaml
dev_dependencies:
  build_runner: ^2.3.3
  chopper_generator: ^6.0.0
  json_serializable: ^6.6.1
  swagger_dart_code_generator: ^2.10.4
```

Then run:
```shell
dart pub get
```
or
```shell
flutter pub get
```

Now SwaggerGenerator will generate the API files for you by running:
```shell
dart run build_runner build
```

## **Configuration**
Swagger generator offers some configuration options to generate code. All options should be included on `build.yaml` file on the root of the project:

```yaml
targets:
  $default:
    builders:
      swagger_dart_code_generator:
        options:
          # custom configuration options!
```

| Option |Default value | Is required | Description |
| - | - | - | - |
| **`input_folder`** | **`-`** | **`true`** | **Path to folder with .swagger files (for ex. swagger_examples, or lib/swaggers).** |
| **`output_folder`** | **`-`** | **`true`** | **Path to output folder (for ex. lib/generated).** |
| `input_urls` | `[]` | `false` | Here you can mention list of files to be downloaded from the internet. You can check [example](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/blob/master/example/build.yaml) of usage. |
| `with_base_url` | `true` | `false` | If this option is false, generator will ignore base url in swagger file. |
| `use_required_attribute_for_headers` | `true` | `false` | If this option is false, generator will not add @required attribute to headers. |
| `with_converter` | `true` | `false` | If option is true, combination of all mappings will be generated. |
| `ignore_headers` | `false` | `false` | If option is true, headers will not be generated. |
| `additional_headers` | `false` | `false` | List of additional headers, not specified in Swagger. Example of usage: [build.yaml](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/blob/master/example/build.yaml)
| `enums_case_sensitive` | `true` | `false` | If value is false, 'enumValue' will be defined like Enum.enumValue even it's json key equals 'ENUMVALUE' |
| `include_paths` | `[]` | `false` | List<String> of Regex If not empty - includes only paths matching reges |
| `exclude_paths` | `[]` | `false` | List<String> of Regex If not empty -exclude paths matching reges |
| `classes_with_nullabe_lists` | [] | `false` | List of regex strings. If class name matches any of regex - list properties will have default value `null`. Otherwise it will be empty list. If you used `use_default_null_for_lists: true`, just set `.*` value for this property and result will be same.  Check [example](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/blob/master/example/build.yaml) for more details |
| `build_only_models` | `false` | `false` | If option is true, chopper classes will not be generated. |
| `separate_models` | `false` | `false` | If option true, generates models into separate file. |
| `include_if_null` | `null` | `false` | Sets includeIfNull JsonAnnotation feature and sets value for it. If null - not set anything. |
| `default_values_map` | `[]` | `false` | Contains map of types and theirs default values. See [DefaultValueMap](#default-value-map-for-model-generation). |
| `response_override_value_map` | `[]` | `false` | Contains map of responses and theirs overridden values. See [ResponseOverrideValueMap](#response-override-value-map-for-requests-generation). |
| `cut_from_model_names` | `-` | `false` | If your model names are long and contain a lot of duplicated words, for example `DbUsersModelsV3GeneralUserModel`, you can cut off duplicated part, using `cut_from_model_names : DbUsersModelsV3`. Also, you can use regex expressions in this parameter. |
| `nullable_models` | `-` | `false` | List of model names should have force-nullable properties. Example of usage in [build.yaml](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/blob/master/example/build.yaml). |
| `override_equals_and_hashcode` | `-` | `true` | If need to decrease app size - you can disable generation of `hashcode` and `Equals` method. |
| `overriden_models` | `-` | `false` | List of manually written models that will replace the generated one. Can be different for each file. See example [here](#overriden-models-implementation) |
| `use_path_for_request_names` | `true` | `false` | Can be false only if all requests has unique `operationId`. It gives readable names for requests. |
| `add_base_path_to_requests` | `false` | `false` | Add swagger base path to all request path. |
| `multipart_file_type` | `List<int>` | `false` | Allow to override the generated class for multipart file (See #605). |
| `override_to_string` | `bool` | `true` | Overrides `toString()` method using `jsonEncode(this)` |
| `generate_first_succeed_response` | `true` | `false` | If request has multiple success responses, first one will be generated. Otherwice - `dynamic` |
| `multipart_file_type` | `List<int>` | `false` | Type if input parameter of Multipart request |



It's important to remember that, by default, [build](https://github.com/dart-lang/build) will follow [Dart's package layout conventions](https://dart.dev/tools/pub/package-layout), meaning that only some folders will be considered to parse the input files. So, if you want to reference files from a folder other than `lib/`, make sure you've included it on `sources`:

```yaml
targets:
  $default:
    sources:
      - lib/**
      - swagger_examples/**
      - swaggers/**
```

### **Default Value Map for model generation**

If you want to add defaultValue: attribute to fields with concrete type you can use default value map. Please see next example:

```yaml
targets:
  $default:
    builders:
      swagger_dart_code_generator:
        options:
          input_folder: 'lib/swaggers'
          output_folder: 'lib/generated_code/'
          default_values_map:
            - type_name: int
              default_value: '36'
            - type_name: String
              default_value: 'default'
            - type_name: 'List<String>'
              default_value: '[]'
          exclude_paths:
            - '\/cars\/get'
          include_paths:
            - '\/popular\/cars'
```

### **Overriden Models Implementation**

```yaml
      swagger_dart_code_generator:
        options:
          input_folder: "input_folder/"
          output_folder: "lib/swagger_generated_code/"
          overriden_models:
            - file_name: "pet_service_json"
              import_url: "../overriden_models.dart"
              overriden_models:
                - "Pet"
                - "Order"
            - file_name: "pet_service_swagger"
              import_url: "../overriden_models_another.dart"
              overriden_models:
                - "Result"
```

### **Response Override Value Map for requests generation**

If you want to override response for concrete request, you can use response_override_value_map. For example:

```yaml
targets:
  $default:
    builders:
      swagger_dart_code_generator:
        options:
          input_folder: 'lib/swaggers'
          output_folder: 'lib/generated_code/'
          response_override_value_map:
            - url: '/store/inventory'
              method: get
              overridden_value: 'List<dynamic>'
            - url: '/news/latest'
              method: put
              overridden_value: 'MyPerfectType'
```

Check the [examples](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/tree/master/example) to see how to use it in details.
