import 'package:json_annotation/json_annotation.dart';
import 'package:chopper/chopper.dart';
import 'package:chopper/chopper.dart' as chopper;
import 'package:flutter/widgets.dart';

import 'package:example/generated_code/example_swagger.enums.swagger.dart'
    as enums;

part 'example_swagger.swagger.chopper2.dart';
part 'example_swagger.swagger.g2.dart';

// **************************************************************************
// SwaggerChopperGenerator
// **************************************************************************

@ChopperApi()
abstract class ExampleSwagger extends ChopperService {
  static ExampleSwagger create([ChopperClient client]) {
    if (client != null) {
      return _$ExampleSwagger(client);
    }

    final newClient = ChopperClient(
        services: [_$ExampleSwagger()],
        converter: JsonSerializableConverter(),
        baseUrl: 'https://petstore.swagger.io/v2');
    return _$ExampleSwagger(newClient);
  }

  ///Add a new pet to the store
  ///@param body Pet object that needs to be added to the store

  @Post(path: '/pet')
  Future<Response> addPet({@Body() @required Pet body});

  ///Update an existing pet
  ///@param body Pet object that needs to be added to the store

  @Put(path: '/pet')
  Future<Response> updatePet({@Body() @required Pet body});

  ///Finds Pets by status
  ///@param status Status values that need to be considered for filter
  ///@param color Status values that need to be considered for filter
  Future<Response<List<Pet>>> findPetsByStatus(
      {enums.PetFindByStatusGetStatus status,
      List<enums.PetFindByStatusGetColor> color}) {
    return _findPetsByStatus(
        status: enums.$PetFindByStatusGetStatusMap[status],
        color: color.map((element) {
          enums.$PetFindByStatusGetColorMap[element];
        }).toList());
  }

  @Get(path: '/pet/findByStatus')
  Future<Response<List<Pet>>> _findPetsByStatus(
      {@Query('status') @required String status,
      @Query('color') @required List<String> color});

  ///Finds Pets by tags
  ///@param tags Tags to filter by

  @Get(path: '/pet/findByTags')
  Future<Response<List<Pet>>> findPetsByTags(
      {@Query('tags') @required List<String> tags});

  ///Find pet by ID
  ///@param petId ID of pet to return

  @Get(path: '/pet/{petId}')
  Future<Response<Pet>> getPetById({@Path('petId') @required int petId});

  ///Updates a pet in the store with form data
  ///@param petId ID of pet that needs to be updated
  ///@param name Updated name of the pet
  ///@param status Updated status of the pet

  @Post(path: '/pet/{petId}')
  @FactoryConverter(request: FormUrlEncodedConverter.requestFactory)
  Future<Response> updatePetWithForm(
      {@Path('petId') @required int petId,
      @Field('name') String name,
      @Field('status') String status});

  ///Deletes a pet
  ///@param petId Pet id to delete

  @Delete(path: '/pet/{petId}')
  Future<Response> deletePet({@Path('petId') @required int petId});

  ///uploads an image
  ///@param petId ID of pet to update
  ///@param additionalMetadata Additional data to pass to server
  ///@param file file to upload

  @Post(path: '/pet/{petId}/uploadImage')
  @FactoryConverter(request: FormUrlEncodedConverter.requestFactory)
  Future<Response<ApiResponse>> uploadFile(
      {@Path('petId') @required int petId,
      @Field('additionalMetadata') String additionalMetadata,
      @Field('file') List<int> file});

  ///Returns pet inventories by status

  @Get(path: '/store/inventory')
  Future<Response<List<dynamic>>> getInventory();

  ///Place an order for a pet
  ///@param body order placed for purchasing the pet

  @Post(path: '/store/order')
  Future<Response<Order>> placeOrder({@Body() @required Order body});

  ///Find purchase order by ID
  ///@param orderId ID of pet that needs to be fetched

  @Get(path: '/store/order/{orderId}')
  Future<Response<Order>> getOrderById(
      {@Path('orderId') @required int orderId});

  ///Delete purchase order by ID
  ///@param orderId ID of the order that needs to be deleted

  @Delete(path: '/store/order/{orderId}')
  Future<Response> deleteOrder({@Path('orderId') @required int orderId});

  ///Create user
  ///@param body Created user object

