// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet_service_swagger.swagger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
  id: (json['id'] as num?)?.toInt(),
  petId: (json['petId'] as num?)?.toInt(),
  quantity: (json['quantity'] as num?)?.toInt(),
  shipDate: json['shipDate'] == null
      ? null
      : DateTime.parse(json['shipDate'] as String),
  status: orderStatusNullableFromJson(json['status']),
  complete: json['complete'] as bool? ?? false,
);

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
  'id': ?instance.id,
  'petId': ?instance.petId,
  'quantity': ?instance.quantity,
  'shipDate': ?instance.shipDate?.toIso8601String(),
  'status': ?orderStatusNullableToJson(instance.status),
  'complete': ?instance.complete,
};

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String? ?? '',
);

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
  'id': ?instance.id,
  'name': ?instance.name,
};

User _$UserFromJson(Map<String, dynamic> json) => User(
  id: (json['id'] as num?)?.toInt(),
  username: json['username'] as String? ?? '',
  firstName: json['firstName'] as String? ?? '',
  lastName: json['lastName'] as String? ?? '',
  email: json['email'] as String? ?? '',
  password: json['password'] as String? ?? '',
  phone: json['phone'] as String? ?? '',
  userStatus: (json['userStatus'] as num?)?.toInt(),
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'id': ?instance.id,
  'username': ?instance.username,
  'firstName': ?instance.firstName,
  'lastName': ?instance.lastName,
  'email': ?instance.email,
  'password': ?instance.password,
  'phone': ?instance.phone,
  'userStatus': ?instance.userStatus,
};

Tag _$TagFromJson(Map<String, dynamic> json) =>
    Tag(id: (json['id'] as num?)?.toInt(), name: json['name'] as String? ?? '');

Map<String, dynamic> _$TagToJson(Tag instance) => <String, dynamic>{
  'id': ?instance.id,
  'name': ?instance.name,
};

Pet _$PetFromJson(Map<String, dynamic> json) => Pet(
  id: (json['id'] as num?)?.toInt(),
  category: json['category'] == null
      ? null
      : Category.fromJson(json['category'] as Map<String, dynamic>),
  name: json['name'] as String? ?? '',
  photoUrls: (json['photoUrls'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  tags: (json['tags'] as List<dynamic>?)
      ?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
      .toList(),
  status: petStatusNullableFromJson(json['status']),
);

Map<String, dynamic> _$PetToJson(Pet instance) => <String, dynamic>{
  'id': ?instance.id,
  'category': ?instance.category?.toJson(),
  'name': ?instance.name,
  'photoUrls': ?instance.photoUrls,
  'tags': ?instance.tags?.map((e) => e.toJson()).toList(),
  'status': ?petStatusNullableToJson(instance.status),
};

ApiResponse _$ApiResponseFromJson(Map<String, dynamic> json) => ApiResponse(
  code: (json['code'] as num?)?.toInt(),
  type: json['type'] as String? ?? '',
  message: json['message'] as String? ?? '',
);

Map<String, dynamic> _$ApiResponseToJson(ApiResponse instance) =>
    <String, dynamic>{
      'code': ?instance.code,
      'type': ?instance.type,
      'message': ?instance.message,
    };
