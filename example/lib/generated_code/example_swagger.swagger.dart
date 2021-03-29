import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:chopper/chopper.dart';
import 'package:chopper/chopper.dart' as chopper;
import 'example_swagger.enums.swagger.dart' as enums;
export 'example_swagger.enums.swagger.dart';

part 'example_swagger.swagger.chopper2.dart';
part 'example_swagger.swagger.g2.dart';

// **************************************************************************
// SwaggerChopperGenerator
// **************************************************************************

@ChopperApi()
abstract class ExampleSwagger extends ChopperService {
  static ExampleSwagger create([ChopperClient? client]) {
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
  Future<chopper.Response> addPet({@Body() @required Pet? body});

  ///Update an existing pet
  ///@param body Pet object that needs to be added to the store

  @Put(path: '/pet')
  Future<chopper.Response> updatePet({@Body() @required Pet? body});

  ///Finds Pets by status
  ///@param status Status values that need to be considered for filter
  ///@param color Status values that need to be considered for filter
  Future<Response<List<Pet>>> findPetsByStatus(
      {enums.PetFindByStatusGetStatus? status,
      List<enums.PetFindByStatusGetColor>? color}) {
    return _findPetsByStatus(
        status: enums.$PetFindByStatusGetStatusMap[status],
        color: color!.map((element) {
          enums.$PetFindByStatusGetColorMap[element];
        }).toList());
  }

  @Get(path: '/pet/findByStatus')
  Future<chopper.Response<List<Pet>>> _findPetsByStatus(
      {@Query('status') @required String? status,
      @Query('color') @required List<String?>? color});

  ///Finds Pets by tags
  ///@param tags Tags to filter by

  @Get(path: '/pet/findByTags')
  Future<chopper.Response<List<Pet>>> findPetsByTags(
      {@Query('tags') @required List<String>? tags});

  ///Find pet by ID
  ///@param petId ID of pet to return

  @Get(path: '/pet/{petId}')
  Future<chopper.Response<Pet>> getPetById(
      {@Path('petId') @required int? petId});

  ///Updates a pet in the store with form data
  ///@param petId ID of pet that needs to be updated
  ///@param name Updated name of the pet
  ///@param status Updated status of the pet
  ///@param body

  @Post(path: '/pet/{petId}')
  @FactoryConverter(request: FormUrlEncodedConverter.requestFactory)
  Future<chopper.Response> updatePetWithForm(
      {@Path('petId') @required int? petId,
      @Field('name') String? name,
      @Field('status') String? status,
      @Body() @required Object? body});

  ///Deletes a pet
  ///@param petId Pet id to delete

  @Delete(path: '/pet/{petId}')
  Future<chopper.Response> deletePet({@Path('petId') @required int? petId});

  ///uploads an image
  ///@param petId ID of pet to update
  ///@param additionalMetadata Additional data to pass to server
  ///@param file file to upload
  ///@param body

  @Post(path: '/pet/{petId}/uploadImage')
  @FactoryConverter(request: FormUrlEncodedConverter.requestFactory)
  Future<chopper.Response<ApiResponse>> uploadFile(
      {@Path('petId') @required int? petId,
      @Field('additionalMetadata') String? additionalMetadata,
      @Field('file') List<int>? file,
      @Body() @required Object? body});

  ///Returns pet inventories by status

  @Get(path: '/store/inventory')
  Future<chopper.Response<List<dynamic>>> getInventory();

  ///Place an order for a pet
  ///@param body order placed for purchasing the pet

  @Post(path: '/store/order')
  Future<chopper.Response<OrderWithDash>> placeOrder(
      {@Body() @required Order? body});

  ///Find purchase order by ID
  ///@param orderId ID of pet that needs to be fetched

  @Get(path: '/store/order/{orderId}')
  Future<chopper.Response<Order>> getOrderById(
      {@Path('orderId') @required int? orderId});

  ///Delete purchase order by ID
  ///@param orderId ID of the order that needs to be deleted

  @Delete(path: '/store/order/{orderId}')
  Future<chopper.Response> deleteOrder(
      {@Path('orderId') @required int? orderId});

  ///Create user
  ///@param body Created user object

  @Post(path: '/user')
  Future<chopper.Response> createUser({@Body() @required User? body});

  ///Creates list of users with given input array
  ///@param body List of user object

  @Post(path: '/user/createWithArray')
  Future<chopper.Response> createUsersWithArrayInput(
      {@Body() @required Object? body});

  ///Creates list of users with given input array
  ///@param body List of user object

  @Post(path: '/user/createWithList')
  Future<chopper.Response> createUsersWithListInput(
      {@Body() @required Object? body});

  ///Logs user into the system
  ///@param username The user name for login
  ///@param password The password for login in clear text

  @Get(path: '/user/login')
  Future<chopper.Response<String>> loginUser(
      {@Query('username') @required String? username,
      @Query('password') @required String? password});

  ///Logs out current logged in user session

  @Get(path: '/user/logout')
  Future<chopper.Response> logoutUser();

  ///Get user by user name
  ///@param username The name that needs to be fetched. Use user1 for testing.

  @Get(path: '/user/{username}')
  Future<chopper.Response<User>> getUserByName(
      {@Path('username') @required String? username});

  ///Updated user
  ///@param username name that need to be updated
  ///@param body Updated user object

  @Put(path: '/user/{username}')
  Future<chopper.Response> updateUser(
      {@Path('username') @required String? username,
      @Body() @required User? body});

  ///Delete user
  ///@param username The name that needs to be deleted

  @Delete(path: '/user/{username}')
  Future<chopper.Response> deleteUser(
      {@Path('username') @required String? username});
}

final Map<Type, Object Function(Map<String, dynamic>)>
    ExampleSwaggerJsonDecoderMappings = {
  Order: Order.fromJsonFactory,
  OrderWithDash: OrderWithDash.fromJsonFactory,
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
    this.shipDateTime,
    this.shipDate,
    this.status,
    this.complete,
  });

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  @JsonKey(name: 'id', includeIfNull: false, defaultValue: 36)
  final int? id;
  @JsonKey(name: 'petId', includeIfNull: false, defaultValue: 36)
  final int? petId;
  @JsonKey(name: 'quantity', includeIfNull: false, defaultValue: 36)
  final int? quantity;
  @JsonKey(name: 'shipDateTime', includeIfNull: false)
  final DateTime? shipDateTime;
  @JsonKey(name: 'shipDate', includeIfNull: false, toJson: _dateToJson)
  final DateTime? shipDate;
  @JsonKey(
      name: 'status',
      includeIfNull: false,
      toJson: orderStatusToJson,
      fromJson: orderStatusFromJson)
  final enums.OrderStatus? status;
  @JsonKey(name: 'complete', includeIfNull: false, defaultValue: false)
  final bool? complete;
  static const fromJsonFactory = _$OrderFromJson;
  static const toJsonFactory = _$OrderToJson;
  Map<String, dynamic> toJson() => _$OrderToJson(this);
}

