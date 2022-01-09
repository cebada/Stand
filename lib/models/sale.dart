import 'package:json_annotation/json_annotation.dart';
import 'package:stand/models/car.dart';

import 'entity.dart';

part 'generated/sale.g.dart';

@JsonSerializable()
class Sale {
  Car car;
  String date;
  Entity client;


  Sale(this.car, this.date, this.client);

  factory Sale.fromJson(Map<String, dynamic> json) => _$SaleFromJson(json);

  Map<String, dynamic> toJson() => _$SaleToJson(this);

}