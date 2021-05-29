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
  OrderStatus.delivered: 'delivered',
  OrderStatus.swaggerGeneratedUnknown: ''
};

enum OrderWithDashStatus {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('placed')
  placed,
  @JsonValue('approved')
  approved,
  @JsonValue('delivered')
  delivered
}

const $OrderWithDashStatusMap = {
  OrderWithDashStatus.placed: 'placed',
  OrderWithDashStatus.approved: 'approved',
  OrderWithDashStatus.delivered: 'delivered',
  OrderWithDashStatus.swaggerGeneratedUnknown: ''
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
  PetStatus.sold: 'sold',
  PetStatus.swaggerGeneratedUnknown: ''
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
  PetFindByStatusGetStatus.sold: 'sold',
  PetFindByStatusGetStatus.swaggerGeneratedUnknown: ''
};

enum PetFindByStatusGetColor {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('red')
  red,
  @JsonValue('green')
  green,
  @JsonValue('yellow')
  yellow
}

const $PetFindByStatusGetColorMap = {
  PetFindByStatusGetColor.red: 'red',
  PetFindByStatusGetColor.green: 'green',
  PetFindByStatusGetColor.yellow: 'yellow',
  PetFindByStatusGetColor.swaggerGeneratedUnknown: ''
};
