// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'part.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Part _$PartFromJson(Map<String, dynamic> json) => Part(
      json['name'] as String,
      (json['cost'] as num).toDouble(),
      Entity.fromJson(json['supplier'] as Map<String, dynamic>),
      json['purchaseDate'] as String,
    );

Map<String, dynamic> _$PartToJson(Part instance) => <String, dynamic>{
      'name': instance.name,
      'cost': instance.cost,
      'supplier': instance.supplier,
      'purchaseDate': instance.purchaseDate,
    };
