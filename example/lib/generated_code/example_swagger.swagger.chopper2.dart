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
  Future<Response<PetPost$Response>> petPost({Pet? body}) {
    final $url = '/pet';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<PetPost$Response, PetPost$Response>($request);
  }

  @override
  Future<Response<dynamic>> petPut({Pet? body}) {
    final $url = '/pet';
    final $body = body;
    final $request = Request('PUT', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<List<Pet>>> _petFindByStatusGet(
      {String? status, List<String?>? color}) {
    final $url = '/pet/findByStatus';
    final $params = <String, dynamic>{'status': status, 'color': color};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<List<Pet>, Pet>($request);
  }

  @override
  Future<Response<List<Pet>>> petFindByTagsGet({List<String>? tags}) {
    final $url = '/pet/findByTags';
    final $params = <String, dynamic>{'tags': tags};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<List<Pet>, Pet>($request);
  }

  @override
  Future<Response<Pet>> petPetIdGet({int? petId}) {
    final $url = '/pet/$petId';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<Pet, Pet>($request);
  }

  @override
  Future<Response<dynamic>> petPetIdPost(
      {int? petId, String? name, String? status, Object? body}) {
    final $url = '/pet/$petId';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request,
        requestConverter: FormUrlEncodedConverter.requestFactory);
  }

  @override
  Future<Response<dynamic>> petPetIdDelete({String? api_key, int? petId}) {
    final $url = '/pet/$petId';
    final $headers = {
      if (api_key != null) 'api_key': api_key,
    };

    final $request = Request('DELETE', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<ApiResponse>> petPetIdUploadImagePost(
      {int? petId, String? additionalMetadata, List<int>? file, Object? body}) {
    final $url = '/pet/$petId/uploadImage';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<ApiResponse, ApiResponse>($request,
        requestConverter: FormUrlEncodedConverter.requestFactory);
  }

  @override
  Future<Response<List<dynamic>>> storeInventoryGet() {
    final $url = '/store/inventory';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<List<dynamic>, List<dynamic>>($request);
  }

  @override
  Future<Response<OrderWithDash>> storeOrderPost({Order? body}) {
    final $url = '/store/order';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<OrderWithDash, OrderWithDash>($request);
  }

  @override
  Future<Response<Order>> storeOrderOrderIdGet({int? orderId}) {
    final $url = '/store/order/$orderId';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<Order, Order>($request);
  }

  @override
  Future<Response<dynamic>> storeOrderOrderIdDelete({int? orderId}) {
    final $url = '/store/order/$orderId';
    final $request = Request('DELETE', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> userPost({User? body}) {
    final $url = '/user';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> userCreateWithArrayPost({Object? body}) {
    final $url = '/user/createWithArray';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> userCreateWithListPost({Object? body}) {
    final $url = '/user/createWithList';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<String>> userLoginGet({String? username, String? password}) {
    final $url = '/user/login';
    final $params = <String, dynamic>{
      'username': username,
      'password': password
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<String, String>($request);
  }

  @override
  Future<Response<dynamic>> userLogoutGet() {
    final $url = '/user/logout';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<User>> userUsernameGet({String? username}) {
    final $url = '/user/$username';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<User, User>($request);
  }

  @override
  Future<Response<dynamic>> userUsernamePut({String? username, User? body}) {
    final $url = '/user/$username';
    final $body = body;
    final $request = Request('PUT', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> userUsernameDelete({String? username}) {
    final $url = '/user/$username';
    final $request = Request('DELETE', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }
}
