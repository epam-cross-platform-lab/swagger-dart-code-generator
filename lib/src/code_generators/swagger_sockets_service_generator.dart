import 'package:code_builder/code_builder.dart';
import 'package:swagger_dart_code_generator/src/code_generators/swagger_generator_base.dart';
import 'package:swagger_dart_code_generator/src/extensions/string_extension.dart';
import 'package:swagger_dart_code_generator/src/models/generator_options.dart';
import 'package:swagger_dart_code_generator/src/swagger_models/swagger_root.dart';

import 'constants.dart';

class SwaggerSocketsServiceGenerator extends SwaggerGeneratorBase {
  final GeneratorOptions _options;

  SwaggerSocketsServiceGenerator(this._options);

  @override
  GeneratorOptions get options => _options;

  String generate(SwaggerRoot root) {
    final fileImports = _generateImports();

    final socketsServiceClass = _generateClass(root);

    final customDecoder = _getCustomJsonDecoder();

    return '''
$fileImports

${socketsServiceClass.accept(DartEmitter()).toString()}

$customDecoder
    ''';
  }

  Class _generateClass(SwaggerRoot swaggerRoot) {
    final className = 'SocketsService';

    final factoryConstructorBody = _getFactoryConstructorBody(className);
    final allServiceMethods = _getServiceMethods();

    return Class((c) => c
      ..name = className
      ..docs.add(kServiceHeader)
      ..constructors.add(Constructor(
        (c) => c
          ..factory = true
          ..body = Code(factoryConstructorBody)
          ..optionalParameters.add(Parameter(
            (p) => p
              ..name = 'socket'
              ..named = true
              ..required = true
              ..type = Reference('WebSocketChannel'),
          ))
          ..optionalParameters.add(Parameter(
            (p) => p
              ..name = 'decoder'
              ..named = true
              ..type = Reference('\$SocketsJsonDecoder?'),
          ))
          ..optionalParameters.add(Parameter(
            (p) => p
              ..name = 'interceptors'
              ..named = true
              ..type = Reference('Iterable<dynamic>?'),
          )),
      ))
      ..constructors.add(Constructor(
        (c) => c
          ..body = Code(
            '_socket.stream.listen(_handleResponse, onError: _handleConnectionError);',
          )
          ..name = 'create'
          ..requiredParameters.add(Parameter(
            (p) => p
              ..name = '_socket'
              ..toThis = true,
          ))
          ..requiredParameters.add(Parameter(
            (p) => p
              ..name = '_decoder'
              ..toThis = true,
          ))
          ..requiredParameters.add(Parameter(
            (p) => p
              ..name = '_interceptors'
              ..toThis = true,
          )),
      ))
      ..fields.add(Field(
        (f) => f
          ..type = Reference('WebSocketChannel')
          ..name = '_socket'
          ..modifier = FieldModifier.final$,
      ))
      ..fields.add(Field(
        (f) => f
          ..type = Reference('\$SocketsJsonDecoder')
          ..name = '_decoder'
          ..modifier = FieldModifier.final$,
      ))
      ..fields.add(Field(
        (f) => f
          ..name = '_interceptors'
          ..type = Reference('Iterable<dynamic>')
          ..modifier = FieldModifier.final$,
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
          ..name = '_handleConnectionError'
          ..returns = Reference('void')
          ..docs.add('\n')
          ..requiredParameters.addAll([
            Parameter(
              (p) => p
                ..type = Reference('String')
                ..name = 'id',
            ),
            Parameter(
              (p) => p
                ..type = Reference('StackTrace')
                ..name = 'stacktrace',
            ),
          ])
          ..body = Code(
            "print('Could not connect to \$_socket : \$stacktrace');",
          ),
      ))
      ..add(Method(
        (m) => m
          ..name = '_handleResponse'
          ..returns = Reference('void')
          ..docs.add('\n')
          ..requiredParameters.add(
            Parameter(
              (p) => p
                ..type = Reference('dynamic')
                ..name = 'data',
            ),
          )
          ..body = Code(''),
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
      ))
      ..add(Method(
        (m) => m
          ..name = 'close'
          ..returns = Reference('void')
          ..docs.add('\n')
          ..body = Code('_socket.sink.close();'),
      ));
    // ..add(Method((m) => m));
    return serviceMethods;
  }

  String _getFactoryConstructorBody(String className) {
    return '''
final _decoder = decoder ?? _CustomJsonDecoder(generatedMapping);
final _interceptors = interceptors ?? [];  
return $className.create(socket, _decoder, _interceptors);    
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

  String _generateImports() {
    return '''
// ignore_for_file: type=lint    
    
import 'dart:async';
import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'client_mapping.dart';

    ''';
  }

  String _getCustomJsonDecoder() {
    return '''
abstract class \$SocketsJsonDecoder {
  dynamic decode<T>(dynamic entity);
}  
    
typedef \$JsonFactory<T> = T Function(Map<String, dynamic> json);    
    
class _CustomJsonDecoder implements \$SocketsJsonDecoder {
  _CustomJsonDecoder(this.factories);

  final Map<Type, \$JsonFactory> factories;

  dynamic decode<T>(dynamic entity) {

    if (entity is Iterable) {
      return _decodeList<T>(entity);
    }

    if (entity is T) {
      return entity;
    }

    if (isTypeOf<T, Map>()) {
      return entity;
    }

     if(isTypeOf<T, Iterable>()) {
      return entity;
    }

    if (entity is Map<String, dynamic>) {
      return _decodeMap<T>(entity);
    }

    return entity;
  }

  T _decodeMap<T>(Map<String, dynamic> values) {
    final jsonFactory = factories[T];
    if (jsonFactory == null || jsonFactory is! \$JsonFactory<T>) {
      return throw "Could not find factory for type \$T. Is '\$T: \$T.fromJsonFactory' included in the CustomJsonDecoder instance creation in bootstrapper.dart?";
    }

    return jsonFactory(values);
  }

  List<T> _decodeList<T>(Iterable values) =>
      values.where((v) => v != null).map<T>((v) => decode<T>(v) as T).toList();
}    
    ''';
  }
}