extension $OrderExtension on Order {
  Order copyWith(
      {int? id,
      int? petId,
      int? quantity,
      DateTime? shipDateTime,
      DateTime? shipDate,
      enums.OrderStatus? status,
      bool? complete}) {
    return Order(
        id: id ?? this.id,
        petId: petId ?? this.petId,
        quantity: quantity ?? this.quantity,
        shipDateTime: shipDateTime ?? this.shipDateTime,
        shipDate: shipDate ?? this.shipDate,
        status: status ?? this.status,
        complete: complete ?? this.complete);
  }
}

@JsonSerializable(explicitToJson: true)
class OrderWithDash {
  OrderWithDash({
    this.id,
    this.petId,
    this.quantity,
    this.shipDate,
    this.status,
    this.complete,
  });

  factory OrderWithDash.fromJson(Map<String, dynamic> json) =>
      _$OrderWithDashFromJson(json);

  @JsonKey(name: 'id', includeIfNull: false, defaultValue: 36)
  final int? id;
  @JsonKey(name: 'petId', includeIfNull: false, defaultValue: 36)
  final int? petId;
  @JsonKey(name: 'quantity', includeIfNull: false, defaultValue: 36)
  final int? quantity;
  @JsonKey(name: 'shipDate', includeIfNull: false)
  final DateTime? shipDate;
  @JsonKey(
      name: 'status',
      includeIfNull: false,
      toJson: orderWithDashStatusToJson,
      fromJson: orderWithDashStatusFromJson)
  final enums.OrderWithDashStatus? status;
  @JsonKey(name: 'complete', includeIfNull: false, defaultValue: false)
  final bool? complete;
  static const fromJsonFactory = _$OrderWithDashFromJson;
  static const toJsonFactory = _$OrderWithDashToJson;
  Map<String, dynamic> toJson() => _$OrderWithDashToJson(this);
}