  @Post(path: '/user')
  Future<Response> createUser({@Body() @required User body});

  ///Creates list of users with given input array
  ///@param body List of user object

  @Post(path: '/user/createWithArray')
  Future<Response> createUsersWithArrayInput({@Body() @required String body});

  ///Creates list of users with given input array
  ///@param body List of user object

  @Post(path: '/user/createWithList')
  Future<Response> createUsersWithListInput({@Body() @required String body});

  ///Logs user into the system
  ///@param username The user name for login
  ///@param password The password for login in clear text

  @Get(path: '/user/login')
  Future<Response<String>> loginUser(
      {@Query('username') @required String username,
      @Query('password') @required String password});

  ///Logs out current logged in user session

  @Get(path: '/user/logout')
  Future<Response> logoutUser();

  ///Get user by user name
  ///@param username The name that needs to be fetched. Use user1 for testing.

  @Get(path: '/user/{username}')
  Future<Response<User>> getUserByName(
      {@Path('username') @required String username});

  ///Updated user
  ///@param username name that need to be updated
  ///@param body Updated user object

  @Put(path: '/user/{username}')
  Future<Response> updateUser(
      {@Path('username') @required String username,
      @Body() @required User body});

  ///Delete user
  ///@param username The name that needs to be deleted

  @Delete(path: '/user/{username}')
  Future<Response> deleteUser({@Path('username') @required String username});
}

final Map<Type, Object Function(Map<String, dynamic>)>
    ExampleSwaggerJsonDecoderMappings = {
  Order: Order.fromJsonFactory,
  Category: Category.fromJsonFactory,
  User: User.fromJsonFactory,
  Tag: Tag.fromJsonFactory,
  Pet: Pet.fromJsonFactory,
  ApiResponse: ApiResponse.fromJsonFactory,
};

