// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../sale.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sale _$SaleFromJson(Map<String, dynamic> json) {
  return Sale(
    Car.fromJson(json['car'] as Map<String, dynamic>),
    json['date'] as String,
    Entity.fromJson(json['client'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SaleToJson(Sale instance) => <String, dynamic>{
      'car': instance.car,
      'date': instance.date,
      'client': instance.client,
    };