extension $OrderWithDashExtension on OrderWithDash {
  OrderWithDash copyWith(
      {int? id,
      int? petId,
      int? quantity,
      DateTime? shipDate,
      enums.OrderWithDashStatus? status,
      bool? complete}) {
    return OrderWithDash(
        id: id ?? this.id,
        petId: petId ?? this.petId,
        quantity: quantity ?? this.quantity,
        shipDate: shipDate ?? this.shipDate,
        status: status ?? this.status,
        complete: complete ?? this.complete);
  }
}

@JsonSerializable(explicitToJson: true)
class Category {
  Category({
    this.id,
    this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  @JsonKey(name: 'id', includeIfNull: false, defaultValue: 36)
  final int? id;
  @JsonKey(name: 'name', includeIfNull: false)
  final String? name;
  static const fromJsonFactory = _$CategoryFromJson;
  static const toJsonFactory = _$CategoryToJson;
  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

extension $CategoryExtension on Category {
  Category copyWith({int? id, String? name}) {
    return Category(id: id ?? this.id, name: name ?? this.name);
  }
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

  @JsonKey(name: 'id', includeIfNull: false, defaultValue: 36)
  final int? id;
  @JsonKey(name: 'username', includeIfNull: false)
  final String? username;
  @JsonKey(name: 'firstName', includeIfNull: false)
  final String? firstName;
  @JsonKey(name: 'lastName', includeIfNull: false)
  final String? lastName;
  @JsonKey(name: 'email', includeIfNull: false)
  final String? email;
  @JsonKey(name: 'password', includeIfNull: false)
  final String? password;
  @JsonKey(name: 'phone', includeIfNull: false)
  final String? phone;
  @JsonKey(name: 'userStatus', includeIfNull: false, defaultValue: 36)
  final int? userStatus;
  static const fromJsonFactory = _$UserFromJson;
  static const toJsonFactory = _$UserToJson;
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

extension $UserExtension on User {
  User copyWith(
      {int? id,
      String? username,
      String? firstName,
      String? lastName,
      String? email,
      String? password,
      String? phone,
      int? userStatus}) {
    return User(
        id: id ?? this.id,
        username: username ?? this.username,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        password: password ?? this.password,
        phone: phone ?? this.phone,
        userStatus: userStatus ?? this.userStatus);
  }
}

@JsonSerializable(explicitToJson: true)
class Tag {
  Tag({
    this.id,
    this.name,
  });

  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  @JsonKey(name: 'id', includeIfNull: false, defaultValue: 36)
  final int? id;
  @JsonKey(name: 'name', includeIfNull: false)
  final String? name;
  static const fromJsonFactory = _$TagFromJson;
  static const toJsonFactory = _$TagToJson;
  Map<String, dynamic> toJson() => _$TagToJson(this);
}

extension $TagExtension on Tag {
  Tag copyWith({int? id, String? name}) {
    return Tag(id: id ?? this.id, name: name ?? this.name);
  }
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

  @JsonKey(name: 'id', includeIfNull: false, defaultValue: 36)
  final int? id;
  @JsonKey(name: 'category', includeIfNull: false)
  final Category? category;
  @JsonKey(name: 'name', includeIfNull: false)
  final String? name;
  @JsonKey(name: 'photoUrls', includeIfNull: false, defaultValue: <String>[])
  final List<String?>? photoUrls;
  @JsonKey(name: 'tags', includeIfNull: false, defaultValue: <Tag>[])
  final List<Tag?>? tags;
  @JsonKey(
      name: 'status',
      includeIfNull: false,
      toJson: petStatusToJson,
      fromJson: petStatusFromJson)
  final enums.PetStatus? status;
  static const fromJsonFactory = _$PetFromJson;
  static const toJsonFactory = _$PetToJson;
  Map<String, dynamic> toJson() => _$PetToJson(this);
}

extension $PetExtension on Pet {
  Pet copyWith(
      {int? id,
      Category? category,
      String? name,
      List<String?>? photoUrls,
      List<Tag?>? tags,
      enums.PetStatus? status}) {
    return Pet(
        id: id ?? this.id,
        category: category ?? this.category,
        name: name ?? this.name,
        photoUrls: photoUrls ?? this.photoUrls,
        tags: tags ?? this.tags,
        status: status ?? this.status);
  }
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

  @JsonKey(name: 'code', includeIfNull: false, defaultValue: 36)
  final int? code;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  @JsonKey(name: 'message', includeIfNull: false)
  final String? message;
  static const fromJsonFactory = _$ApiResponseFromJson;
  static const toJsonFactory = _$ApiResponseToJson;
  Map<String, dynamic> toJson() => _$ApiResponseToJson(this);
}

extension $ApiResponseExtension on ApiResponse {
  ApiResponse copyWith({int? code, String? type, String? message}) {
    return ApiResponse(
        code: code ?? this.code,
        type: type ?? this.type,
        message: message ?? this.message);
  }
}

String? petFindByStatusGetStatusToJson(
    enums.PetFindByStatusGetStatus? petFindByStatusGetStatus) {
  return enums.$PetFindByStatusGetStatusMap[petFindByStatusGetStatus];
}

enums.PetFindByStatusGetStatus petFindByStatusGetStatusFromJson(
    String? petFindByStatusGetStatus) {
  if (petFindByStatusGetStatus == null) {
    return enums.PetFindByStatusGetStatus.swaggerGeneratedUnknown;
  }

  if (!enums.$PetFindByStatusGetStatusMap.entries
      .contains(petFindByStatusGetStatus)) {
    return enums.PetFindByStatusGetStatus.swaggerGeneratedUnknown;
  }

  return enums.$PetFindByStatusGetStatusMap.entries
      .firstWhere((element) => element.value == petFindByStatusGetStatus)
      .key;
}

List<String?> petFindByStatusGetStatusListToJson(
    List<enums.PetFindByStatusGetStatus>? petFindByStatusGetStatus) {
  if (petFindByStatusGetStatus == null) {
    return [];
  }

  return petFindByStatusGetStatus
      .map((e) => enums.$PetFindByStatusGetStatusMap[e])
      .toList();
}

List<enums.PetFindByStatusGetStatus?> petFindByStatusGetStatusListFromJson(
    List? petFindByStatusGetStatus) {
  if (petFindByStatusGetStatus == null) {
    return [];
  }

  return petFindByStatusGetStatus
      .map((e) => petFindByStatusGetStatusFromJson(e.toString()))
      .toList();
}

String? petFindByStatusGetColorToJson(
    enums.PetFindByStatusGetColor? petFindByStatusGetColor) {
  return enums.$PetFindByStatusGetColorMap[petFindByStatusGetColor];
}

enums.PetFindByStatusGetColor petFindByStatusGetColorFromJson(
    String? petFindByStatusGetColor) {
  if (petFindByStatusGetColor == null) {
    return enums.PetFindByStatusGetColor.swaggerGeneratedUnknown;
  }

  if (!enums.$PetFindByStatusGetColorMap.entries
      .contains(petFindByStatusGetColor)) {
    return enums.PetFindByStatusGetColor.swaggerGeneratedUnknown;
  }

  return enums.$PetFindByStatusGetColorMap.entries
      .firstWhere((element) => element.value == petFindByStatusGetColor)
      .key;
}

List<String?> petFindByStatusGetColorListToJson(
    List<enums.PetFindByStatusGetColor>? petFindByStatusGetColor) {
  if (petFindByStatusGetColor == null) {
    return [];
  }

  return petFindByStatusGetColor
      .map((e) => enums.$PetFindByStatusGetColorMap[e])
      .toList();
}

List<enums.PetFindByStatusGetColor?> petFindByStatusGetColorListFromJson(
    List? petFindByStatusGetColor) {
  if (petFindByStatusGetColor == null) {
    return [];
  }

  return petFindByStatusGetColor
      .map((e) => petFindByStatusGetColorFromJson(e.toString()))
      .toList();
}

String? orderStatusToJson(enums.OrderStatus? orderStatus) {
  return enums.$OrderStatusMap[orderStatus];
}

enums.OrderStatus orderStatusFromJson(String? orderStatus) {
  if (orderStatus == null) {
    return enums.OrderStatus.swaggerGeneratedUnknown;
  }

  if (!enums.$OrderStatusMap.entries.contains(orderStatus)) {
    return enums.OrderStatus.swaggerGeneratedUnknown;
  }

  return enums.$OrderStatusMap.entries
      .firstWhere((element) => element.value == orderStatus)
      .key;
}

List<String?> orderStatusListToJson(List<enums.OrderStatus>? orderStatus) {
  if (orderStatus == null) {
    return [];
  }

  return orderStatus.map((e) => enums.$OrderStatusMap[e]).toList();
}

List<enums.OrderStatus?> orderStatusListFromJson(List? orderStatus) {
  if (orderStatus == null) {
    return [];
  }

  return orderStatus.map((e) => orderStatusFromJson(e.toString())).toList();
}

String? orderWithDashStatusToJson(
    enums.OrderWithDashStatus? orderWithDashStatus) {
  return enums.$OrderWithDashStatusMap[orderWithDashStatus];
}

enums.OrderWithDashStatus orderWithDashStatusFromJson(
    String? orderWithDashStatus) {
  if (orderWithDashStatus == null) {
    return enums.OrderWithDashStatus.swaggerGeneratedUnknown;
  }

  if (!enums.$OrderWithDashStatusMap.entries.contains(orderWithDashStatus)) {
    return enums.OrderWithDashStatus.swaggerGeneratedUnknown;
  }

  return enums.$OrderWithDashStatusMap.entries
      .firstWhere((element) => element.value == orderWithDashStatus)
      .key;
}

List<String?> orderWithDashStatusListToJson(
    List<enums.OrderWithDashStatus>? orderWithDashStatus) {
  if (orderWithDashStatus == null) {
    return [];
  }

  return orderWithDashStatus
      .map((e) => enums.$OrderWithDashStatusMap[e])
      .toList();
}

List<enums.OrderWithDashStatus?> orderWithDashStatusListFromJson(
    List? orderWithDashStatus) {
  if (orderWithDashStatus == null) {
    return [];
  }

  return orderWithDashStatus
      .map((e) => orderWithDashStatusFromJson(e.toString()))
      .toList();
}

String? petStatusToJson(enums.PetStatus? petStatus) {
  return enums.$PetStatusMap[petStatus];
}

enums.PetStatus petStatusFromJson(String? petStatus) {
  if (petStatus == null) {
    return enums.PetStatus.swaggerGeneratedUnknown;
  }

  if (!enums.$PetStatusMap.entries.contains(petStatus)) {
    return enums.PetStatus.swaggerGeneratedUnknown;
  }

  return enums.$PetStatusMap.entries
      .firstWhere((element) => element.value == petStatus)
      .key;
}

List<String?> petStatusListToJson(List<enums.PetStatus>? petStatus) {
  if (petStatus == null) {
    return [];
  }

  return petStatus.map((e) => enums.$PetStatusMap[e]).toList();
}

List<enums.PetStatus?> petStatusListFromJson(List? petStatus) {
  if (petStatus == null) {
    return [];
  }

  return petStatus.map((e) => petStatusFromJson(e.toString())).toList();
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

String? _dateToJson(DateTime? date) {
  if (date == null) {
    return null;
  }

  final year = date.year.toString();
  final month = date.month < 10 ? '0${date.month}' : date.month.toString();
  final day = date.day < 10 ? '0${date.day}' : date.day.toString();

  return '$year-$month-$day';
}
