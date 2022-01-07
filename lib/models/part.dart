import 'package:json_annotation/json_annotation.dart';
import 'package:stand/models/entity.dart';

part 'part.g.dart';

@JsonSerializable()
class Part {
  String name;
  double cost;
  Entity supplier;
  String purchaseDate;

  Part(this.name, this.cost, this.supplier, this.purchaseDate);

  factory Part.fromJson(Map<String, dynamic> json) => _$PartFromJson(json);

  Map<String, dynamic> toJson() => _$PartToJson(this);
}