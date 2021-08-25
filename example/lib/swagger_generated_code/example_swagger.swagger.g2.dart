// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example_swagger.swagger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Room _$RoomFromJson(Map<String, dynamic> json) {
  return Room(
    author: json['author'] as String? ?? '',
    avatar: json['avatar'] as String? ?? '',
    id: json['id'] as String? ?? '',
    lastMessage: json['lastMessage'] as String? ?? '',
    name: json['name'] as String? ?? '',
  );
}

Map<String, dynamic> _$RoomToJson(Room instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('author', instance.author);
  writeNotNull('avatar', instance.avatar);
  writeNotNull('id', instance.id);
  writeNotNull('lastMessage', instance.lastMessage);
  writeNotNull('name', instance.name);
  return val;
}

CustomItem _$CustomItemFromJson(Map<String, dynamic> json) {
  return CustomItem(
    available: json['available'] as bool?,
    description: json['description'] as String? ?? '',
    id: json['id'] as String? ?? '',
    name: json['name'] as String? ?? '',
  );
}

Map<String, dynamic> _$CustomItemToJson(CustomItem instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('available', instance.available);
  writeNotNull('description', instance.description);
  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  return val;
}

ListCustomItem _$ListCustomItemFromJson(Map<String, dynamic> json) {
  return ListCustomItem();
}

Map<String, dynamic> _$ListCustomItemToJson(ListCustomItem instance) =>
    <String, dynamic>{};
