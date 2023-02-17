//Generated code

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
  Future<Response<dynamic>> _petPost({
    required Pet? body,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/pet');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _petPut({
    required Pet? body,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/pet');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = body;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<List<Pet>>> _petFindByStatusGet({
    required String? status,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/pet/findByStatus');
    final Map<String, dynamic> $params = <String, dynamic>{'status': status};
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      headers: $headers,
    );
    return client.send<List<Pet>, Pet>($request);
  }

  @override
  Future<Response<List<Pet>>> _petFindByTagsGet({
    required List<String>? tags,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/pet/findByTags');
    final Map<String, dynamic> $params = <String, dynamic>{'tags': tags};
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      headers: $headers,
    );
    return client.send<List<Pet>, Pet>($request);
  }

  @override
  Future<Response<Pet>> _petPetIdGet({
    required int? petId,
    String? apiKey,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/pet/${petId}');
    final Map<String, String> $headers = {
      if (apiKey != null) 'api_key': apiKey,
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<Pet, Pet>($request);
  }

  @override
  Future<Response<dynamic>> _petPetIdPost({
    required int? petId,
    String? name,
    String? status,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/pet/${petId}');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = <String, dynamic>{
      'name': name,
      'status': status,
    };
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _petPetIdDelete({
    String? apiKey,
    required int? petId,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/pet/${petId}');
    final Map<String, String> $headers = {
      if (apiKey != null) 'api_key': apiKey,
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<ApiResponse>> _petPetIdUploadImagePost({
    required int? petId,
    String? additionalMetadata,
    List<int>? file,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/pet/${petId}/uploadImage');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = <String, dynamic>{
      'additionalMetadata': additionalMetadata,
      'file': file,
    };
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<ApiResponse, ApiResponse>($request);
  }

  @override
  Future<Response<Object>> _storeInventoryGet({
    String? apiKey,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/store/inventory');
    final Map<String, String> $headers = {
      if (apiKey != null) 'api_key': apiKey,
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<Object, Object>($request);
  }

  @override
  Future<Response<Order>> _storeOrderPost({
    required Order? body,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/store/order');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<Order, Order>($request);
  }

  @override
  Future<Response<Order>> _storeOrderOrderIdGet({
    required int? orderId,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/store/order/${orderId}');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<Order, Order>($request);
  }

  @override
  Future<Response<dynamic>> _storeOrderOrderIdDelete({
    required int? orderId,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/store/order/${orderId}');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _userPost({
    required User? body,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/user');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _userCreateWithArrayPost({
    required List<User>? body,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/user/createWithArray');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _userCreateWithListPost({
    required List<User>? body,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/user/createWithList');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<String>> _userLoginGet({
    required String? username,
    required String? password,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/user/login');
    final Map<String, dynamic> $params = <String, dynamic>{
      'username': username,
      'password': password,
    };
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      headers: $headers,
    );
    return client.send<String, String>($request);
  }

  @override
  Future<Response<dynamic>> _userLogoutGet({String? cacheControl}) {
    final Uri $url = Uri.parse('/user/logout');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<User>> _userUsernameGet({
    required String? username,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/user/${username}');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<User, User>($request);
  }

  @override
  Future<Response<dynamic>> _userUsernamePut({
    required String? username,
    required User? body,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/user/${username}');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = body;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _userUsernameDelete({
    required String? username,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/user/${username}');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
