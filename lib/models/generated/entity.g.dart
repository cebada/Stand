// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Entity _$EntityFromJson(Map<String, dynamic> json) {
  return Entity(
    json['name'] as String,
    json['entityType'] as String,
  );
}

Map<String, dynamic> _$EntityToJson(Entity instance) => <String, dynamic>{
      'name': instance.name,
      'entityType': instance.entityType,
    };
