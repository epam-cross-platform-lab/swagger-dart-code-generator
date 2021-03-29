// GENERATED CODE - DO NOT MODIFY BY HAND

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
  Future<Response<dynamic>> addPet({Pet? body}) {
    final $url = '/pet';
    final $body = body;
    final $request = Request('POST', $url, client!.baseUrl!, body: $body);
    return client!.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> updatePet({Pet? body}) {
    final $url = '/pet';
    final $body = body;
    final $request = Request('PUT', $url, client!.baseUrl!, body: $body);
    return client!.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<List<Pet>>> _findPetsByStatus(
      {String? status, List<String?>? color}) {
    final $url = '/pet/findByStatus';
    final $params = <String, dynamic>{'status': status, 'color': color};
    final $request =
        Request('GET', $url, client!.baseUrl!, parameters: $params);
    return client!.send<List<Pet>, Pet>($request);
  }

  @override
  Future<Response<List<Pet>>> findPetsByTags({List<String>? tags}) {
    final $url = '/pet/findByTags';
    final $params = <String, dynamic>{'tags': tags};
    final $request =
        Request('GET', $url, client!.baseUrl!, parameters: $params);
    return client!.send<List<Pet>, Pet>($request);
  }

  @override
  Future<Response<Pet>> getPetById({int? petId}) {
    final $url = '/pet/$petId';
    final $request = Request('GET', $url, client!.baseUrl!);
    return client!.send<Pet, Pet>($request);
  }

  @override
  Future<Response<dynamic>> updatePetWithForm(
      {int? petId, String? name, String? status, Object? body}) {
    final $url = '/pet/$petId';
    final $body = body;
    final $request = Request('POST', $url, client!.baseUrl!, body: $body);
    return client!.send<dynamic, dynamic>($request,
        requestConverter: FormUrlEncodedConverter.requestFactory);
  }

  @override
  Future<Response<dynamic>> deletePet({int? petId}) {
    final $url = '/pet/$petId';
    final $request = Request('DELETE', $url, client!.baseUrl!);
    return client!.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<ApiResponse>> uploadFile(
      {int? petId, String? additionalMetadata, List<int>? file, Object? body}) {
    final $url = '/pet/$petId/uploadImage';
    final $body = body;
    final $request = Request('POST', $url, client!.baseUrl!, body: $body);
    return client!.send<ApiResponse, ApiResponse>($request,
        requestConverter: FormUrlEncodedConverter.requestFactory);
  }

  @override
  Future<Response<List<dynamic>>> getInventory() {
    final $url = '/store/inventory';
    final $request = Request('GET', $url, client!.baseUrl!);
    return client!.send<List<dynamic>, List<dynamic>>($request);
  }

  @override
  Future<Response<OrderWithDash>> placeOrder({Order? body}) {
    final $url = '/store/order';
    final $body = body;
    final $request = Request('POST', $url, client!.baseUrl!, body: $body);
    return client!.send<OrderWithDash, OrderWithDash>($request);
  }

  @override
  Future<Response<Order>> getOrderById({int? orderId}) {
    final $url = '/store/order/$orderId';
    final $request = Request('GET', $url, client!.baseUrl!);
    return client!.send<Order, Order>($request);
  }

  @override
  Future<Response<dynamic>> deleteOrder({int? orderId}) {
    final $url = '/store/order/$orderId';
    final $request = Request('DELETE', $url, client!.baseUrl!);
    return client!.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> createUser({User? body}) {
    final $url = '/user';
    final $body = body;
    final $request = Request('POST', $url, client!.baseUrl!, body: $body);
    return client!.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> createUsersWithArrayInput({Object? body}) {
    final $url = '/user/createWithArray';
    final $body = body;
    final $request = Request('POST', $url, client!.baseUrl!, body: $body);
    return client!.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> createUsersWithListInput({Object? body}) {
    final $url = '/user/createWithList';
    final $body = body;
    final $request = Request('POST', $url, client!.baseUrl!, body: $body);
    return client!.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<String>> loginUser({String? username, String? password}) {
    final $url = '/user/login';
    final $params = <String, dynamic>{
      'username': username,
      'password': password
    };
    final $request =
        Request('GET', $url, client!.baseUrl!, parameters: $params);
    return client!.send<String, String>($request);
  }

  @override
  Future<Response<dynamic>> logoutUser() {
    final $url = '/user/logout';
    final $request = Request('GET', $url, client!.baseUrl!);
    return client!.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<User>> getUserByName({String? username}) {
    final $url = '/user/$username';
    final $request = Request('GET', $url, client!.baseUrl!);
    return client!.send<User, User>($request);
  }

  @override
  Future<Response<dynamic>> updateUser({String? username, User? body}) {
    final $url = '/user/$username';
    final $body = body;
    final $request = Request('PUT', $url, client!.baseUrl!, body: $body);
    return client!.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> deleteUser({String? username}) {
    final $url = '/user/$username';
    final $request = Request('DELETE', $url, client!.baseUrl!);
    return client!.send<dynamic, dynamic>($request);
  }
}
