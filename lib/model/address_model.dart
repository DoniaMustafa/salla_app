// To parse this JSON data, do
//
//     final addressModel = addressModelFromJson(jsonString);

import 'dart:convert';

AddressModel addressModelFromJson(String str) => AddressModel.fromJson(json.decode(str));

String addressModelToJson(AddressModel data) => json.encode(data.toJson());

class AddressModel {
  AddressModel({
     this.status,
      this.message,
     this.data,
  });

  bool? status;
    dynamic message;
  Data? data;

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data!.toJson(),
  };
}

class Data {
  Data({
    this.data,
  });

  List<Datum>? data;











  factory Data.fromJson(Map<String, dynamic> json) => Data(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required  this.id,
    required  this.name,
    required  this.city,
    required this.region,
    required this.details,
    required this.notes,
    required this.latitude,
    required this.longitude,
  });

  int id;
  String name;
  String city;
  String region;
  String details;
  String notes;
  dynamic latitude;
  dynamic longitude;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    city: json["city"],
    region: json["region"],
    details: json["details"],
    notes: json["notes"],
    latitude: json["latitude"],
    longitude: json["longitude"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "city": city,
    "region": region,
    "details": details,
    "notes": notes,
    "latitude": latitude,
    "longitude": longitude,
  };
}
