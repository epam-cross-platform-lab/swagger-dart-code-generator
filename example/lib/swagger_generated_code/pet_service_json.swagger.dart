// ignore_for_file: type=lint
// ignore_for_file: unused_element_parameter

import 'package:json_annotation/json_annotation.dart';
import 'package:json_annotation/json_annotation.dart' as json;
import 'package:collection/collection.dart';
import 'dart:convert';

import '../overriden_models.dart';
import 'package:chopper/chopper.dart';

import 'client_mapping.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:http/http.dart' show MultipartFile;
import 'package:chopper/chopper.dart' as chopper;
import 'pet_service_json.enums.swagger.dart' as enums;
import 'pet_service_json.metadata.swagger.dart';
export 'pet_service_json.enums.swagger.dart';

part 'pet_service_json.swagger.chopper.dart';
part 'pet_service_json.swagger.g.dart';

// **************************************************************************
// SwaggerChopperGenerator
// **************************************************************************

@ChopperApi()
abstract class PetServiceJson extends ChopperService {
  static PetServiceJson create({
    ChopperClient? client,
    http.Client? httpClient,
    Authenticator? authenticator,
    ErrorConverter? errorConverter,
    Converter? converter,
    Uri? baseUrl,
    List<Interceptor>? interceptors,
  }) {
    if (client != null) {
      return _$PetServiceJson(client);
    }

    final newClient = ChopperClient(
      services: [_$PetServiceJson()],
      converter: converter ?? $JsonSerializableConverter(),
      interceptors: interceptors ?? [],
      client: httpClient,
      authenticator: authenticator,
      errorConverter: errorConverter,
      baseUrl: baseUrl ?? Uri.parse('http://petstore.swagger.io/v2'),
    );
    return _$PetServiceJson(newClient);
  }

  ///Add a new pet to the store
  ///@param body Pet object that needs to be added to the store
  Future<chopper.Response> petPost({required Pet? body, dynamic cacheControl}) {
    generatedMapping.putIfAbsent(Pet, () => Pet.fromJsonFactory);

    return _petPost(body: body, cacheControl: cacheControl?.toString());
  }

