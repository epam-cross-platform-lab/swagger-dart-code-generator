<p align="center">
<img src="https://raw.githubusercontent.com/epam-cross-platform-lab/swagger-dart-code-generator/master/assets/lib_full_logo.png" height="100" alt="Swagger dart code generator" />
</p>

# :mega: **Build dart types from Swagger/OpenAPI schemas**

[![pub package](https://img.shields.io/pub/v/swagger_dart_code_generator.svg)](https://pub.dartlang.org/packages/swagger_dart_code_generator)
![GitHub issues](https://img.shields.io/github/issues-raw/epam-cross-platform-lab/swagger-dart-code-generator?style=flat-square)
![GitHub last commit](https://img.shields.io/github/last-commit/epam-cross-platform-lab/swagger-dart-code-generator?style=flat-square)
<a href="https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/actions"><img src="https://img.shields.io/github/workflow/status/epam-cross-platform-lab/swagger-dart-code-generator/CI%20for%20master%20branch/master" alt="build"></a>
<a href="https://discord.gg/Z6btby6b"><img src="https://img.shields.io/discord/755005482405462017.svg?logo=discord&color=blue" alt="Discord"></a>
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
  chopper: ^4.0.1
  json_annotation: ^4.4.0
```

Add the following to your `pubspec.yaml` file to be able to do code generation:
```yaml
dev_dependencies:
  build_runner: ^2.1.7
  chopper_generator: ^4.0.5
  json_serializable: ^6.1.4
  swagger_dart_code_generator: ^2.4.6
```

Then run:
```shell
pub packages get
```
or
```shell
flutter packages get
```

Now SwaggerGenerator will generate the API files for you by running:
```shell
pub run build_runner build
```
or
```shell
flutter pub run build_runner build
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
| `with_base_url` | `true` | `false` | If this option is false, generator will ignore base url in swagger file. |
| `use_required_attribute_for_headers` | `true` | `false` | If this option is false, generator will not add @required attribute to headers. |
| `with_converter` | `true` | `false` | If option is true, combination of all mappings will be generated. |
| `ignore_headers` | `false` | `false` | If option is true, headers will not be generated. |
| `enums_case_sensitive` | `true` | `false` | If value is false, 'enumValue' will be defined like Enum.enumValue even it's json key equals 'ENUMVALUE' |
| `include_paths` | `[]` | `false` | List<String> of Regex If not empty - includes only paths matching reges |
| `exclude_paths` | `[]` | `false` | List<String> of Regex If not empty -exclude paths matching reges |
| `use_default_null_for_lists` | `false` | `false` | If option is true, default value for lists will be null, otherwise - [] |
| `build_only_models` | `false` | `false` | If option is true, chopper classes will not be generated. |
| `separate_models` | `false` | `false` | If option true, generates models into separate file. |
| `include_if_null` | `null` | `false` | Sets includeIfNull JsonAnnotation feature and sets value for it. If null - not set anything. |
| `default_values_map` | `[]` | `false` | Contains map of types and theirs default values. See [DefaultValueMap](#default-value-map-for-model-generation). |
| `response_override_value_map` | `[]` | `false` | Contains map of responses and theirs overridden values. See [ResponseOverrideValueMap](#response-override-value-map-for-requests-generation). |
| `cut_from_model_names` | `-` | `false` | If your model names are long and contain a lot of duplicated words, for example `DbUsersModelsV3GeneralUserModel`, you can cut off duplicated part, using `cut_from_model_names : DbUsersModelsV3`. Also, you can use regex expressions in this parameter. |


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
