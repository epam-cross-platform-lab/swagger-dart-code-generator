import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';

import 'package:chopper/chopper.dart';
import 'package:chopper/chopper.dart' as chopper;

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
      converter: $JsonSerializableConverter(),
      /*baseUrl: YOUR_BASE_URL*/
    );
    return _$ExampleSwagger(newClient);
  }

  ///
  ///@param id Rooms owner
  @Get(path: '/rooms')
  Future<chopper.Response<List<Room>>> roomsGet(
      {@Query('id') required String? id});

  ///
  @Get(path: '/api/item/all')
  Future<chopper.Response<ListCustomItem>> apiItemAllGet();
}

final Map<Type, Object Function(Map<String, dynamic>)>
    ExampleSwaggerJsonDecoderMappings = {
  Room: Room.fromJsonFactory,
  CustomItem: CustomItem.fromJsonFactory,
  ListCustomItem: ListCustomItem.fromJsonFactory,
};

@JsonSerializable(explicitToJson: true)
class Room {
  Room({
    this.author,
    this.avatar,
    this.id,
    this.lastMessage,
    this.name,
  });

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);

  @JsonKey(name: 'author', includeIfNull: false, defaultValue: '')
  final String? author;
  @JsonKey(name: 'avatar', includeIfNull: false, defaultValue: '')
  final String? avatar;
  @JsonKey(name: 'id', includeIfNull: false, defaultValue: '')
  final String? id;
  @JsonKey(name: 'lastMessage', includeIfNull: false, defaultValue: '')
  final String? lastMessage;
  @JsonKey(name: 'name', includeIfNull: false, defaultValue: '')
  final String? name;
  static const fromJsonFactory = _$RoomFromJson;
  static const toJsonFactory = _$RoomToJson;
  Map<String, dynamic> toJson() => _$RoomToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Room &&
            (identical(other.author, author) ||
                const DeepCollectionEquality().equals(other.author, author)) &&
            (identical(other.avatar, avatar) ||
                const DeepCollectionEquality().equals(other.avatar, avatar)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.lastMessage, lastMessage) ||
                const DeepCollectionEquality()
                    .equals(other.lastMessage, lastMessage)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(author) ^
      const DeepCollectionEquality().hash(avatar) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(lastMessage) ^
      const DeepCollectionEquality().hash(name) ^
      runtimeType.hashCode;
}

extension $RoomExtension on Room {
  Room copyWith(
      {String? author,
      String? avatar,
      String? id,
      String? lastMessage,
      String? name}) {
    return Room(
        author: author ?? this.author,
        avatar: avatar ?? this.avatar,
        id: id ?? this.id,
        lastMessage: lastMessage ?? this.lastMessage,
        name: name ?? this.name);
  }
}

@JsonSerializable(explicitToJson: true)
class CustomItem {
  CustomItem({
    this.available,
    this.description,
    this.id,
    this.name,
  });

  factory CustomItem.fromJson(Map<String, dynamic> json) =>
      _$CustomItemFromJson(json);

  @JsonKey(name: 'available', includeIfNull: false)
  final bool? available;
  @JsonKey(name: 'description', includeIfNull: false, defaultValue: '')
  final String? description;
  @JsonKey(name: 'id', includeIfNull: false, defaultValue: '')
  final String? id;
  @JsonKey(name: 'name', includeIfNull: false, defaultValue: '')
  final String? name;
  static const fromJsonFactory = _$CustomItemFromJson;
  static const toJsonFactory = _$CustomItemToJson;
  Map<String, dynamic> toJson() => _$CustomItemToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CustomItem &&
            (identical(other.available, available) ||
                const DeepCollectionEquality()
                    .equals(other.available, available)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(available) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      runtimeType.hashCode;
}

extension $CustomItemExtension on CustomItem {
  CustomItem copyWith(
      {bool? available, String? description, String? id, String? name}) {
    return CustomItem(
        available: available ?? this.available,
        description: description ?? this.description,
        id: id ?? this.id,
        name: name ?? this.name);
  }
}

@JsonSerializable(explicitToJson: true)
class ListCustomItem {
  ListCustomItem();

  factory ListCustomItem.fromJson(Map<String, dynamic> json) =>
      _$ListCustomItemFromJson(json);

  static const fromJsonFactory = _$ListCustomItemFromJson;
  static const toJsonFactory = _$ListCustomItemToJson;
  Map<String, dynamic> toJson() => _$ListCustomItemToJson(this);

  @override
  int get hashCode => runtimeType.hashCode;
}

typedef $JsonFactory<T> = T Function(Map<String, dynamic> json);

class $CustomJsonDecoder {
  $CustomJsonDecoder(this.factories);

  final Map<Type, $JsonFactory> factories;

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
    if (jsonFactory == null || jsonFactory is! $JsonFactory<T>) {
      return throw "Could not find factory for type $T. Is '$T: $T.fromJsonFactory' included in the CustomJsonDecoder instance creation in bootstrapper.dart?";
    }

    return jsonFactory(values);
  }

  List<T> _decodeList<T>(Iterable values) =>
      values.where((v) => v != null).map<T>((v) => decode<T>(v) as T).toList();
}

class $JsonSerializableConverter extends chopper.JsonConverter {
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
        body: $jsonDecoder.decode<Item>(jsonRes.body) as ResultType);
  }
}

final $jsonDecoder = $CustomJsonDecoder(ExampleSwaggerJsonDecoderMappings);

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
