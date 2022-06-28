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

    final socketsServiceClass = _generateClass();

    final socketsParser = _getSocketServiceParser();

    final customDecoder = _getCustomJsonDecoder();

    final serviceMessage = _generateServiceMessage();

    return '''  
$fileImports

${socketsServiceClass.accept(DartEmitter()).toString()}

$customDecoder

$socketsParser

${serviceMessage.accept(DartEmitter()).toString()}
    ''';
  }

  Class _generateClass() {
    final className = 'SocketsService';

    final factoryConstructorBody = _getFactoryConstructorBody(className);
    final allServiceMethods = _getServiceMethods();

    return Class((c) => c
      ..name = className
      ..docs.add(kServiceHeader)
      ..constructors.add(Constructor((c) => c
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
        ))))
      ..constructors.add(Constructor(
        (c) => c
          ..body = Code(
            '_socket.stream.listen(handleResponse, onError: handleConnectionError);',
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
          ..type = Reference('Map<String, Completer<Object>>')
          ..name = '_requests'
          ..modifier = FieldModifier.final$
          ..assignment = Code('{}'),
      ))
      ..methods.addAll([...allServiceMethods]..join('\n')));
  }

  Class _generateServiceMessage() {
    return Class(
      (c) => c
        ..name = 'SocketsServiceMessage'
        ..annotations.add(refer(kFreezed))
        ..mixins.add(Reference('_\$SocketsServiceMessage'))
        ..constructors.addAll([
          Constructor(
            (c) => c
              ..factory = true
              ..constant = true
              ..name = 'response'
              ..redirect = Reference('SocketsServiceMessageResponse')
              ..optionalParameters.addAll([
                Parameter(
                  (p) => p
                    ..named = true
                    ..name = 'id'
                    ..required = true
                    ..type = Reference('String'),
                ),
                Parameter(
                  (p) => p
                    ..named = true
                    ..required = true
                    ..name = 'command'
                    ..type = Reference('String'),
                ),
                Parameter(
                  (p) => p
                    ..named = true
                    ..required = true
                    ..name = 'result'
                    ..type = Reference('Object?'),
                ),
              ]),
          ),
          Constructor(
            (c) => c
              ..factory = true
              ..constant = true
              ..name = 'error'
              ..redirect = Reference('SocketsServiceMessageError')
              ..optionalParameters.addAll([
                Parameter(
                  (p) => p
                    ..named = true
                    ..name = 'id'
                    ..required = true
                    ..type = Reference('String'),
                ),
                Parameter(
                  (p) => p
                    ..named = true
                    ..required = true
                    ..name = 'command'
                    ..type = Reference('String'),
                ),
                Parameter(
                  (p) => p
                    ..named = true
                    ..required = true
                    ..name = 'error'
                    ..type = Reference('String'),
                ),
              ]),
          ),
          Constructor(
            (c) => c
              ..factory = true
              ..constant = true
              ..name = 'event'
              ..redirect = Reference('SocketsServiceMessageEvent')
              ..optionalParameters.addAll([
                Parameter(
                  (p) => p
                    ..named = true
                    ..name = 'command'
                    ..required = true
                    ..type = Reference('String'),
                ),
                Parameter(
                  (p) => p
                    ..named = true
                    ..required = true
                    ..name = 'type'
                    ..type = Reference('String'),
                ),
                Parameter(
                  (p) => p
                    ..named = true
                    ..required = true
                    ..name = 'params'
                    ..type = Reference('Object'),
                ),
              ]),
          ),
          Constructor(
            (c) => c
              ..factory = true
              ..constant = true
              ..name = 'emptyEvent'
              ..redirect = Reference('SocketsServiceMessageEmptyEvent')
              ..optionalParameters.addAll([
                Parameter(
                  (p) => p
                    ..named = true
                    ..name = 'command'
                    ..required = true
                    ..type = Reference('String'),
                ),
                Parameter(
                  (p) => p
                    ..named = true
                    ..required = true
                    ..name = 'type'
                    ..type = Reference('String'),
                ),
              ]),
          ),
          Constructor(
            (c) => c
              ..factory = true
              ..constant = true
              ..name = 'status'
              ..redirect = Reference('SocketsServiceMessageStatus')
              ..optionalParameters.addAll([
                Parameter(
                  (p) => p
                    ..named = true
                    ..name = 'command'
                    ..required = true
                    ..type = Reference('String'),
                ),
                Parameter(
                  (p) => p
                    ..named = true
                    ..required = true
                    ..name = 'status'
                    ..type = Reference('String'),
                ),
              ]),
          ),
        ]),
    );
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
          ..modifier = MethodModifier.async
          ..body = Code(_getSendMethodBody()),
      ))
      ..add(Method(
        (m) => m
          ..name = 'handleConnectionError'
          ..returns = Reference('void')
          ..docs.add('\n')
          ..requiredParameters.addAll([
            Parameter(
              (p) => p
                ..type = Reference('Object')
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
          ..name = 'handleResponse'
          ..returns = Reference('void')
          ..docs.add('\n')
          ..requiredParameters.add(
            Parameter(
              (p) => p
                ..type = Reference('dynamic')
                ..name = 'data',
            ),
          )
          ..body = Code(_getHandleResponseBody()),
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
      ))
      ..add(Method(
        (m) => m
          ..name = 'logStatus'
          ..returns = Reference('void')
          ..docs.add('\n')
          ..requiredParameters.add(Parameter((p) => p
            ..name = 'message'
            ..type = Reference('SocketsServiceMessageStatus')))
          ..body = Code(
              "print('[SocketsService] Status: \${message.command} \${message.status}');"),
      ))
      ..add(Method(
        (m) => m
          ..name = '_completeRequest'
          ..returns = Reference('void')
          ..docs.add('\n')
          ..requiredParameters.add(Parameter(
            (p) => p
              ..name = 'id'
              ..type = Reference('String'),
          ))
          ..requiredParameters.add(Parameter(
            (p) => p
              ..name = 'response'
              ..type = Reference('SocketsServiceMessage'),
          ))
          ..body = Code(_getCompleteRequestBody()),
      ));
    // ..add(Method((m) => m));
    return serviceMethods;
  }

  String _getFactoryConstructorBody(String className) {
    return '''
final _decoder = decoder ?? _CustomJsonDecoder(generatedMapping); 
return $className.create(socket, _decoder);    
    ''';
  }

  String _getSendMethodBody() {
    return '''
final id = '\$path\${data.hashCode}';

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

  String _getHandleResponseBody() {
    return '''
final message = SocketsServiceParser.parse(data.toString()); 

message.map(
  response: (res) => _completeRequest(res.id, res),
  error: (res) => _completeRequest(res.id, res),
  event: (res) {},
  emptyEvent: (res) {},
  status: logStatus,
);   
    ''';
  }

  String _getCompleteRequestBody() {
    return '''
if (response is SocketsServiceMessageError) {
  _requests[id]?.completeError(response.error);
} else if (response is SocketsServiceMessageResponse) {
  _requests[id]?.complete(response.result ?? {});
}

_requests.remove(id);    
    ''';
  }

  String _generateImports() {
    return '''
// ignore_for_file: type=lint    
    
import 'dart:async';
import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'client_mapping.dart';

part 'sockets_service.freezed.dart';

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

  String _getSocketServiceParser() {
    return '''
const String _kErrorMessagePattern = r'"?id"?:\\s*"?(?<id>[^,"]+)"?';    
    
class SocketsServiceParser {
  static SocketsServiceMessage parse(String data) {
    final delimiterIdx = data.indexOf(':');
    assert(
      delimiterIdx > 0,
      'Incorrect response format, check request details and confirm with ApplicationService spec',
    );
    final command = data.substring(0, delimiterIdx);
    final payload = data.substring(delimiterIdx + 1);
    if (command.startsWith('events/')) {
      return _parseEvent(command.replaceFirst('events/', ''), payload);
    }
    return _parseResponse(command, payload);
  }
  static SocketsServiceMessage _parseResponse(String command, String payload) {
    try {
      final responseData = jsonDecode(payload);
      if (responseData['error'] != null) {
        final _error = responseData['error'];
        final errorMsg = _error is Map ? _error['message'] : _error;
        return _parseError(command, errorMsg as String, responseData['id'] as String);
      }
      return SocketsServiceMessage.response(
        id: responseData['id'] as String,
        command: command,
        result: responseData['result'],
      );
    } catch (e) {
      return _parseError(command, e.toString());
    }
  }
  static SocketsServiceMessage _parseError(String command, String errorMsg, [String? id]) {
    var errorId = id;
    if (id == null) {
      final exp = RegExp(_kErrorMessagePattern).firstMatch(errorMsg);
      errorId = exp?.namedGroup('id');
    }
    return SocketsServiceMessage.error(
      id: errorId ?? '-1',
      command: command,
      error: errorMsg,
    );
  }
  static SocketsServiceMessage _parseEvent(String command, String payload) {
    if (command == 'startListen' || command == 'startListen') {
      return SocketsServiceMessage.status(command: command, status: payload);
    }
    final responseData = jsonDecode(payload);
    final params = responseData['params'] as List<dynamic>;
    return params.isNotEmpty
        ? SocketsServiceMessage.event(
            command: command,
            type: responseData['type'] as String,
            params: params.first as Object,
          )
        : SocketsServiceMessage.emptyEvent(
            command: command,
            type: responseData['type'] as String,
          );
  }
}    
    ''';
  }
}