  ///Add a new pet to the store
  ///@param body Pet object that needs to be added to the store
  @POST(path: '/pet', includeNullQueryVars: true)
  Future<chopper.Response> _petPost({
    @Body() required Pet? body,
    @Header('Cache-Control') String? cacheControl,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      summary: 'Add a new pet to the store',
      description: '',
      operationId: 'addPet',
      consumes: ["application/json", "application/xml"],
      produces: ["application/xml", "application/json"],
      security: ["petstore_auth"],
      tags: ["pet"],
      deprecated: false,
    ),
  });

  ///Update an existing pet
  ///@param body Pet object that needs to be added to the store
  Future<chopper.Response> petPut({required Pet? body, dynamic cacheControl}) {
    generatedMapping.putIfAbsent(Pet, () => Pet.fromJsonFactory);

    return _petPut(body: body, cacheControl: cacheControl?.toString());
  }

  ///Update an existing pet
  ///@param body Pet object that needs to be added to the store
  @PUT(path: '/pet', includeNullQueryVars: true)
  Future<chopper.Response> _petPut({
    @Body() required Pet? body,
    @Header('Cache-Control') String? cacheControl,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      summary: 'Update an existing pet',
      description: '',
      operationId: 'updatePet',
      consumes: ["application/json", "application/xml"],
      produces: ["application/xml", "application/json"],
      security: ["petstore_auth"],
      tags: ["pet"],
      deprecated: false,
    ),
  });

  ///Finds Pets by status
  ///@param status Status values that need to be considered for filter
  Future<chopper.Response<List<Pet>>> petFindByStatusGet({
    required List<enums.PetFindByStatusGetStatus>? status,
    dynamic cacheControl,
  }) {
    generatedMapping.putIfAbsent(Pet, () => Pet.fromJsonFactory);

    return _petFindByStatusGet(
      status: petFindByStatusGetStatusListToJson(status),
      cacheControl: cacheControl?.toString(),
    );
  }

  ///Finds Pets by status
  ///@param status Status values that need to be considered for filter
  @GET(path: '/pet/findByStatus', includeNullQueryVars: true)
  Future<chopper.Response<List<Pet>>> _petFindByStatusGet({
    @Query('status') required List<Object?>? status,
    @Header('Cache-Control') String? cacheControl,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      summary: 'Finds Pets by status',
      description:
          'Multiple status values can be provided with comma separated strings',
      operationId: 'findPetsByStatus',
      consumes: [],
      produces: ["application/xml", "application/json"],
      security: ["petstore_auth"],
      tags: ["pet"],
      deprecated: false,
    ),
  });

  ///Finds Pets by tags
  ///@param tags Tags to filter by
  @deprecated
  Future<chopper.Response<List<Pet>>> petFindByTagsGet({
    required List<String>? tags,
    dynamic cacheControl,
  }) {
    generatedMapping.putIfAbsent(Pet, () => Pet.fromJsonFactory);

    return _petFindByTagsGet(
      tags: tags,
      cacheControl: cacheControl?.toString(),
    );
  }

  ///Finds Pets by tags
  ///@param tags Tags to filter by
  @deprecated
  @GET(path: '/pet/findByTags', includeNullQueryVars: true)
  Future<chopper.Response<List<Pet>>> _petFindByTagsGet({
    @Query('tags') required List<String>? tags,
    @Header('Cache-Control') String? cacheControl,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      summary: 'Finds Pets by tags',
      description:
          'Muliple tags can be provided with comma separated strings. Use         tag1, tag2, tag3 for testing.',
      operationId: 'findPetsByTags',
      consumes: [],
      produces: ["application/xml", "application/json"],
      security: ["petstore_auth"],
      tags: ["pet"],
      deprecated: true,
    ),
  });

  ///Find pet by ID
  ///@param petId ID of pet to return
  Future<chopper.Response<Pet>> petPetIdGet({
    required int? petId,
    dynamic apiKey,
    dynamic cacheControl,
  }) {
    generatedMapping.putIfAbsent(Pet, () => Pet.fromJsonFactory);

    return _petPetIdGet(
      petId: petId,
      apiKey: apiKey?.toString(),
      cacheControl: cacheControl?.toString(),
    );
  }

  ///Find pet by ID
  ///@param petId ID of pet to return
  @GET(path: '/pet/{petId}', includeNullQueryVars: true)
  Future<chopper.Response<Pet>> _petPetIdGet({
    @Path('petId') required int? petId,
    @Header('api_key') String? apiKey,
    @Header('Cache-Control') String? cacheControl,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      summary: 'Find pet by ID',
      description: 'Returns a single pet',
      operationId: 'getPetById',
      consumes: [],
      produces: ["application/xml", "application/json"],
      security: ["api_key"],
      tags: ["pet"],
      deprecated: false,
    ),
  });

  ///Updates a pet in the store with form data
  ///@param petId ID of pet that needs to be updated
  ///@param name Updated name of the pet
  ///@param status Updated status of the pet
  Future<chopper.Response> petPetIdPost({
    required int? petId,
    String? name,
    String? status,
    dynamic cacheControl,
  }) {
    return _petPetIdPost(
      petId: petId,
      name: name,
      status: status,
      cacheControl: cacheControl?.toString(),
    );
  }

  ///Updates a pet in the store with form data
  ///@param petId ID of pet that needs to be updated
  ///@param name Updated name of the pet
  ///@param status Updated status of the pet
  @POST(path: '/pet/{petId}', optionalBody: true, includeNullQueryVars: true)
  Future<chopper.Response> _petPetIdPost({
    @Path('petId') required int? petId,
    @Field('name') String? name,
    @Field('status') String? status,
    @Header('Cache-Control') String? cacheControl,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      summary: 'Updates a pet in the store with form data',
      description: '',
      operationId: 'updatePetWithForm',
      consumes: ["application/x-www-form-urlencoded"],
      produces: ["application/xml", "application/json"],
      security: ["petstore_auth"],
      tags: ["pet"],
      deprecated: false,
    ),
  });

  ///Deletes a pet
  ///@param api_key
  ///@param petId Pet id to delete
  Future<chopper.Response> petPetIdDelete({
    String? apiKey,
    required int? petId,
    dynamic cacheControl,
  }) {
    return _petPetIdDelete(
      apiKey: apiKey?.toString(),
      petId: petId,
      cacheControl: cacheControl?.toString(),
    );
  }

  ///Deletes a pet
  ///@param api_key
  ///@param petId Pet id to delete
  @DELETE(path: '/pet/{petId}', includeNullQueryVars: true)
  Future<chopper.Response> _petPetIdDelete({
    @Header('api_key') String? apiKey,
    @Path('petId') required int? petId,
    @Header('Cache-Control') String? cacheControl,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      summary: 'Deletes a pet',
      description: '',
      operationId: 'deletePet',
      consumes: [],
      produces: ["application/xml", "application/json"],
      security: ["petstore_auth"],
      tags: ["pet"],
      deprecated: false,
    ),
  });

  ///uploads an image
  ///@param petId ID of pet to update
  ///@param additionalMetadata Additional data to pass to server
  ///@param file file to upload
  Future<chopper.Response<ApiResponse>> petPetIdUploadImagePost({
    required int? petId,
    String? additionalMetadata,
    List<int>? file,
    dynamic cacheControl,
  }) {
    generatedMapping.putIfAbsent(
      ApiResponse,
      () => ApiResponse.fromJsonFactory,
    );

    return _petPetIdUploadImagePost(
      petId: petId,
      additionalMetadata: additionalMetadata,
      file: file,
      cacheControl: cacheControl?.toString(),
    );
  }

  ///uploads an image
  ///@param petId ID of pet to update
  ///@param additionalMetadata Additional data to pass to server
  ///@param file file to upload
  @POST(
    path: '/pet/{petId}/uploadImage',
    optionalBody: true,
    includeNullQueryVars: true,
  )
  Future<chopper.Response<ApiResponse>> _petPetIdUploadImagePost({
    @Path('petId') required int? petId,
    @Field('additionalMetadata') String? additionalMetadata,
    @Field('file') List<int>? file,
    @Header('Cache-Control') String? cacheControl,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      summary: 'uploads an image',
      description: '',
      operationId: 'uploadFile',
      consumes: ["multipart/form-data"],
      produces: ["application/json"],
      security: ["petstore_auth"],
      tags: ["pet"],
      deprecated: false,
    ),
  });

  ///Returns pet inventories by status
  Future<chopper.Response<Object>> storeInventoryGet({
    dynamic apiKey,
    dynamic cacheControl,
  }) {
    return _storeInventoryGet(
      apiKey: apiKey?.toString(),
      cacheControl: cacheControl?.toString(),
    );
  }

  ///Returns pet inventories by status
  @GET(path: '/store/inventory', includeNullQueryVars: true)
  Future<chopper.Response<Object>> _storeInventoryGet({
    @Header('api_key') String? apiKey,
    @Header('Cache-Control') String? cacheControl,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      summary: 'Returns pet inventories by status',
      description: 'Returns a map of status codes to quantities',
      operationId: 'getInventory',
      consumes: [],
      produces: ["application/json"],
      security: ["api_key"],
      tags: ["store"],
      deprecated: false,
    ),
  });

  ///Place an order for a pet
  ///@param body order placed for purchasing the pet
  Future<chopper.Response<Order>> storeOrderPost({
    required Order? body,
    dynamic cacheControl,
  }) {
    generatedMapping.putIfAbsent(Order, () => Order.fromJsonFactory);

    return _storeOrderPost(body: body, cacheControl: cacheControl?.toString());
  }

  ///Place an order for a pet
  ///@param body order placed for purchasing the pet
  @POST(path: '/store/order', includeNullQueryVars: true)
  Future<chopper.Response<Order>> _storeOrderPost({
    @Body() required Order? body,
    @Header('Cache-Control') String? cacheControl,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      summary: 'Place an order for a pet',
      description: '',
      operationId: 'placeOrder',
      consumes: [],
      produces: ["application/xml", "application/json"],
      security: [],
      tags: ["store"],
      deprecated: false,
    ),
  });

  ///Find purchase order by ID
  ///@param orderId ID of pet that needs to be fetched
  Future<chopper.Response<Order>> storeOrderOrderIdGet({
    required int? orderId,
    dynamic cacheControl,
  }) {
    generatedMapping.putIfAbsent(Order, () => Order.fromJsonFactory);

    return _storeOrderOrderIdGet(
      orderId: orderId,
      cacheControl: cacheControl?.toString(),
    );
  }

  ///Find purchase order by ID
  ///@param orderId ID of pet that needs to be fetched
  @GET(path: '/store/order/{orderId}', includeNullQueryVars: true)
  Future<chopper.Response<Order>> _storeOrderOrderIdGet({
    @Path('orderId') required int? orderId,
    @Header('Cache-Control') String? cacheControl,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      summary: 'Find purchase order by ID',
      description:
          'For valid response try integer IDs with value >= 1 and <= 10.         Other values will generated exceptions',
      operationId: 'getOrderById',
      consumes: [],
      produces: ["application/xml", "application/json"],
      security: [],
      tags: ["store"],
      deprecated: false,
    ),
  });

  ///Delete purchase order by ID
  ///@param orderId ID of the order that needs to be deleted
  Future<chopper.Response> storeOrderOrderIdDelete({
    required int? orderId,
    dynamic cacheControl,
  }) {
    return _storeOrderOrderIdDelete(
      orderId: orderId,
      cacheControl: cacheControl?.toString(),
    );
  }

  ///Delete purchase order by ID
  ///@param orderId ID of the order that needs to be deleted
  @DELETE(path: '/store/order/{orderId}', includeNullQueryVars: true)
  Future<chopper.Response> _storeOrderOrderIdDelete({
    @Path('orderId') required int? orderId,
    @Header('Cache-Control') String? cacheControl,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      summary: 'Delete purchase order by ID',
      description:
          'For valid response try integer IDs with positive integer value.         Negative or non-integer values will generate API errors',
      operationId: 'deleteOrder',
      consumes: [],
      produces: ["application/xml", "application/json"],
      security: [],
      tags: ["store"],
      deprecated: false,
    ),
  });

  ///Create user
  ///@param body Created user object
  Future<chopper.Response> userPost({
    required User? body,
    dynamic cacheControl,
  }) {
    generatedMapping.putIfAbsent(User, () => User.fromJsonFactory);

    return _userPost(body: body, cacheControl: cacheControl?.toString());
  }

  ///Create user
  ///@param body Created user object
  @POST(path: '/user', includeNullQueryVars: true)
  Future<chopper.Response> _userPost({
    @Body() required User? body,
    @Header('Cache-Control') String? cacheControl,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      summary: 'Create user',
      description: 'This can only be done by the logged in user.',
      operationId: 'createUser',
      consumes: [],
      produces: ["application/xml", "application/json"],
      security: [],
      tags: ["user"],
      deprecated: false,
    ),
  });

  ///Creates list of users with given input array
  ///@param body List of user object
  Future<chopper.Response> userCreateWithArrayPost({
    required List<User>? body,
    dynamic cacheControl,
  }) {
    return _userCreateWithArrayPost(
      body: body,
      cacheControl: cacheControl?.toString(),
    );
  }

  ///Creates list of users with given input array
  ///@param body List of user object
  @POST(path: '/user/createWithArray', includeNullQueryVars: true)
  Future<chopper.Response> _userCreateWithArrayPost({
    @Body() required List<User>? body,
    @Header('Cache-Control') String? cacheControl,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      summary: 'Creates list of users with given input array',
      description: '',
      operationId: 'createUsersWithArrayInput',
      consumes: [],
      produces: ["application/xml", "application/json"],
      security: [],
      tags: ["user"],
      deprecated: false,
    ),
  });

  ///Creates list of users with given input array
  ///@param body List of user object
  Future<chopper.Response> userCreateWithListPost({
    required List<User>? body,
    dynamic cacheControl,
  }) {
    return _userCreateWithListPost(
      body: body,
      cacheControl: cacheControl?.toString(),
    );
  }

  ///Creates list of users with given input array
  ///@param body List of user object
  @POST(path: '/user/createWithList', includeNullQueryVars: true)
  Future<chopper.Response> _userCreateWithListPost({
    @Body() required List<User>? body,
    @Header('Cache-Control') String? cacheControl,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      summary: 'Creates list of users with given input array',
      description: '',
      operationId: 'createUsersWithListInput',
      consumes: [],
      produces: ["application/xml", "application/json"],
      security: [],
      tags: ["user"],
      deprecated: false,
    ),
  });

  ///Logs user into the system
  ///@param username The user name for login
  ///@param password The password for login in clear text
  Future<chopper.Response<String>> userLoginGet({
    required String? username,
    required String? password,
    dynamic cacheControl,
  }) {
    return _userLoginGet(
      username: username,
      password: password,
      cacheControl: cacheControl?.toString(),
    );
  }

  ///Logs user into the system
  ///@param username The user name for login
  ///@param password The password for login in clear text
  @GET(path: '/user/login', includeNullQueryVars: true)
  Future<chopper.Response<String>> _userLoginGet({
    @Query('username') required String? username,
    @Query('password') required String? password,
    @Header('Cache-Control') String? cacheControl,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      summary: 'Logs user into the system',
      description: '',
      operationId: 'loginUser',
      consumes: [],
      produces: ["application/xml", "application/json"],
      security: [],
      tags: ["user"],
      deprecated: false,
    ),
  });

  ///Logs out current logged in user session
  Future<chopper.Response> userLogoutGet({dynamic cacheControl}) {
    return _userLogoutGet(cacheControl: cacheControl?.toString());
  }

  ///Logs out current logged in user session
  @GET(path: '/user/logout', includeNullQueryVars: true)
  Future<chopper.Response> _userLogoutGet({
    @Header('Cache-Control') String? cacheControl,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      summary: 'Logs out current logged in user session',
      description: '',
      operationId: 'logoutUser',
      consumes: [],
      produces: ["application/xml", "application/json"],
      security: [],
      tags: ["user"],
      deprecated: false,
    ),
  });

  ///Get user by user name
  ///@param username The name that needs to be fetched. Use user1 for testing.
  Future<chopper.Response<User>> userUsernameGet({
    required String? username,
    dynamic cacheControl,
  }) {
    generatedMapping.putIfAbsent(User, () => User.fromJsonFactory);

    return _userUsernameGet(
      username: username,
      cacheControl: cacheControl?.toString(),
    );
  }

  ///Get user by user name
  ///@param username The name that needs to be fetched. Use user1 for testing.
  @GET(path: '/user/{username}', includeNullQueryVars: true)
  Future<chopper.Response<User>> _userUsernameGet({
    @Path('username') required String? username,
    @Header('Cache-Control') String? cacheControl,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      summary: 'Get user by user name',
      description: '',
      operationId: 'getUserByName',
      consumes: [],
      produces: ["application/xml", "application/json"],
      security: [],
      tags: ["user"],
      deprecated: false,
    ),
  });

  ///Updated user
  ///@param username name that need to be updated
  ///@param body Updated user object
  Future<chopper.Response> userUsernamePut({
    required String? username,
    required User? body,
    dynamic cacheControl,
  }) {
    generatedMapping.putIfAbsent(User, () => User.fromJsonFactory);

    return _userUsernamePut(
      username: username,
      body: body,
      cacheControl: cacheControl?.toString(),
    );
  }

  ///Updated user
  ///@param username name that need to be updated
  ///@param body Updated user object
  @PUT(path: '/user/{username}', includeNullQueryVars: true)
  Future<chopper.Response> _userUsernamePut({
    @Path('username') required String? username,
    @Body() required User? body,
    @Header('Cache-Control') String? cacheControl,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      summary: 'Updated user',
      description: 'This can only be done by the logged in user.',
      operationId: 'updateUser',
      consumes: [],
      produces: ["application/xml", "application/json"],
      security: [],
      tags: ["user"],
      deprecated: false,
    ),
  });

  ///Delete user
  ///@param username The name that needs to be deleted
  Future<chopper.Response> userUsernameDelete({
    required String? username,
    dynamic cacheControl,
  }) {
    return _userUsernameDelete(
      username: username,
      cacheControl: cacheControl?.toString(),
    );
  }

  ///Delete user
  ///@param username The name that needs to be deleted
  @DELETE(path: '/user/{username}', includeNullQueryVars: true)
  Future<chopper.Response> _userUsernameDelete({
    @Path('username') required String? username,
    @Header('Cache-Control') String? cacheControl,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      summary: 'Delete user',
      description: 'This can only be done by the logged in user.',
      operationId: 'deleteUser',
      consumes: [],
      produces: ["application/xml", "application/json"],
      security: [],
      tags: ["user"],
      deprecated: false,
    ),
  });
}

