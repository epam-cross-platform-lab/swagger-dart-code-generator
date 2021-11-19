// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example_swagger.swagger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) {
  return Order(
    id: json['id'] as int?,
    petId: json['petId'] as int?,
    quantity: json['quantity'] as int?,
    shipDate: json['shipDate'] == null
        ? null
        : DateTime.parse(json['shipDate'] as String),
    status: orderStatusFromJson(json['status'] as String?),
    complete: json['complete'] as bool? ?? false,
  );
}

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

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return Category(
    id: json['id'] as int?,
    name: json['name'] as String? ?? '',
  );
}

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

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    id: json['id'] as int?,
    username: json['username'] as String? ?? '',
    firstName: json['firstName'] as String? ?? '',
    lastName: json['lastName'] as String? ?? '',
    email: json['email'] as String? ?? '',
    password: json['password'] as String? ?? '',
    phone: json['phone'] as String? ?? '',
    userStatus: json['userStatus'] as int?,
  );
}

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

Tag _$TagFromJson(Map<String, dynamic> json) {
  return Tag(
    id: json['id'] as int?,
    name: json['name'] as String? ?? '',
  );
}

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

Pet _$PetFromJson(Map<String, dynamic> json) {
  return Pet(
    id: json['id'] as int?,
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
    status: petStatusFromJson(json['status'] as String?),
  );
}

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

ApiResponse _$ApiResponseFromJson(Map<String, dynamic> json) {
  return ApiResponse(
    code: json['code'] as int?,
    type: json['type'] as String? ?? '',
    message: json['message'] as String? ?? '',
  );
}

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
