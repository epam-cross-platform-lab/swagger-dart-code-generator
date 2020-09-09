// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example_swagger.swagger.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$ExampleSwagger extends ExampleSwagger {
  _$ExampleSwagger([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = ExampleSwagger;

  @override
  Future<Response<dynamic>> addPet({String body}) {
    final $url = 'petstore.swagger.io/pet';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> updatePet({String body}) {
    final $url = 'petstore.swagger.io/pet';
    final $body = body;
    final $request = Request('PUT', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<List<Pet>>> findPetsByStatus({List<String> status}) {
    final $url = 'petstore.swagger.io/pet/findByStatus';
    final $params = <String, dynamic>{'status': status};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<List<Pet>, Pet>($request);
  }

  @override
  Future<Response<List<Pet>>> findPetsByTags({List<String> tags}) {
    final $url = 'petstore.swagger.io/pet/findByTags';
    final $params = <String, dynamic>{'tags': tags};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<List<Pet>, Pet>($request);
  }

  @override
  Future<Response<dynamic>> getPetById({int petId}) {
    final $url = 'petstore.swagger.io/pet/$petId';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> updatePetWithForm(
      {int petId, String name, String status}) {
    final $url = 'petstore.swagger.io/pet/$petId';
    final $body = <String, dynamic>{'name': name, 'status': status};
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request,
        requestConverter: FormUrlEncodedConverter.requestFactory);
  }

  @override
  Future<Response<dynamic>> deletePet({int petId}) {
    final $url = 'petstore.swagger.io/pet/$petId';
    final $request = Request('DELETE', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> uploadFile(
      {int petId, String additionalMetadata, List<int> file}) {
    final $url = 'petstore.swagger.io/pet/$petId/uploadImage';
    final $body = <String, dynamic>{
      'additionalMetadata': additionalMetadata,
      'file': file
    };
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request,
        requestConverter: FormUrlEncodedConverter.requestFactory);
  }

  @override
  Future<Response<List<dynamic>>> getInventory() {
    final $url = 'petstore.swagger.io/store/inventory';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<List<dynamic>, List<dynamic>>($request);
  }

  @override
  Future<Response<dynamic>> placeOrder({String body}) {
    final $url = 'petstore.swagger.io/store/order';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getOrderById({int orderId}) {
    final $url = 'petstore.swagger.io/store/order/$orderId';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> deleteOrder({int orderId}) {
    final $url = 'petstore.swagger.io/store/order/$orderId';
    final $request = Request('DELETE', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> createUser({String body}) {
    final $url = 'petstore.swagger.io/user';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> createUsersWithArrayInput({String body}) {
    final $url = 'petstore.swagger.io/user/createWithArray';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> createUsersWithListInput({String body}) {
    final $url = 'petstore.swagger.io/user/createWithList';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<String>> loginUser({String username, String password}) {
    final $url = 'petstore.swagger.io/user/login';
    final $params = <String, dynamic>{
      'username': username,
      'password': password
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<String, String>($request);
  }

  @override
  Future<Response<dynamic>> logoutUser() {
    final $url = 'petstore.swagger.io/user/logout';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getUserByName({String username}) {
    final $url = 'petstore.swagger.io/user/$username';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> updateUser({String username, String body}) {
    final $url = 'petstore.swagger.io/user/$username';
    final $body = body;
    final $request = Request('PUT', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> deleteUser({String username}) {
    final $url = 'petstore.swagger.io/user/$username';
    final $request = Request('DELETE', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }
}
