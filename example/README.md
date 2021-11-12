# swagger_dart_code_generator

Please check real [example](https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/tree/master/example)

## Getting Started

### Step1
Put your .swagger or .json files to any folder. Example below.

```
PROJECT_ROOT/swaggers/cars_api_service.json
PROJECT_ROOT/swaggers/movies_api_service.swagger
```

### Step 2
Add input folder and output folder to **build.yaml**. Also set sources field.

```
targets:
  $default:
    sources:     
      - swaggers/**
      - lib/**
    builders:
      chopper_generator:
        options:
          header: "//Generated code"
      swagger_dart_code_generator:
        options:
          input_folder: "lib/"
          output_folder: "lib/swagger_generated_code/"
```

### Step 4
Set optional build parameters if it's needed.

```
separate_models: true
ignore_headers: true
exclude_paths:
  - "/items/{id}"
```

### Step 5
Run build command


```
flutter pub run build_runner build --delete-conflicting-outputs
```

### Final step
Enjoy generated code!