@JsonSerializable(explicitToJson: true)
class Category {
  const Category({this.id, this.name});

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  static const toJsonFactory = _$CategoryToJson;
  Map<String, dynamic> toJson() => _$CategoryToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'name', includeIfNull: false, defaultValue: '')
  final String? name;
  static const fromJsonFactory = _$CategoryFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Category &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      runtimeType.hashCode;
}

extension $CategoryExtension on Category {
  Category copyWith({int? id, String? name}) {
    return Category(id: id ?? this.id, name: name ?? this.name);
  }

  Category copyWithWrapped({Wrapped<int?>? id, Wrapped<String?>? name}) {
    return Category(
      id: (id != null ? id.value : this.id),
      name: (name != null ? name.value : this.name),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class User {
  const User({
    this.id,
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.phone,
    this.userStatus,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  static const toJsonFactory = _$UserToJson;
  Map<String, dynamic> toJson() => _$UserToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'username', includeIfNull: false, defaultValue: '')
  final String? username;
  @JsonKey(name: 'firstName', includeIfNull: false, defaultValue: '')
  final String? firstName;
  @JsonKey(name: 'lastName', includeIfNull: false, defaultValue: '')
  final String? lastName;
  @JsonKey(name: 'email', includeIfNull: false, defaultValue: '')
  final String? email;
  @JsonKey(name: 'password', includeIfNull: false, defaultValue: '')
  final String? password;
  @JsonKey(name: 'phone', includeIfNull: false, defaultValue: '')
  final String? phone;
  @JsonKey(name: 'userStatus', includeIfNull: false)
  final int? userStatus;
  static const fromJsonFactory = _$UserFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is User &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.username, username) ||
                const DeepCollectionEquality().equals(
                  other.username,
                  username,
                )) &&
            (identical(other.firstName, firstName) ||
                const DeepCollectionEquality().equals(
                  other.firstName,
                  firstName,
                )) &&
            (identical(other.lastName, lastName) ||
                const DeepCollectionEquality().equals(
                  other.lastName,
                  lastName,
                )) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality().equals(
                  other.password,
                  password,
                )) &&
            (identical(other.phone, phone) ||
                const DeepCollectionEquality().equals(other.phone, phone)) &&
            (identical(other.userStatus, userStatus) ||
                const DeepCollectionEquality().equals(
                  other.userStatus,
                  userStatus,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(username) ^
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(lastName) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(phone) ^
      const DeepCollectionEquality().hash(userStatus) ^
      runtimeType.hashCode;
}

extension $UserExtension on User {
  User copyWith({
    int? id,
    String? username,
    String? firstName,
    String? lastName,
    String? email,
    String? password,
    String? phone,
    int? userStatus,
  }) {
    return User(
      id: id ?? this.id,
      username: username ?? this.username,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      password: password ?? this.password,
      phone: phone ?? this.phone,
      userStatus: userStatus ?? this.userStatus,
    );
  }

  User copyWithWrapped({
    Wrapped<int?>? id,
    Wrapped<String?>? username,
    Wrapped<String?>? firstName,
    Wrapped<String?>? lastName,
    Wrapped<String?>? email,
    Wrapped<String?>? password,
    Wrapped<String?>? phone,
    Wrapped<int?>? userStatus,
  }) {
    return User(
      id: (id != null ? id.value : this.id),
      username: (username != null ? username.value : this.username),
      firstName: (firstName != null ? firstName.value : this.firstName),
      lastName: (lastName != null ? lastName.value : this.lastName),
      email: (email != null ? email.value : this.email),
      password: (password != null ? password.value : this.password),
      phone: (phone != null ? phone.value : this.phone),
      userStatus: (userStatus != null ? userStatus.value : this.userStatus),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Tag {
  const Tag({this.id, this.name});

  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  static const toJsonFactory = _$TagToJson;
  Map<String, dynamic> toJson() => _$TagToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'name', includeIfNull: false, defaultValue: '')
  final String? name;
  static const fromJsonFactory = _$TagFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Tag &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      runtimeType.hashCode;
}

extension $TagExtension on Tag {
  Tag copyWith({int? id, String? name}) {
    return Tag(id: id ?? this.id, name: name ?? this.name);
  }

  Tag copyWithWrapped({Wrapped<int?>? id, Wrapped<String?>? name}) {
    return Tag(
      id: (id != null ? id.value : this.id),
      name: (name != null ? name.value : this.name),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class ApiResponse {
  const ApiResponse({this.code, this.type, this.message});

  factory ApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseFromJson(json);

  static const toJsonFactory = _$ApiResponseToJson;
  Map<String, dynamic> toJson() => _$ApiResponseToJson(this);

  @JsonKey(name: 'code', includeIfNull: false)
  final int? code;
  @JsonKey(name: 'type', includeIfNull: false, defaultValue: '')
  final String? type;
  @JsonKey(name: 'message', includeIfNull: false, defaultValue: '')
  final String? message;
  static const fromJsonFactory = _$ApiResponseFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ApiResponse &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(message) ^
      runtimeType.hashCode;
}

extension $ApiResponseExtension on ApiResponse {
  ApiResponse copyWith({int? code, String? type, String? message}) {
    return ApiResponse(
      code: code ?? this.code,
      type: type ?? this.type,
      message: message ?? this.message,
    );
  }

  ApiResponse copyWithWrapped({
    Wrapped<int?>? code,
    Wrapped<String?>? type,
    Wrapped<String?>? message,
  }) {
    return ApiResponse(
      code: (code != null ? code.value : this.code),
      type: (type != null ? type.value : this.type),
      message: (message != null ? message.value : this.message),
    );
  }
}

String? orderStatusNullableToJson(enums.OrderStatus? orderStatus) {
  return orderStatus?.value;
}

String? orderStatusToJson(enums.OrderStatus orderStatus) {
  return orderStatus.value;
}

enums.OrderStatus orderStatusFromJson(
  Object? orderStatus, [
  enums.OrderStatus? defaultValue,
]) {
  return enums.OrderStatus.values.firstWhereOrNull(
        (e) =>
            e.value.toString().toLowerCase() ==
            orderStatus?.toString().toLowerCase(),
      ) ??
      defaultValue ??
      enums.OrderStatus.swaggerGeneratedUnknown;
}

enums.OrderStatus? orderStatusNullableFromJson(
  Object? orderStatus, [
  enums.OrderStatus? defaultValue,
]) {
  if (orderStatus == null) {
    return null;
  }
  return enums.OrderStatus.values.firstWhereOrNull(
        (e) =>
            e.value.toString().toLowerCase() ==
            orderStatus.toString().toLowerCase(),
      ) ??
      defaultValue;
}

String orderStatusExplodedListToJson(List<enums.OrderStatus>? orderStatus) {
  return orderStatus?.map((e) => e.value!).join(',') ?? '';
}

List<String> orderStatusListToJson(List<enums.OrderStatus>? orderStatus) {
  if (orderStatus == null) {
    return [];
  }

  return orderStatus.map((e) => e.value!).toList();
}

List<enums.OrderStatus> orderStatusListFromJson(
  List? orderStatus, [
  List<enums.OrderStatus>? defaultValue,
]) {
  if (orderStatus == null) {
    return defaultValue ?? [];
  }

  return orderStatus.map((e) => orderStatusFromJson(e.toString())).toList();
}

List<enums.OrderStatus>? orderStatusNullableListFromJson(
  List? orderStatus, [
  List<enums.OrderStatus>? defaultValue,
]) {
  if (orderStatus == null) {
    return defaultValue;
  }

  return orderStatus.map((e) => orderStatusFromJson(e.toString())).toList();
}

String? petStatusNullableToJson(enums.PetStatus? petStatus) {
  return petStatus?.value;
}

String? petStatusToJson(enums.PetStatus petStatus) {
  return petStatus.value;
}

enums.PetStatus petStatusFromJson(
  Object? petStatus, [
  enums.PetStatus? defaultValue,
]) {
  return enums.PetStatus.values.firstWhereOrNull(
        (e) =>
            e.value.toString().toLowerCase() ==
            petStatus?.toString().toLowerCase(),
      ) ??
      defaultValue ??
      enums.PetStatus.swaggerGeneratedUnknown;
}

enums.PetStatus? petStatusNullableFromJson(
  Object? petStatus, [
  enums.PetStatus? defaultValue,
]) {
  if (petStatus == null) {
    return null;
  }
  return enums.PetStatus.values.firstWhereOrNull(
        (e) =>
            e.value.toString().toLowerCase() ==
            petStatus.toString().toLowerCase(),
      ) ??
      defaultValue;
}

String petStatusExplodedListToJson(List<enums.PetStatus>? petStatus) {
  return petStatus?.map((e) => e.value!).join(',') ?? '';
}

List<String> petStatusListToJson(List<enums.PetStatus>? petStatus) {
  if (petStatus == null) {
    return [];
  }

  return petStatus.map((e) => e.value!).toList();
}

List<enums.PetStatus> petStatusListFromJson(
  List? petStatus, [
  List<enums.PetStatus>? defaultValue,
]) {
  if (petStatus == null) {
    return defaultValue ?? [];
  }

  return petStatus.map((e) => petStatusFromJson(e.toString())).toList();
}

List<enums.PetStatus>? petStatusNullableListFromJson(
  List? petStatus, [
  List<enums.PetStatus>? defaultValue,
]) {
  if (petStatus == null) {
    return defaultValue;
  }

  return petStatus.map((e) => petStatusFromJson(e.toString())).toList();
}

String? petFindByStatusGetStatusNullableToJson(
  enums.PetFindByStatusGetStatus? petFindByStatusGetStatus,
) {
  return petFindByStatusGetStatus?.value;
}

String? petFindByStatusGetStatusToJson(
  enums.PetFindByStatusGetStatus petFindByStatusGetStatus,
) {
  return petFindByStatusGetStatus.value;
}

enums.PetFindByStatusGetStatus petFindByStatusGetStatusFromJson(
  Object? petFindByStatusGetStatus, [
  enums.PetFindByStatusGetStatus? defaultValue,
]) {
  return enums.PetFindByStatusGetStatus.values.firstWhereOrNull(
        (e) =>
            e.value.toString().toLowerCase() ==
            petFindByStatusGetStatus?.toString().toLowerCase(),
      ) ??
      defaultValue ??
      enums.PetFindByStatusGetStatus.swaggerGeneratedUnknown;
}

enums.PetFindByStatusGetStatus? petFindByStatusGetStatusNullableFromJson(
  Object? petFindByStatusGetStatus, [
  enums.PetFindByStatusGetStatus? defaultValue,
]) {
  if (petFindByStatusGetStatus == null) {
    return null;
  }
  return enums.PetFindByStatusGetStatus.values.firstWhereOrNull(
        (e) =>
            e.value.toString().toLowerCase() ==
            petFindByStatusGetStatus.toString().toLowerCase(),
      ) ??
      defaultValue;
}

String petFindByStatusGetStatusExplodedListToJson(
  List<enums.PetFindByStatusGetStatus>? petFindByStatusGetStatus,
) {
  return petFindByStatusGetStatus?.map((e) => e.value!).join(',') ?? '';
}

List<String> petFindByStatusGetStatusListToJson(
  List<enums.PetFindByStatusGetStatus>? petFindByStatusGetStatus,
) {
  if (petFindByStatusGetStatus == null) {
    return [];
  }

  return petFindByStatusGetStatus.map((e) => e.value!).toList();
}

List<enums.PetFindByStatusGetStatus> petFindByStatusGetStatusListFromJson(
  List? petFindByStatusGetStatus, [
  List<enums.PetFindByStatusGetStatus>? defaultValue,
]) {
  if (petFindByStatusGetStatus == null) {
    return defaultValue ?? [];
  }

  return petFindByStatusGetStatus
      .map((e) => petFindByStatusGetStatusFromJson(e.toString()))
      .toList();
}

List<enums.PetFindByStatusGetStatus>?
petFindByStatusGetStatusNullableListFromJson(
  List? petFindByStatusGetStatus, [
  List<enums.PetFindByStatusGetStatus>? defaultValue,
]) {
  if (petFindByStatusGetStatus == null) {
    return defaultValue;
  }

  return petFindByStatusGetStatus
      .map((e) => petFindByStatusGetStatusFromJson(e.toString()))
      .toList();
}

typedef $JsonFactory<T> = T Function(Map<String, dynamic> json);

class $CustomJsonDecoder {
  $CustomJsonDecoder(this.factories);

  final Map<Type, $JsonFactory> factories;

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

    if (isTypeOf<T, Iterable>()) {
      return entity;
    }

    if (entity is Map<String, dynamic>) {
      return _decodeMap<T>(entity);
    }

    return entity;
  }

  T _decodeMap<T>(Map<String, dynamic> values) {
    final jsonFactory = factories[T];
    if (jsonFactory == null || jsonFactory is! $JsonFactory<T>) {
      return throw "Could not find factory for type $T. Is '$T: $T.fromJsonFactory' included in the CustomJsonDecoder instance creation in bootstrapper.dart?";
    }

    return jsonFactory(values);
  }

  List<T> _decodeList<T>(Iterable values) =>
      values.where((v) => v != null).map<T>((v) => decode<T>(v) as T).toList();
}

class $JsonSerializableConverter extends chopper.JsonConverter {
  @override
  FutureOr<chopper.Response<ResultType>> convertResponse<ResultType, Item>(
    chopper.Response response,
  ) async {
    if (response.bodyString.isEmpty) {
      // In rare cases, when let's say 204 (no content) is returned -
      // we cannot decode the missing json with the result type specified
      return chopper.Response(response.base, null, error: response.error);
    }

    if (ResultType == String) {
      return response.copyWith();
    }

    if (ResultType == DateTime) {
      return response.copyWith(
        body:
            DateTime.parse((response.body as String).replaceAll('"', ''))
                as ResultType,
      );
    }

    final jsonRes = await super.convertResponse(response);
    return jsonRes.copyWith<ResultType>(
      body: $jsonDecoder.decode<Item>(jsonRes.body) as ResultType,
    );
  }
}

final $jsonDecoder = $CustomJsonDecoder(generatedMapping);

// ignore: unused_element
String? _dateToJson(DateTime? date) {
  if (date == null) {
    return null;
  }

  final year = date.year.toString();
  final month = date.month < 10 ? '0${date.month}' : date.month.toString();
  final day = date.day < 10 ? '0${date.day}' : date.day.toString();

  return '$year-$month-$day';
}

class Wrapped<T> {
  final T value;
  const Wrapped.value(this.value);
}
