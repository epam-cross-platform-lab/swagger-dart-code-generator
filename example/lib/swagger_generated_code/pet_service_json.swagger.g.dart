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
