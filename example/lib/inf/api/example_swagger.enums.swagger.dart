import 'package:json_annotation/json_annotation.dart';

enum OrderStatus {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('placed')
  placed,
  @JsonValue('approved')
  approved,
  @JsonValue('delivered')
  delivered
}

const $OrderStatusMap = {
  OrderStatus.placed: 'placed',
  OrderStatus.approved: 'approved',
  OrderStatus.delivered: 'delivered'
};

enum PetStatus {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('available')
  available,
  @JsonValue('pending')
  pending,
  @JsonValue('sold')
  sold
}

const $PetStatusMap = {
  PetStatus.available: 'available',
  PetStatus.pending: 'pending',
  PetStatus.sold: 'sold'
};

enum PetFindByStatusGetStatus {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('available')
  available,
  @JsonValue('pending')
  pending,
  @JsonValue('sold')
  sold
}

const $PetFindByStatusGetStatusMap = {
  PetFindByStatusGetStatus.available: 'available',
  PetFindByStatusGetStatus.pending: 'pending',
  PetFindByStatusGetStatus.sold: 'sold'
};
