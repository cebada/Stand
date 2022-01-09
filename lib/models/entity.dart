import 'package:json_annotation/json_annotation.dart';

part 'generated/entity.g.dart';

@JsonSerializable()
class Entity {
  String name;
  String entityType;

  //TODO adicionar nr e meter no list clients

  Entity(this.name, this.entityType);

  factory Entity.fromJson(Map<String, dynamic> json) => _$EntityFromJson(json);

  Map<String, dynamic> toJson() => _$EntityToJson(this);

}