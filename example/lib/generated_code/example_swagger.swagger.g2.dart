// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example_swagger.swagger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) {
  return Order(
    id: json['id'] as int ?? 36,
    petId: json['petId'] as int ?? 36,
    quantity: json['quantity'] as int ?? 36,
    shipDate: json['shipDate'] == null
        ? null
        : DateTime.parse(json['shipDate'] as String),
    status: _$enumDecodeNullable(_$OrderStatusEnumMap, json['status'],
        unknownValue: OrderStatus.swaggerGeneratedUnknown),
    complete: json['complete'] as bool,
  );
}

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'id': instance.id,
      'petId': instance.petId,
      'quantity': instance.quantity,
      'shipDate': instance.shipDate?.toIso8601String(),
      'status': _$OrderStatusEnumMap[instance.status],
      'complete': instance.complete,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$OrderStatusEnumMap = {
  OrderStatus.swaggerGeneratedUnknown: 'swaggerGeneratedUnknown',
  OrderStatus.placed: 'placed',
  OrderStatus.approved: 'approved',
  OrderStatus.delivered: 'delivered',
};

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return Category(
    id: json['id'] as int ?? 36,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    id: json['id'] as int ?? 36,
    username: json['username'] as String,
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
    email: json['email'] as String,
    password: json['password'] as String,
    phone: json['phone'] as String,
    userStatus: json['userStatus'] as int ?? 36,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'password': instance.password,
      'phone': instance.phone,
      'userStatus': instance.userStatus,
    };

Tag _$TagFromJson(Map<String, dynamic> json) {
  return Tag(
    id: json['id'] as int ?? 36,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$TagToJson(Tag instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

Pet _$PetFromJson(Map<String, dynamic> json) {
  return Pet(
    id: json['id'] as int ?? 36,
    category: json['category'] == null
        ? null
        : Category.fromJson(json['category'] as Map<String, dynamic>),
    name: json['name'] as String,
    photoUrls:
        (json['photoUrls'] as List)?.map((e) => e as String)?.toList() ?? [],
    tags: (json['tags'] as List)
            ?.map((e) =>
                e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
            ?.toList() ??
        [],
    status: _$enumDecodeNullable(_$PetStatusEnumMap, json['status'],
        unknownValue: PetStatus.swaggerGeneratedUnknown),
  );
}

Map<String, dynamic> _$PetToJson(Pet instance) => <String, dynamic>{
      'id': instance.id,
      'category': instance.category?.toJson(),
      'name': instance.name,
      'photoUrls': instance.photoUrls,
      'tags': instance.tags?.map((e) => e?.toJson())?.toList(),
      'status': _$PetStatusEnumMap[instance.status],
    };

const _$PetStatusEnumMap = {
  PetStatus.swaggerGeneratedUnknown: 'swaggerGeneratedUnknown',
  PetStatus.available: 'available',
  PetStatus.pending: 'pending',
  PetStatus.sold: 'sold',
};

ApiResponse _$ApiResponseFromJson(Map<String, dynamic> json) {
  return ApiResponse(
    code: json['code'] as int ?? 36,
    type: json['type'] as String,
    message: json['message'] as String,
  );
}

Map<String, dynamic> _$ApiResponseToJson(ApiResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'type': instance.type,
      'message': instance.message,
    };
