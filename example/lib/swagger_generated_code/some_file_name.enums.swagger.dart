import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';

enum OrderStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('placed')
  placed('placed'),
  @JsonValue('approved')
  approved('approved'),
  @JsonValue('delivered')
  delivered('delivered');

  final String? value;

  const OrderStatus(this.value);
}

enum PetStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('available')
  available('available'),
  @JsonValue('pending')
  pending('pending'),
  @JsonValue('sold')
  sold('sold');

  final String? value;

  const PetStatus(this.value);
}

enum PetFindByStatusGetStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('available')
  available('available'),
  @JsonValue('pending')
  pending('pending'),
  @JsonValue('sold')
  sold('sold');

  final String? value;

  const PetFindByStatusGetStatus(this.value);
}