@JsonSerializable(explicitToJson: true)
class Order {
  Order({
    this.id,
    this.petId,
    this.quantity,
    this.shipDate,
    this.status,
    this.complete,
  });

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  @JsonKey(name: 'id', defaultValue: 36)
  final int id;
  @JsonKey(name: 'petId', defaultValue: 36)
  final int petId;
  @JsonKey(name: 'quantity', defaultValue: 36)
  final int quantity;
  @JsonKey(name: 'shipDate')
  final DateTime shipDate;
  @JsonKey(
      name: 'status',
      unknownEnumValue: enums.OrderStatus.swaggerGeneratedUnknown,
      toJson: orderStatusToJson,
      fromJson: orderStatusFromJson)
  final enums.OrderStatus status;
  @JsonKey(name: 'complete')
  final bool complete;
  static const fromJsonFactory = _$OrderFromJson;
  static const toJsonFactory = _$OrderToJson;
  Map<String, dynamic> toJson() => _$OrderToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Category {
  Category({
    this.id,
    this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  @JsonKey(name: 'id', defaultValue: 36)
  final int id;
  @JsonKey(name: 'name')
  final String name;
  static const fromJsonFactory = _$CategoryFromJson;
  static const toJsonFactory = _$CategoryToJson;
  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class User {
  User({
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

  @JsonKey(name: 'id', defaultValue: 36)
  final int id;
  @JsonKey(name: 'username')
  final String username;
  @JsonKey(name: 'firstName')
  final String firstName;
  @JsonKey(name: 'lastName')
  final String lastName;
  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'password')
  final String password;
  @JsonKey(name: 'phone')
  final String phone;
  @JsonKey(name: 'userStatus', defaultValue: 36)
  final int userStatus;
  static const fromJsonFactory = _$UserFromJson;
  static const toJsonFactory = _$UserToJson;
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Tag {
  Tag({
    this.id,
    this.name,
  });

  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  @JsonKey(name: 'id', defaultValue: 36)
  final int id;
  @JsonKey(name: 'name')
  final String name;
  static const fromJsonFactory = _$TagFromJson;
  static const toJsonFactory = _$TagToJson;
  Map<String, dynamic> toJson() => _$TagToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Pet {
  Pet({
    this.id,
    this.category,
    this.name,
    this.photoUrls,
    this.tags,
    this.status,
  });

  factory Pet.fromJson(Map<String, dynamic> json) => _$PetFromJson(json);

  @JsonKey(name: 'id', defaultValue: 36)
  final int id;
  @JsonKey(name: 'category')
  final Category category;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'photoUrls', defaultValue: <String>[])
  final List<String> photoUrls;
  @JsonKey(name: 'tags', defaultValue: <Tag>[])
  final List<Tag> tags;
  @JsonKey(
      name: 'status',
      unknownEnumValue: enums.PetStatus.swaggerGeneratedUnknown,
      toJson: petStatusToJson,
      fromJson: petStatusFromJson)
  final enums.PetStatus status;
  static const fromJsonFactory = _$PetFromJson;
  static const toJsonFactory = _$PetToJson;
  Map<String, dynamic> toJson() => _$PetToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ApiResponse {
  ApiResponse({
    this.code,
    this.type,
    this.message,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseFromJson(json);

  @JsonKey(name: 'code', defaultValue: 36)
  final int code;
  @JsonKey(name: 'type')
  final String type;
  @JsonKey(name: 'message')
  final String message;
  static const fromJsonFactory = _$ApiResponseFromJson;
  static const toJsonFactory = _$ApiResponseToJson;
  Map<String, dynamic> toJson() => _$ApiResponseToJson(this);
}

String petFindByStatusGetStatusToJson(
    enums.PetFindByStatusGetStatus petFindByStatusGetStatus) {
  return enums.$PetFindByStatusGetStatusMap[petFindByStatusGetStatus];
}

enums.PetFindByStatusGetStatus petFindByStatusGetStatusFromJson(
    String petFindByStatusGetStatus) {
  return enums.PetFindByStatusGetStatus.swaggerGeneratedUnknown;
}

String petFindByStatusGetColorToJson(
    enums.PetFindByStatusGetColor petFindByStatusGetColor) {
  return enums.$PetFindByStatusGetColorMap[petFindByStatusGetColor];
}

enums.PetFindByStatusGetColor petFindByStatusGetColorFromJson(
    String petFindByStatusGetColor) {
  return enums.PetFindByStatusGetColor.swaggerGeneratedUnknown;
}

String orderStatusToJson(enums.OrderStatus orderStatus) {
  return enums.$OrderStatusMap[orderStatus];
}

enums.OrderStatus orderStatusFromJson(String orderStatus) {
  return enums.OrderStatus.swaggerGeneratedUnknown;
}

String petStatusToJson(enums.PetStatus petStatus) {
  return enums.$PetStatusMap[petStatus];
}

enums.PetStatus petStatusFromJson(String petStatus) {
  return enums.PetStatus.swaggerGeneratedUnknown;
}

typedef JsonFactory<T> = T Function(Map<String, dynamic> json);

class CustomJsonDecoder {
  CustomJsonDecoder(this.factories);

  final Map<Type, JsonFactory> factories;

  dynamic decode<T>(dynamic entity) {
    if (entity is Iterable) {
      return _decodeList<T>(entity);
    }

    if (entity is T) {
      return entity;
    }

    if (entity is Map<String, dynamic>) {
      return _decodeMap<T>(entity);
    }

    return entity;
  }

  T _decodeMap<T>(Map<String, dynamic> values) {
    final jsonFactory = factories[T];
    if (jsonFactory == null || jsonFactory is! JsonFactory<T>) {
      return throw "Could not find factory for type $T. Is '$T: $T.fromJsonFactory' included in the CustomJsonDecoder instance creation in bootstrapper.dart?";
    }

    return jsonFactory(values) as T;
  }

  List<T> _decodeList<T>(Iterable values) =>
      values.where((v) => v != null).map<T>((v) => decode<T>(v) as T).toList();
}

class JsonSerializableConverter extends chopper.JsonConverter {
  @override
  chopper.Response<ResultType> convertResponse<ResultType, Item>(
      chopper.Response response) {
    if (response.bodyString.isEmpty) {
      // In rare cases, when let's say 204 (no content) is returned -
      // we cannot decode the missing json with the result type specified
      return chopper.Response(response.base, null, error: response.error);
    }

    final jsonRes = super.convertResponse(response);
    return jsonRes.copyWith<ResultType>(
        body: jsonDecoder.decode<Item>(jsonRes.body) as ResultType);
  }
}

final jsonDecoder = CustomJsonDecoder(ExampleSwaggerJsonDecoderMappings);
