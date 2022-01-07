// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Car _$CarFromJson(Map<String, dynamic> json) => Car(
      json['brand'] as String,
      json['model'] as String,
      json['month'] as String,
      json['year'] as int,
      json['power'] as int,
      json['cc'] as int,
      json['mileage'] as int,
      (json['price'] as num).toDouble(),
      json['reserved'] as bool,
      json['imageUrl'] as String,
      json['fuelType'] as String,
      json['color'] as String,
      json['gearBox'] as String,
      json['plate'] as String,
    );

Map<String, dynamic> _$CarToJson(Car instance) => <String, dynamic>{
      'brand': instance.brand,
      'model': instance.model,
      'month': instance.month,
      'year': instance.year,
      'power': instance.power,
      'cc': instance.cc,
      'mileage': instance.mileage,
      'price': instance.price,
      'imageUrl': instance.imageUrl,
      'fuelType': instance.fuelType,
      'color': instance.color,
      'gearBox': instance.gearBox,
      'reserved': instance.reserved,
      'plate': instance.plate,
    };
