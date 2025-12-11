// dart format width=80
//Generated code

part of 'pet_service_swagger.swagger.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$PetServiceSwagger extends PetServiceSwagger {
  _$PetServiceSwagger([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = PetServiceSwagger;

  @override
  Future<Response<dynamic>> _petPost({
    required Pet? body,
    String? cacheControl,
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description: '',
      summary: 'Add a new pet to the store',
      operationId: 'addPet',
      consumes: ["application/json", "application/xml"],
      produces: ["application/xml", "application/json"],
      security: ["petstore_auth"],
      tags: ["pet"],
      deprecated: false,
    ),
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
      tag: swaggerMetaData,
      includeNullQueryVars: true,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _petPut({
    required Pet? body,
    String? cacheControl,
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description: '',
      summary: 'Update an existing pet',
      operationId: 'updatePet',
      consumes: ["application/json", "application/xml"],
      produces: ["application/xml", "application/json"],
      security: ["petstore_auth"],
      tags: ["pet"],
      deprecated: false,
    ),
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
      tag: swaggerMetaData,
      includeNullQueryVars: true,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<List<Pet>>> _petFindByStatusGet({
    required List<Object?>? status,
    String? cacheControl,
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'Multiple status values can be provided with comma separated strings',
      summary: 'Finds Pets by status',
      operationId: 'findPetsByStatus',
      consumes: [],
      produces: ["application/xml", "application/json"],
      security: ["petstore_auth"],
      tags: ["pet"],
      deprecated: false,
    ),
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
      tag: swaggerMetaData,
      includeNullQueryVars: true,
    );
    return client.send<List<Pet>, Pet>($request);
  }

  @override
  Future<Response<List<Pet>>> _petFindByTagsGet({
    required List<String>? tags,
    String? cacheControl,
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'Muliple tags can be provided with comma separated strings. Use         tag1, tag2, tag3 for testing.',
      summary: 'Finds Pets by tags',
      operationId: 'findPetsByTags',
      consumes: [],
      produces: ["application/xml", "application/json"],
      security: ["petstore_auth"],
      tags: ["pet"],
      deprecated: true,
    ),
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
      tag: swaggerMetaData,
      includeNullQueryVars: true,
    );
    return client.send<List<Pet>, Pet>($request);
  }

  @override
  Future<Response<Pet>> _petPetIdGet({
    required int? petId,
    String? apiKey,
    String? cacheControl,
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description: 'Returns a single pet',
      summary: 'Find pet by ID',
      operationId: 'getPetById',
      consumes: [],
      produces: ["application/xml", "application/json"],
      security: ["api_key"],
      tags: ["pet"],
      deprecated: false,
    ),
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
      tag: swaggerMetaData,
      includeNullQueryVars: true,
    );
    return client.send<Pet, Pet>($request);
  }

  @override
  Future<Response<dynamic>> _petPetIdPost({
    required int? petId,
    String? name,
    String? status,
    String? cacheControl,
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description: '',
      summary: 'Updates a pet in the store with form data',
      operationId: 'updatePetWithForm',
      consumes: ["application/x-www-form-urlencoded"],
      produces: ["application/xml", "application/json"],
      security: ["petstore_auth"],
      tags: ["pet"],
      deprecated: false,
    ),
  }) {
    final Uri $url = Uri.parse('/pet/${petId}');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = <String, dynamic>{'name': name, 'status': status};
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
      tag: swaggerMetaData,
      includeNullQueryVars: true,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _petPetIdDelete({
    String? apiKey,
    required int? petId,
    String? cacheControl,
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description: '',
      summary: 'Deletes a pet',
      operationId: 'deletePet',
      consumes: [],
      produces: ["application/xml", "application/json"],
      security: ["petstore_auth"],
      tags: ["pet"],
      deprecated: false,
    ),
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
      tag: swaggerMetaData,
      includeNullQueryVars: true,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<ApiResponse>> _petPetIdUploadImagePost({
    required int? petId,
    String? additionalMetadata,
    List<int>? file,
    String? cacheControl,
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description: '',
      summary: 'uploads an image',
      operationId: 'uploadFile',
      consumes: ["multipart/form-data"],
      produces: ["application/json"],
      security: ["petstore_auth"],
      tags: ["pet"],
      deprecated: false,
    ),
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
      tag: swaggerMetaData,
      includeNullQueryVars: true,
    );
    return client.send<ApiResponse, ApiResponse>($request);
  }

  @override
  Future<Response<Object>> _storeInventoryGet({
    String? apiKey,
    String? cacheControl,
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description: 'Returns a map of status codes to quantities',
      summary: 'Returns pet inventories by status',
      operationId: 'getInventory',
      consumes: [],
      produces: ["application/json"],
      security: ["api_key"],
      tags: ["store"],
      deprecated: false,
    ),
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
      tag: swaggerMetaData,
      includeNullQueryVars: true,
    );
    return client.send<Object, Object>($request);
  }

  @override
  Future<Response<Order>> _storeOrderPost({
    required Order? body,
    String? cacheControl,
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description: '',
      summary: 'Place an order for a pet',
      operationId: 'placeOrder',
      consumes: [],
      produces: ["application/xml", "application/json"],
      security: [],
      tags: ["store"],
      deprecated: false,
    ),
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
      tag: swaggerMetaData,
      includeNullQueryVars: true,
    );
    return client.send<Order, Order>($request);
  }

  @override
  Future<Response<Order>> _storeOrderOrderIdGet({
    required int? orderId,
    String? cacheControl,
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'For valid response try integer IDs with value >= 1 and <= 10.         Other values will generated exceptions',
      summary: 'Find purchase order by ID',
      operationId: 'getOrderById',
      consumes: [],
      produces: ["application/xml", "application/json"],
      security: [],
      tags: ["store"],
      deprecated: false,
    ),
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
      tag: swaggerMetaData,
      includeNullQueryVars: true,
    );
    return client.send<Order, Order>($request);
  }

  @override
  Future<Response<dynamic>> _storeOrderOrderIdDelete({
    required int? orderId,
    String? cacheControl,
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'For valid response try integer IDs with positive integer value.         Negative or non-integer values will generate API errors',
      summary: 'Delete purchase order by ID',
      operationId: 'deleteOrder',
      consumes: [],
      produces: ["application/xml", "application/json"],
      security: [],
      tags: ["store"],
      deprecated: false,
    ),
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
      tag: swaggerMetaData,
      includeNullQueryVars: true,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _userPost({
    required User? body,
    String? cacheControl,
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description: 'This can only be done by the logged in user.',
      summary: 'Create user',
      operationId: 'createUser',
      consumes: [],
      produces: ["application/xml", "application/json"],
      security: [],
      tags: ["user"],
      deprecated: false,
    ),
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
      tag: swaggerMetaData,
      includeNullQueryVars: true,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _userCreateWithArrayPost({
    required List<User>? body,
    String? cacheControl,
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description: '',
      summary: 'Creates list of users with given input array',
      operationId: 'createUsersWithArrayInput',
      consumes: [],
      produces: ["application/xml", "application/json"],
      security: [],
      tags: ["user"],
      deprecated: false,
    ),
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
      tag: swaggerMetaData,
      includeNullQueryVars: true,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _userCreateWithListPost({
    required List<User>? body,
    String? cacheControl,
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description: '',
      summary: 'Creates list of users with given input array',
      operationId: 'createUsersWithListInput',
      consumes: [],
      produces: ["application/xml", "application/json"],
      security: [],
      tags: ["user"],
      deprecated: false,
    ),
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
      tag: swaggerMetaData,
      includeNullQueryVars: true,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<String>> _userLoginGet({
    required String? username,
    required String? password,
    String? cacheControl,
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description: '',
      summary: 'Logs user into the system',
      operationId: 'loginUser',
      consumes: [],
      produces: ["application/xml", "application/json"],
      security: [],
      tags: ["user"],
      deprecated: false,
    ),
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
      tag: swaggerMetaData,
      includeNullQueryVars: true,
    );
    return client.send<String, String>($request);
  }

  @override
  Future<Response<dynamic>> _userLogoutGet({
    String? cacheControl,
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description: '',
      summary: 'Logs out current logged in user session',
      operationId: 'logoutUser',
      consumes: [],
      produces: ["application/xml", "application/json"],
      security: [],
      tags: ["user"],
      deprecated: false,
    ),
  }) {
    final Uri $url = Uri.parse('/user/logout');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
      tag: swaggerMetaData,
      includeNullQueryVars: true,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<User>> _userUsernameGet({
    required String? username,
    String? cacheControl,
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description: '',
      summary: 'Get user by user name',
      operationId: 'getUserByName',
      consumes: [],
      produces: ["application/xml", "application/json"],
      security: [],
      tags: ["user"],
      deprecated: false,
    ),
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
      tag: swaggerMetaData,
      includeNullQueryVars: true,
    );
    return client.send<User, User>($request);
  }

  @override
  Future<Response<dynamic>> _userUsernamePut({
    required String? username,
    required User? body,
    String? cacheControl,
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description: 'This can only be done by the logged in user.',
      summary: 'Updated user',
      operationId: 'updateUser',
      consumes: [],
      produces: ["application/xml", "application/json"],
      security: [],
      tags: ["user"],
      deprecated: false,
    ),
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
      tag: swaggerMetaData,
      includeNullQueryVars: true,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _userUsernameDelete({
    required String? username,
    String? cacheControl,
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description: 'This can only be done by the logged in user.',
      summary: 'Delete user',
      operationId: 'deleteUser',
      consumes: [],
      produces: ["application/xml", "application/json"],
      security: [],
      tags: ["user"],
      deprecated: false,
    ),
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
      tag: swaggerMetaData,
      includeNullQueryVars: true,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
