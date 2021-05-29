import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:chopper/chopper.dart';
import 'package:chopper/chopper.dart' as chopper;
import 'example_swagger.enums.swagger.dart' as enums;
export 'example_swagger.enums.swagger.dart';

part 'example_swagger.swagger.chopper.dart';
part 'example_swagger.swagger.g.dart';

// **************************************************************************
// SwaggerChopperGenerator
// **************************************************************************

// **************************************************************************
// SwaggerChopperGenerator
// **************************************************************************

@ChopperApi()
abstract class ExampleSwagger extends ChopperService {
  ExampleSwagger create([ChopperClient? client]) {
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
  Future<chopper.Response<PetPetPost$Response>> petPost(
      {@Body() required Pet? body});

  ///Update an existing pet
  ///@param body Pet object that needs to be added to the store
  @Put(path: '/pet')
  Future<chopper.Response> petPut({@Body() required Pet? body});

  ///Finds Pets by status
  ///@param status Status values that need to be considered for filter
  ///@param color Status values that need to be considered for filter
  @Get(path: '/pet/findByStatus')
  Future<chopper.Response<List<Pet>>> petFindByStatusGet(
      {@Query() required enums.PetFindByStatus$Get$Status? status,
      @Query() required enums.PetFindByStatus$Get$Color? color});

  ///Finds Pets by tags
  ///@param tags Tags to filter by
  @Get(path: '/pet/findByTags')
  Future<chopper.Response<List<Pet>>> petFindByTagsGet(
      {@Query() required List<String>? tags});

  ///Find pet by ID
  ///@param petId ID of pet to return
  @Get(path: '/pet/{petId}')
  Future<chopper.Response<Pet>> petPetIdGet(
      {@Path('petId') required int? petId});

  ///Updates a pet in the store with form data
  ///@param petId ID of pet that needs to be updated
  ///@param name Updated name of the pet
  ///@param status Updated status of the pet
  @Post(path: '/pet/{petId}')
  Future<chopper.Response> petPetIdPost(
      {@Path('petId') required int? petId,
      @Field() required String? name,
      @Field() required String? status});

  ///Deletes a pet
  ///@param api_key
  ///@param petId Pet id to delete
  @Delete(path: '/pet/{petId}')
  Future<chopper.Response> petPetIdDelete(
      {@Header() required String? api_key, @Path('petId') required int? petId});

  ///uploads an image
  ///@param petId ID of pet to update
  ///@param additionalMetadata Additional data to pass to server
  ///@param file file to upload
  @Post(path: '/pet/{petId}/uploadImage')
  Future<chopper.Response<ApiResponse>> petPetIdUploadImagePost(
      {@Path('petId') required int? petId,
      @Field() required String? additionalMetadata,
      @Field() required List<String>? file});

  ///Returns pet inventories by status
  @Get(path: '/store/inventory')
  Future<chopper.Response<List<dynamic>>> storeInventoryGet();

  ///Place an order for a pet
  ///@param body order placed for purchasing the pet
  @Post(path: '/store/order')
  Future<chopper.Response<OrderWithDash>> storeOrderPost(
      {@Body() required Order? body});

  ///Find purchase order by ID
  ///@param orderId ID of pet that needs to be fetched
  @Get(path: '/store/order/{orderId}')
  Future<chopper.Response<Order>> storeOrderOrderIdGet(
      {@Path('orderId') required int? orderId});

  ///Delete purchase order by ID
  ///@param orderId ID of the order that needs to be deleted
  @Delete(path: '/store/order/{orderId}')
  Future<chopper.Response> storeOrderOrderIdDelete(
      {@Path('orderId') required int? orderId});

  ///Create user
  ///@param body Created user object
  @Post(path: '/user')
  Future<chopper.Response> userPost({@Body() required User? body});

  ///Creates list of users with given input array
  ///@param body List of user object
  @Post(path: '/user/createWithArray')
  Future<chopper.Response> userCreateWithArrayPost(
      {@Body() required List<User>? body});

  ///Creates list of users with given input array
  ///@param body List of user object
  @Post(path: '/user/createWithList')
  Future<chopper.Response> userCreateWithListPost(
      {@Body() required List<User>? body});

  ///Logs user into the system
  ///@param username The user name for login
  ///@param password The password for login in clear text
  @Get(path: '/user/login')
  Future<chopper.Response<String>> userLoginGet(
      {@Query() required String? username, @Query() required String? password});

  ///Logs out current logged in user session
  @Get(path: '/user/logout')
  Future<chopper.Response> userLogoutGet();

  ///Get user by user name
  ///@param username The name that needs to be fetched. Use user1 for testing.
  @Get(path: '/user/{username}')
  Future<chopper.Response<User>> userUsernameGet(
      {@Path('username') required String? username});

  ///Updated user
  ///@param username name that need to be updated
  ///@param body Updated user object
  @Put(path: '/user/{username}')
  Future<chopper.Response> userUsernamePut(
      {@Path('username') required String? username,
      @Body() required User? body});

  ///Delete user
  ///@param username The name that needs to be deleted
  @Delete(path: '/user/{username}')
  Future<chopper.Response> userUsernameDelete(
      {@Path('username') required String? username});
}

final Map<Type, Object Function(Map<String, dynamic>)>
    ExampleSwaggerJsonDecoderMappings = {
  OrderDto: OrderDto.fromJsonFactory,
  OrderWithDashDto: OrderWithDashDto.fromJsonFactory,
  CategoryDto: CategoryDto.fromJsonFactory,
  UserDto: UserDto.fromJsonFactory,
  TagDto: TagDto.fromJsonFactory,
  PetDto: PetDto.fromJsonFactory,
  ApiResponseDto: ApiResponseDto.fromJsonFactory,
  PetPost$ResponseDto: PetPost$ResponseDto.fromJsonFactory,
};

@JsonSerializable(explicitToJson: true)
class OrderDto {
  OrderDto({
    this.id,
    this.petId,
    this.quantity,
    this.shipDateTime,
    this.shipDate,
    this.status,
    this.complete,
  });

