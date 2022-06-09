import 'package:code_builder/code_builder.dart';
import 'package:swagger_dart_code_generator/src/code_generators/swagger_generator_base.dart';
import 'package:swagger_dart_code_generator/src/extensions/file_name_extensions.dart';
import 'package:swagger_dart_code_generator/src/extensions/string_extension.dart';
import 'package:swagger_dart_code_generator/src/models/generator_options.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/swagger_root.dart';

import 'constants.dart';

class SwaggerSocketsServiceGenerator extends SwaggerGeneratorBase {
  final GeneratorOptions _options;

  SwaggerSocketsServiceGenerator(this._options);

  @override
  GeneratorOptions get options => _options;

  String generate(SwaggerRoot root, String fileName) {
    final fileImports = _generateImports(fileName);

    final socketsServiceClass = _generateClass(root, fileName);

    return '''
$fileImports

${socketsServiceClass.accept(DartEmitter()).toString()}
    ''';
  }

  Class _generateClass(SwaggerRoot swaggerRoot, String fileName) {
    final className = '${getClassNameFromFileName(fileName)}SocketsService';

    final constructorBody = _getConstructorBody(className);
    final namedConstructorBody = _getNamedConstructorBody();

    final allServiceMethods = _getServiceMethods();

    return Class((c) => c
      ..name = className
      ..docs.add(kServiceHeader)
      ..constructors.add(Constructor(
        (c) => c
          ..factory = true
          ..body = Code(constructorBody),
      ))
      ..constructors.add(Constructor(
        (c) => c
          ..body = Code(namedConstructorBody)
          ..name = 'create'
          ..requiredParameters.add(Parameter(
            (p) => p
              ..name = '_socket'
              ..toThis = true,
          )),
      ))
      ..fields.add(Field(
        (f) => f
          ..name = '_host'
          ..modifier = FieldModifier.final$
          ..static = true
          ..assignment = Code("'ws://${swaggerRoot.host}/'"),
      ))
      ..fields.add(Field(
        (f) => f
          ..type = Reference('WebSocketChannel')
          ..name = '_socket'
          ..modifier = FieldModifier.final$,
      ))
      ..fields.add(Field(
        (f) => f
          ..type = Reference('\$CustomJsonDecoder')
          ..name = '_decoder'
          ..modifier = FieldModifier.final$
          ..assignment = Code('\$CustomJsonDecoder(generatedMapping)'),
      ))
      ..fields.add(Field(
        (f) => f
          ..type = Reference('Map<String, Completer<Object>>')
          ..name = '_requests'
          ..modifier = FieldModifier.final$
          ..assignment = Code('{}'),
      ))
      ..methods.addAll([...allServiceMethods]..join('\n')));
  }

  List<Method> _getServiceMethods() {
    final serviceMethods = <Method>[];
    serviceMethods
      ..add(Method(
        (m) => m
          ..name = 'send'.asDoubleGeneric()
          ..returns = Reference(kFutureGeneric)
          ..docs.add('\n')
          ..requiredParameters.add(Parameter(
            (p) => p
              ..type = Reference('String')
              ..name = 'path',
          ))
          ..optionalParameters.add(Parameter(
            (p) => p
              ..type = Reference('V?')
              ..name = 'data',
          ))
          ..body = Code(_getSendMethodBody()),
      ))
      ..add(Method(
        (m) => m
          ..name = '_decodeValue<T>'
          ..returns = Reference('T')
          ..docs.add('\n')
          ..requiredParameters.add(
            Parameter(
              (p) => p
                ..type = Reference('dynamic')
                ..name = 'input',
            ),
          )
          ..body = Code('return _decoder.decode<T>(input) as T;'),
      ));
    // ..add(Method((m) => m));
    return serviceMethods;
  }

  String _getConstructorBody(String className) {
    return '''
final _socket = WebSocketChannel.connect(Uri.parse(_host));
return $className.create(_socket);
    ''';
  }

  String _getNamedConstructorBody() {
    return '''
_socket.stream.listen((_){});
    ''';
  }

  String _getSendMethodBody() {
    return '''
final id = '\$path\$data'.hashCode.toString();

if (_requests.containsKey(id)) {
  return _requests[id]!.future.then(_decodeValue<T>);
}

final _params = data != null ? jsonEncode(data) : '{}';
final input = '{ "id": "\$id", "payload": \$_params }';

_requests[id] = Completer();
_socket.sink.add('\$path:\$input');

return _requests[id]!.future.then(_decodeValue<T>); 
    ''';
  }

  String _generateImports(String fileName) {
    return '''
// ignore_for_file: type=lint    
    
import 'dart:async';
import 'dart:convert';

import 'package:web_socket_channel/web_socket_channel.dart';

import '$fileName.swagger.dart';
import 'client_mapping.dart';

    ''';
  }
}
