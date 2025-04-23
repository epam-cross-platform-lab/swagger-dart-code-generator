// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet_service_yaml.swagger.dart';

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
      if (instance.id case final value?) 'id': value,
      if (instance.petId case final value?) 'petId': value,
      if (instance.quantity case final value?) 'quantity': value,
      if (instance.shipDate?.toIso8601String() case final value?)
        'shipDate': value,
      if (orderStatusNullableToJson(instance.status) case final value?)
        'status': value,
      if (instance.complete case final value?) 'complete': value,
    };

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.name case final value?) 'name': value,
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
      if (instance.id case final value?) 'id': value,
      if (instance.username case final value?) 'username': value,
      if (instance.firstName case final value?) 'firstName': value,
      if (instance.lastName case final value?) 'lastName': value,
      if (instance.email case final value?) 'email': value,
      if (instance.password case final value?) 'password': value,
      if (instance.phone case final value?) 'phone': value,
      if (instance.userStatus case final value?) 'userStatus': value,
    };

Tag _$TagFromJson(Map<String, dynamic> json) => Tag(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$TagToJson(Tag instance) => <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.name case final value?) 'name': value,
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
      if (instance.id case final value?) 'id': value,
      if (instance.category?.toJson() case final value?) 'category': value,
      if (instance.name case final value?) 'name': value,
      if (instance.photoUrls case final value?) 'photoUrls': value,
      if (instance.tags?.map((e) => e.toJson()).toList() case final value?)
        'tags': value,
      if (petStatusNullableToJson(instance.status) case final value?)
        'status': value,
    };

ApiResponse _$ApiResponseFromJson(Map<String, dynamic> json) => ApiResponse(
      code: (json['code'] as num?)?.toInt(),
      type: json['type'] as String? ?? '',
      message: json['message'] as String? ?? '',
    );

Map<String, dynamic> _$ApiResponseToJson(ApiResponse instance) =>
    <String, dynamic>{
      if (instance.code case final value?) 'code': value,
      if (instance.type case final value?) 'type': value,
      if (instance.message case final value?) 'message': value,
    };
