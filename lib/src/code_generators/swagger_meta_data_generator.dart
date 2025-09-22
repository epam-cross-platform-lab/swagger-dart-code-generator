import 'package:code_builder/code_builder.dart';
import 'package:swagger_dart_code_generator/src/code_generators/constants.dart';
import 'package:swagger_dart_code_generator/src/code_generators/swagger_generator_base.dart';
import 'package:swagger_dart_code_generator/src/models/generator_options.dart';

class SwaggerMetaDataGenerator extends SwaggerGeneratorBase {
  final GeneratorOptions _options;

  @override
  GeneratorOptions get options => _options;

  SwaggerMetaDataGenerator(this._options);

  String generate() {
    final swaggerMetaDataClass = _generateSwaggerMetaDataClass();
    return swaggerMetaDataClass.accept(DartEmitter()).toString();
  }

  Class _generateSwaggerMetaDataClass() {
    return Class(
      (c) => c
        ..name = kSwaggerMetaData
        ..docs.add(
            '/// Metadata class containing information from SwaggerRequest')
        ..constructors.add(
          Constructor(
            (constructor) => constructor
              ..constant = true
              ..optionalParameters.addAll([
                Parameter(
                  (p) => p
                    ..name = 'summary'
                    ..required = true
                    ..named = true
                    ..toThis = true,
                ),
                Parameter(
                  (p) => p
                    ..name = 'description'
                    ..required = true
                    ..named = true
                    ..toThis = true,
                ),
                Parameter(
                  (p) => p
                    ..name = 'operationId'
                    ..required = true
                    ..named = true
                    ..toThis = true,
                ),
                Parameter(
                  (p) => p
                    ..name = 'consumes'
                    ..required = true
                    ..named = true
                    ..toThis = true,
                ),
                Parameter(
                  (p) => p
                    ..name = 'produces'
                    ..required = true
                    ..named = true
                    ..toThis = true,
                ),
                Parameter(
                  (p) => p
                    ..name = 'security'
                    ..required = true
                    ..named = true
                    ..toThis = true,
                ),
                Parameter(
                  (p) => p
                    ..name = 'tags'
                    ..required = true
                    ..named = true
                    ..toThis = true,
                ),
                Parameter(
                  (p) => p
                    ..name = 'deprecated'
                    ..required = true
                    ..named = true
                    ..toThis = true,
                ),
              ]),
          ),
        )
        ..fields.addAll([
          Field(
            (f) => f
              ..name = 'summary'
              ..type = Reference('String')
              ..modifier = FieldModifier.final$,
          ),
          Field(
            (f) => f
              ..name = 'description'
              ..type = Reference('String')
              ..modifier = FieldModifier.final$,
          ),
          Field(
            (f) => f
              ..name = 'operationId'
              ..type = Reference('String')
              ..modifier = FieldModifier.final$,
          ),
          Field(
            (f) => f
              ..name = 'consumes'
              ..type = Reference('List<String>')
              ..modifier = FieldModifier.final$,
          ),
          Field(
            (f) => f
              ..name = 'produces'
              ..type = Reference('List<String>')
              ..modifier = FieldModifier.final$,
          ),
          Field(
            (f) => f
              ..name = 'security'
              ..type = Reference('List<String>')
              ..modifier = FieldModifier.final$,
          ),
          Field(
            (f) => f
              ..name = 'tags'
              ..type = Reference('List<String>')
              ..modifier = FieldModifier.final$,
          ),
          Field(
            (f) => f
              ..name = 'deprecated'
              ..type = Reference('bool')
              ..modifier = FieldModifier.final$,
          ),
        ]),
    );
  }
}
