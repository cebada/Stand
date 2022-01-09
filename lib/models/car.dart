import 'package:json_annotation/json_annotation.dart';

part 'generated/car.g.dart';

@JsonSerializable()
class Car {
  String brand;
  String model;
  String month;
  int year;
  int power;
  int cc;
  int mileage;
  double price;
  String imageUrl;
  String fuelType;
  String color;
  String gearBox;
  bool reserved;
  String plate;

  Car(
      this.brand,
      this.model,
      this.month,
      this.year,
      this.power,
      this.cc,
      this.mileage,
      this.price,
      this.reserved,
      this.imageUrl,
      this.fuelType,
      this.color,
      this.gearBox,
      this.plate);

  factory Car.fromJson(Map<String, dynamic> json) => _$CarFromJson(json);

  Map<String, dynamic> toJson() => _$CarToJson(this);
}
