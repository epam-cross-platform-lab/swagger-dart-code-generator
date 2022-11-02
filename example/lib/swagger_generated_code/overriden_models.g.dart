// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'overriden_models.dart';

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
  writeNotNull('complete', instance.complete);
  return val;
}
