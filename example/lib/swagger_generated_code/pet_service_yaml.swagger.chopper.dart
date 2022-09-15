//Generated code

part of 'pet_service_yaml.swagger.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$PetServiceYaml extends PetServiceYaml {
  _$PetServiceYaml([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = PetServiceYaml;

  @override
  Future<Response<dynamic>> _petPost(
      {required Pet? body, String? cacheControl}) {
    final $url = '/pet';
    final $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };

    final $body = body;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _petPut(
      {required Pet? body, String? cacheControl}) {
    final $url = '/pet';
    final $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };

    final $body = body;
    final $request =
        Request('PUT', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<List<Pet>>> _petFindByStatusGet(
      {required String? status, String? cacheControl}) {
    final $url = '/pet/findByStatus';
    final $params = <String, dynamic>{'status': status};
    final $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };

    final $request = Request('GET', $url, client.baseUrl,
        parameters: $params, headers: $headers);
    return client.send<List<Pet>, Pet>($request);
  }

  @override
  Future<Response<List<Pet>>> _petFindByTagsGet(
      {required List<String>? tags, String? cacheControl}) {
    final $url = '/pet/findByTags';
    final $params = <String, dynamic>{'tags': tags};
    final $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };

    final $request = Request('GET', $url, client.baseUrl,
        parameters: $params, headers: $headers);
    return client.send<List<Pet>, Pet>($request);
  }

  @override
  Future<Response<Pet>> _petPetIdGet(
      {required int? petId, String? apiKey, String? cacheControl}) {
    final $url = '/pet/${petId}';
    final $headers = {
      if (apiKey != null) 'api_key': apiKey,
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<Pet, Pet>($request);
  }

  @override
  Future<Response<dynamic>> _petPetIdPost(
      {required int? petId,
      String? name,
      String? status,
      String? cacheControl}) {
    final $url = '/pet/${petId}';
    final $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };

    final $body = <String, dynamic>{'name': name, 'status': status};
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _petPetIdDelete(
      {String? apiKey, required int? petId, String? cacheControl}) {
    final $url = '/pet/${petId}';
    final $headers = {
      if (apiKey != null) 'api_key': apiKey,
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };

    final $request = Request('DELETE', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<ApiResponse>> _petPetIdUploadImagePost(
      {required int? petId,
      String? additionalMetadata,
      List<String>? file,
      String? cacheControl}) {
    final $url = '/pet/${petId}/uploadImage';
    final $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };

    final $body = <String, dynamic>{
      'additionalMetadata': additionalMetadata,
      'file': file
    };
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<ApiResponse, ApiResponse>($request);
  }

  @override
  Future<Response<Object>> _storeInventoryGet(
      {String? apiKey, String? cacheControl}) {
    final $url = '/store/inventory';
    final $headers = {
      if (apiKey != null) 'api_key': apiKey,
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<Object, Object>($request);
  }

  @override
  Future<Response<Order>> _storeOrderPost(
      {required Order? body, String? cacheControl}) {
    final $url = '/store/order';
    final $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };

    final $body = body;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<Order, Order>($request);
  }

  @override
  Future<Response<Order>> _storeOrderOrderIdGet(
      {required int? orderId, String? cacheControl}) {
    final $url = '/store/order/${orderId}';
    final $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<Order, Order>($request);
  }

  @override
  Future<Response<dynamic>> _storeOrderOrderIdDelete(
      {required int? orderId, String? cacheControl}) {
    final $url = '/store/order/${orderId}';
    final $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };

    final $request = Request('DELETE', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _userPost(
      {required User? body, String? cacheControl}) {
    final $url = '/user';
    final $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };

    final $body = body;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _userCreateWithArrayPost(
      {required List<User>? body, String? cacheControl}) {
    final $url = '/user/createWithArray';
    final $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };

    final $body = body;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _userCreateWithListPost(
      {required List<User>? body, String? cacheControl}) {
    final $url = '/user/createWithList';
    final $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };

    final $body = body;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<String>> _userLoginGet(
      {required String? username,
      required String? password,
      String? cacheControl}) {
    final $url = '/user/login';
    final $params = <String, dynamic>{
      'username': username,
      'password': password
    };
    final $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };

    final $request = Request('GET', $url, client.baseUrl,
        parameters: $params, headers: $headers);
    return client.send<String, String>($request);
  }

  @override
  Future<Response<dynamic>> _userLogoutGet({String? cacheControl}) {
    final $url = '/user/logout';
    final $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<User>> _userUsernameGet(
      {required String? username, String? cacheControl}) {
    final $url = '/user/${username}';
    final $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<User, User>($request);
  }

  @override
  Future<Response<dynamic>> _userUsernamePut(
      {required String? username, required User? body, String? cacheControl}) {
    final $url = '/user/${username}';
    final $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };

    final $body = body;
    final $request =
        Request('PUT', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _userUsernameDelete(
      {required String? username, String? cacheControl}) {
    final $url = '/user/${username}';
    final $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };

    final $request = Request('DELETE', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }
}
