# hello

A new Flutter package project.

## Getting Started

This project is a starting point for a Dart
[package](https://flutter.dev/developing-packages/),
a library module containing code that can be shared easily across
multiple Flutter or Dart projects.

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.

## **Configuration**
Swagger generator offers some configuration options to generate code. All options should be included on `build.yaml` file on the root of the project:
```yaml
targets:
  $default:
    builders:
      swagger_generator:
        options:
          # custom configuration options!
```

| Option | Default value | Description |
| - | - | - |
| `with_base_url` | `true` | If this option is false, generator will ignore base url in swagger file. |
| `with_converter` | `true` | If option is true, combination of all mappings will be generated. |
| `ignoreHeaders` | `false` | If option is true, headers will not be generated. |
| `useDefaultNullForLists` | `false` | If option is true, default value for lists will be null, otherwice - [] |
| `buildOnlyModels` | `false` | If option is true, chopper classes will not be generated. |
| `defaultValuesMap` | `[]` | Contains map of types and theirs default values. See [DefaultValueMap](#default-value-map). |
| `responseOverrideValueMap` | `[]` | Contains map of responses and theirs overriden values. See [ResponseOverrideValueMap](#response-override-map). |
| `inputFolder` | `null` | Path to folder with .swagger files (for ex. swagger_examples, or lib/swaggers). |
| `outputFolder` | `null` | Path to output folder (for ex. lib/generated). |

It's important to remember that, by default, [build](https://github.com/dart-lang/build) will follow [Dart's package layout conventions](https://dart.dev/tools/pub/package-layout), meaning that only some folders will be considered to parse the input files. So, if you want to reference files from a folder other than `lib/`, make sure you've included it on `sources`:
```yaml
targets:
  $default:
    sources:
      - lib/**
      - swagger_examples/**
      - swaggers/**
```

### **Default Value Map**

If you want to add defaultValue: attribute to fields with concrete type you can use default value map.

```yaml
targets:
  $default:
    builders:
      swagger_generator:
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
