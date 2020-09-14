<p align="center">
<img src="https://raw.githubusercontent.com/epam-cross-platform-lab/swagger-dart-code-generator/master/assets/lib_full_logo.png" height="100" alt="Bloc" />
</p>

# :mega: **Build dart types from Swagger/OpenAPI schemas**

[![pub package](https://img.shields.io/pub/v/swagger_dart_code_generator.svg)](https://pub.dartlang.org/packages/swagger_dart_code_generator)
![Coverage](https://raw.githubusercontent.com/epam-cross-platform-lab/swagger-dart-code-generator/master/coverage_badge.svg?sanitize=true)
<a href="https://discord.gg/fmkN37"><img src="https://img.shields.io/discord/755005482405462017.svg?logo=discord&color=blue" alt="Discord"></a>
[![codecov](https://codecov.io/gh/epam-cross-platform-lab/swagger-dart-code-generator/branch/master/graph/badge.svg)](https://codecov.io/gh/epam-cross-platform-lab/swagger-dart-code-generator)

SwaggerDartCodeGenerator is a code generator that looks for `*.swagger` files and builds `.swagger.dart` files, based on the schema. Codegenration based on Chopper and JsonAnnotation models and can be configured for your needs.

---
## **Installation**
Add the following to your `pubspec.yaml` file to be able to do code generation:
```yaml
dev_dependencies:
  chopper_generator: ^3.0.5
  json_annotation: ^3.0.1
  json_serializable: ^3.4.1
  swagger_dart_code_generator: any
```
The generated code uses the following packages in run-time:
```yaml
dependencies:
  chopper: ^3.0.3
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

| Option | Default value | Description |
| - | - | - |
| `with_base_url` | `true` | If this option is false, generator will ignore base url in swagger file. |
| `with_converter` | `true` | If option is true, combination of all mappings will be generated. |
| `ignore_headers` | `false` | If option is true, headers will not be generated. |
| `use_default_null_for_lists` | `false` | If option is true, default value for lists will be null, otherwice - [] |
| `build_only_models` | `false` | If option is true, chopper classes will not be generated. |
| `default_values_map` | `[]` | Contains map of types and theirs default values. See [DefaultValueMap](#default-value-map). |
| `response_override_value_map` | `[]` | Contains map of responses and theirs overriden values. See [ResponseOverrideValueMap](#response-override-value-map). |
| `input_folder` | `null` | Path to folder with .swagger files (for ex. swagger_examples, or lib/swaggers). |
| `output_folder` | `null` | Path to output folder (for ex. lib/generated). |

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
              default_value: 'defaut'
            - type_name: 'List<String>'
              default_value: '[]'
```

### **Response Override Value Map for request generation**

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
              overriden_value: 'List<dynamic>'
              - url: '/news/latest'
              method: put
              overriden_value: 'MyPerfectType'
```

Check the [examples](./example) to see how to use it in details.
