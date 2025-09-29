// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet_service_json.swagger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
