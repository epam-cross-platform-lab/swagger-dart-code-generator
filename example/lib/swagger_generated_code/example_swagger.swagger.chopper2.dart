//Generated code

part of 'example_swagger.swagger.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$ExampleSwagger extends ExampleSwagger {
  _$ExampleSwagger([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = ExampleSwagger;

  @override
  Future<Response<List<Room>>> roomsGet({required String? id}) {
    final $url = '/rooms';
    final $params = <String, dynamic>{'id': id};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<List<Room>, Room>($request);
  }

  @override
  Future<Response<ListCustomItem>> apiItemAllGet() {
    final $url = '/api/item/all';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<ListCustomItem, ListCustomItem>($request);
  }
}
