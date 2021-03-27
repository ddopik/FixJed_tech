import 'city.dart';

class Address {
  Address({
    this.id,
    this.title,
    this.streetName,
    this.buildingNumber,
    this.floorNumber,
    this.apartmentNumber,
    this.region,
    this.city,
    this.errors,
  });

  int id;
  String title;
  String streetName;
  String buildingNumber;
  String floorNumber;
  String apartmentNumber;
  City region;
  City city;
  dynamic errors;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    id: json["id"],
    title: json["title"],
    streetName: json["streetName"],
    buildingNumber: json["buildingNumber"],
    floorNumber: json["floorNumber"],
    apartmentNumber: json["apartmentNumber"],
    region: json["region"] == null ? null : City.fromJson(json["region"]),
    city: json["city"] == null ? null : City.fromJson(json["city"]),
    errors: json["errors"],
  );

}


