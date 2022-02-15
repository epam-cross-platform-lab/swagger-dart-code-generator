// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet_service_yaml.swagger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      id: json['id'] as num?,
      petId: json['petId'] as num?,
      quantity: json['quantity'] as int?,
      shipDate: json['shipDate'] == null
          ? null
          : DateTime.parse(json['shipDate'] as String),
      status: orderStatusFromJson(json['status']),
      complete: json['complete'] as bool? ?? false,
    );

Map<String, dynamic> _$OrderToJson(Order instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('petId', instance.petId);
  writeNotNull('quantity', instance.quantity);
  writeNotNull('shipDate', instance.shipDate?.toIso8601String());
  writeNotNull('status', orderStatusToJson(instance.status));
  writeNotNull('complete', instance.complete);
  return val;
}

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      id: json['id'] as num?,
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$CategoryToJson(Category instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  return val;
}

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as num?,
      username: json['username'] as String? ?? '',
      firstName: json['firstName'] as String? ?? '',
      lastName: json['lastName'] as String? ?? '',
      email: json['email'] as String? ?? '',
      password: json['password'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      userStatus: json['userStatus'] as int?,
    );

Map<String, dynamic> _$UserToJson(User instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('username', instance.username);
  writeNotNull('firstName', instance.firstName);
  writeNotNull('lastName', instance.lastName);
  writeNotNull('email', instance.email);
  writeNotNull('password', instance.password);
  writeNotNull('phone', instance.phone);
  writeNotNull('userStatus', instance.userStatus);
  return val;
}

Tag _$TagFromJson(Map<String, dynamic> json) => Tag(
      id: json['id'] as num?,
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$TagToJson(Tag instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  return val;
}

Pet _$PetFromJson(Map<String, dynamic> json) => Pet(
      id: json['id'] as num?,
      category: json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
      name: json['name'] as String? ?? '',
      photoUrls: (json['photoUrls'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      tags: (json['tags'] as List<dynamic>?)
              ?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      status: petStatusFromJson(json['status']),
    );

Map<String, dynamic> _$PetToJson(Pet instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('category', instance.category?.toJson());
  writeNotNull('name', instance.name);
  writeNotNull('photoUrls', instance.photoUrls);
  writeNotNull('tags', instance.tags?.map((e) => e.toJson()).toList());
  writeNotNull('status', petStatusToJson(instance.status));
  return val;
}

ApiResponse _$ApiResponseFromJson(Map<String, dynamic> json) => ApiResponse(
      code: json['code'] as int?,
      type: json['type'] as String? ?? '',
      message: json['message'] as String? ?? '',
    );

Map<String, dynamic> _$ApiResponseToJson(ApiResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('code', instance.code);
  writeNotNull('type', instance.type);
  writeNotNull('message', instance.message);
  return val;
}