  factory OrderDto.fromJson(Map<String, dynamic> json) =>
      _$OrderDtoFromJson(json);

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
  static const fromJsonFactory = _$OrderDtoFromJson;
  static const toJsonFactory = _$OrderDtoToJson;
  Map<String, dynamic> toJson() => _$OrderDtoToJson(this);
}

extension $OrderDtoExtension on OrderDto {
  OrderDto copyWith(
      {int? id,
      int? petId,
      int? quantity,
      DateTime? shipDateTime,
      DateTime? shipDate,
      enums.OrderStatus? status,
      bool? complete}) {
    return OrderDto(
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
class OrderWithDashDto {
  OrderWithDashDto({
    this.id,
    this.petId,
    this.quantity,
    this.shipDate,
    this.status,
    this.complete,
  });

  factory OrderWithDashDto.fromJson(Map<String, dynamic> json) =>
      _$OrderWithDashDtoFromJson(json);

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
  static const fromJsonFactory = _$OrderWithDashDtoFromJson;
  static const toJsonFactory = _$OrderWithDashDtoToJson;
  Map<String, dynamic> toJson() => _$OrderWithDashDtoToJson(this);
}

extension $OrderWithDashDtoExtension on OrderWithDashDto {
  OrderWithDashDto copyWith(
      {int? id,
      int? petId,
      int? quantity,
      DateTime? shipDate,
      enums.OrderWithDashStatus? status,
      bool? complete}) {
    return OrderWithDashDto(
        id: id ?? this.id,
        petId: petId ?? this.petId,
        quantity: quantity ?? this.quantity,
        shipDate: shipDate ?? this.shipDate,
        status: status ?? this.status,
        complete: complete ?? this.complete);
  }
}

@JsonSerializable(explicitToJson: true)
class CategoryDto {
  CategoryDto({
    this.id,
    this.name,
  });

  factory CategoryDto.fromJson(Map<String, dynamic> json) =>
      _$CategoryDtoFromJson(json);

  @JsonKey(name: 'id', includeIfNull: false, defaultValue: 36)
  final int? id;
  @JsonKey(name: 'name', includeIfNull: false, defaultValue: '')
  final String? name;
  static const fromJsonFactory = _$CategoryDtoFromJson;
  static const toJsonFactory = _$CategoryDtoToJson;
  Map<String, dynamic> toJson() => _$CategoryDtoToJson(this);
}

extension $CategoryDtoExtension on CategoryDto {
  CategoryDto copyWith({int? id, String? name}) {
    return CategoryDto(id: id ?? this.id, name: name ?? this.name);
  }
}

@JsonSerializable(explicitToJson: true)
class UserDto {
  UserDto({
    this.id,
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.phone,
    this.userStatus,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  @JsonKey(name: 'id', includeIfNull: false, defaultValue: 36)
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
  @JsonKey(name: 'userStatus', includeIfNull: false, defaultValue: 36)
  final int? userStatus;
  static const fromJsonFactory = _$UserDtoFromJson;
  static const toJsonFactory = _$UserDtoToJson;
  Map<String, dynamic> toJson() => _$UserDtoToJson(this);
}

extension $UserDtoExtension on UserDto {
  UserDto copyWith(
      {int? id,
      String? username,
      String? firstName,
      String? lastName,
      String? email,
      String? password,
      String? phone,
      int? userStatus}) {
    return UserDto(
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
class TagDto {
  TagDto({
    this.id,
    this.name,
  });

  factory TagDto.fromJson(Map<String, dynamic> json) => _$TagDtoFromJson(json);

  @JsonKey(name: 'id', includeIfNull: false, defaultValue: 36)
  final int? id;
  @JsonKey(name: 'name', includeIfNull: false, defaultValue: '')
  final String? name;
  static const fromJsonFactory = _$TagDtoFromJson;
  static const toJsonFactory = _$TagDtoToJson;
  Map<String, dynamic> toJson() => _$TagDtoToJson(this);
}

extension $TagDtoExtension on TagDto {
  TagDto copyWith({int? id, String? name}) {
    return TagDto(id: id ?? this.id, name: name ?? this.name);
  }
}

@JsonSerializable(explicitToJson: true)
class PetDto {
  PetDto({
    this.id,
    this.category,
    this.name,
    this.photoUrls,
    this.tags,
    this.status,
  });

  factory PetDto.fromJson(Map<String, dynamic> json) => _$PetDtoFromJson(json);

  @JsonKey(name: 'id', includeIfNull: false, defaultValue: 36)
  final int? id;
  @JsonKey(name: 'category', includeIfNull: false)
  final CategoryDto? category;
  @JsonKey(name: 'name', includeIfNull: false, defaultValue: '')
  final String? name;
  @JsonKey(name: 'photoUrls', includeIfNull: false, defaultValue: <String>[])
  final List<String>? photoUrls;
  @JsonKey(name: 'tags', includeIfNull: false, defaultValue: <TagDto>[])
  final List<TagDto>? tags;
  @JsonKey(
      name: 'status',
      includeIfNull: false,
      toJson: petStatusToJson,
      fromJson: petStatusFromJson)
  final enums.PetStatus? status;
  static const fromJsonFactory = _$PetDtoFromJson;
  static const toJsonFactory = _$PetDtoToJson;
  Map<String, dynamic> toJson() => _$PetDtoToJson(this);
}

extension $PetDtoExtension on PetDto {
  PetDto copyWith(
      {int? id,
      CategoryDto? category,
      String? name,
      List<String>? photoUrls,
      List<TagDto>? tags,
      enums.PetStatus? status}) {
    return PetDto(
        id: id ?? this.id,
        category: category ?? this.category,
        name: name ?? this.name,
        photoUrls: photoUrls ?? this.photoUrls,
        tags: tags ?? this.tags,
        status: status ?? this.status);
  }
}

@JsonSerializable(explicitToJson: true)
class ApiResponseDto {
  ApiResponseDto({
    this.code,
    this.type,
    this.message,
  });

  factory ApiResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseDtoFromJson(json);

  @JsonKey(name: 'code', includeIfNull: false, defaultValue: 36)
  final int? code;
  @JsonKey(name: 'type', includeIfNull: false, defaultValue: '')
  final String? type;
  @JsonKey(name: 'message', includeIfNull: false, defaultValue: '')
  final String? message;
  static const fromJsonFactory = _$ApiResponseDtoFromJson;
  static const toJsonFactory = _$ApiResponseDtoToJson;
  Map<String, dynamic> toJson() => _$ApiResponseDtoToJson(this);
}

extension $ApiResponseDtoExtension on ApiResponseDto {
  ApiResponseDto copyWith({int? code, String? type, String? message}) {
    return ApiResponseDto(
        code: code ?? this.code,
        type: type ?? this.type,
        message: message ?? this.message);
  }
}

@JsonSerializable(explicitToJson: true)
class PetPost$ResponseDto {
  PetPost$ResponseDto({
    this.id,
    this.petId,
  });

  factory PetPost$ResponseDto.fromJson(Map<String, dynamic> json) =>
      _$PetPost$ResponseDtoFromJson(json);

  @JsonKey(name: 'id', includeIfNull: false, defaultValue: 36)
  final int? id;
  @JsonKey(name: 'petId', includeIfNull: false, defaultValue: 36)
  final int? petId;
  static const fromJsonFactory = _$PetPost$ResponseDtoFromJson;
  static const toJsonFactory = _$PetPost$ResponseDtoToJson;
  Map<String, dynamic> toJson() => _$PetPost$ResponseDtoToJson(this);
}

extension $PetPost$ResponseDtoExtension on PetPost$ResponseDto {
  PetPost$ResponseDto copyWith({int? id, int? petId}) {
    return PetPost$ResponseDto(id: id ?? this.id, petId: petId ?? this.petId);
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

  return enums.$PetFindByStatusGetStatusMap.entries
      .firstWhere((element) => element.value == petFindByStatusGetStatus,
          orElse: () => const MapEntry(
              enums.PetFindByStatusGetStatus.swaggerGeneratedUnknown, ''))
      .key;
}

List<String> petFindByStatusGetStatusListToJson(
    List<enums.PetFindByStatusGetStatus>? petFindByStatusGetStatus) {
  if (petFindByStatusGetStatus == null) {
    return [];
  }

  return petFindByStatusGetStatus
      .map((e) => enums.$PetFindByStatusGetStatusMap[e]!)
      .toList();
}

List<enums.PetFindByStatusGetStatus> petFindByStatusGetStatusListFromJson(
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

  return enums.$PetFindByStatusGetColorMap.entries
      .firstWhere((element) => element.value == petFindByStatusGetColor,
          orElse: () => const MapEntry(
              enums.PetFindByStatusGetColor.swaggerGeneratedUnknown, ''))
      .key;
}

List<String> petFindByStatusGetColorListToJson(
    List<enums.PetFindByStatusGetColor>? petFindByStatusGetColor) {
  if (petFindByStatusGetColor == null) {
    return [];
  }

  return petFindByStatusGetColor
      .map((e) => enums.$PetFindByStatusGetColorMap[e]!)
      .toList();
}

List<enums.PetFindByStatusGetColor> petFindByStatusGetColorListFromJson(
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

  return enums.$OrderStatusMap.entries
      .firstWhere((element) => element.value == orderStatus,
          orElse: () =>
              const MapEntry(enums.OrderStatus.swaggerGeneratedUnknown, ''))
      .key;
}

List<String> orderStatusListToJson(List<enums.OrderStatus>? orderStatus) {
  if (orderStatus == null) {
    return [];
  }

  return orderStatus.map((e) => enums.$OrderStatusMap[e]!).toList();
}

List<enums.OrderStatus> orderStatusListFromJson(List? orderStatus) {
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

  return enums.$OrderWithDashStatusMap.entries
      .firstWhere((element) => element.value == orderWithDashStatus,
          orElse: () => const MapEntry(
              enums.OrderWithDashStatus.swaggerGeneratedUnknown, ''))
      .key;
}

List<String> orderWithDashStatusListToJson(
    List<enums.OrderWithDashStatus>? orderWithDashStatus) {
  if (orderWithDashStatus == null) {
    return [];
  }

  return orderWithDashStatus
      .map((e) => enums.$OrderWithDashStatusMap[e]!)
      .toList();
}

List<enums.OrderWithDashStatus> orderWithDashStatusListFromJson(
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

  return enums.$PetStatusMap.entries
      .firstWhere((element) => element.value == petStatus,
          orElse: () =>
              const MapEntry(enums.PetStatus.swaggerGeneratedUnknown, ''))
      .key;
}

List<String> petStatusListToJson(List<enums.PetStatus>? petStatus) {
  if (petStatus == null) {
    return [];
  }

  return petStatus.map((e) => enums.$PetStatusMap[e]!).toList();
}

List<enums.PetStatus> petStatusListFromJson(List? petStatus) {
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

    return jsonFactory(values);
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
