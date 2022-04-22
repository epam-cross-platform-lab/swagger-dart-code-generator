// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet_service_swagger.swagger.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$PetServiceSwagger extends PetServiceSwagger {
  _$PetServiceSwagger([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = PetServiceSwagger;

  @override
  Future<Response<dynamic>> _petPost({required Pet? body}) {
    final $url = '/pet';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _petPut({required Pet? body}) {
    final $url = '/pet';
    final $body = body;
    final $request = Request('PUT', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<List<Pet>>> _petFindByStatusGet({required dynamic status}) {
    final $url = '/pet/findByStatus';
    final $params = <String, dynamic>{'status': status};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<List<Pet>, Pet>($request);
  }

  @override
  Future<Response<List<Pet>>> _petFindByTagsGet({required List<String>? tags}) {
    final $url = '/pet/findByTags';
    final $params = <String, dynamic>{'tags': tags};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<List<Pet>, Pet>($request);
  }

  @override
  Future<Response<Pet>> _petPetIdGet({required int? petId, String? apiKey}) {
    final $url = '/pet/${petId}';
    final $headers = {
      if (apiKey != null) 'api_key': apiKey,
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<Pet, Pet>($request);
  }

  @override
  Future<Response<dynamic>> _petPetIdPost(
      {required int? petId, String? name, String? status}) {
    final $url = '/pet/${petId}';
    final $body = <String, dynamic>{'name': name, 'status': status};
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _petPetIdDelete(
      {String? apiKey, required int? petId}) {
    final $url = '/pet/${petId}';
    final $headers = {
      if (apiKey != null) 'api_key': apiKey,
    };

    final $request = Request('DELETE', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<ApiResponse>> _petPetIdUploadImagePost(
      {required int? petId, String? additionalMetadata, List<String>? file}) {
    final $url = '/pet/${petId}/uploadImage';
    final $body = <String, dynamic>{
      'additionalMetadata': additionalMetadata,
      'file': file
    };
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<ApiResponse, ApiResponse>($request);
  }

  @override
  Future<Response<Object>> _storeInventoryGet({String? apiKey}) {
    final $url = '/store/inventory';
    final $headers = {
      if (apiKey != null) 'api_key': apiKey,
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<Object, Object>($request);
  }

  @override
  Future<Response<Order>> _storeOrderPost({required Order? body}) {
    final $url = '/store/order';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<Order, Order>($request);
  }

  @override
  Future<Response<Order>> _storeOrderOrderIdGet({required int? orderId}) {
    final $url = '/store/order/${orderId}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<Order, Order>($request);
  }

  @override
  Future<Response<dynamic>> _storeOrderOrderIdDelete({required int? orderId}) {
    final $url = '/store/order/${orderId}';
    final $request = Request('DELETE', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _userPost({required User? body}) {
    final $url = '/user';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _userCreateWithArrayPost(
      {required List<User>? body}) {
    final $url = '/user/createWithArray';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _userCreateWithListPost(
      {required List<User>? body}) {
    final $url = '/user/createWithList';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<String>> _userLoginGet(
      {required String? username, required String? password}) {
    final $url = '/user/login';
    final $params = <String, dynamic>{
      'username': username,
      'password': password
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<String, String>($request);
  }

  @override
  Future<Response<dynamic>> _userLogoutGet() {
    final $url = '/user/logout';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<User>> _userUsernameGet({required String? username}) {
    final $url = '/user/${username}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<User, User>($request);
  }

  @override
  Future<Response<dynamic>> _userUsernamePut(
      {required String? username, required User? body}) {
    final $url = '/user/${username}';
    final $body = body;
    final $request = Request('PUT', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _userUsernameDelete({required String? username}) {
    final $url = '/user/${username}';
    final $request = Request('DELETE', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }
}
