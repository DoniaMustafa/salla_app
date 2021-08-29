// To parse this JSON data, do
//
//     final updateAddressModel = updateAddressModelFromJson(jsonString);

import 'dart:convert';

UpdateAddressModel updateAddressModelFromJson(String str) => UpdateAddressModel.fromJson(json.decode(str));

String updateAddressModelToJson(UpdateAddressModel data) => json.encode(data.toJson());

class UpdateAddressModel {
  UpdateAddressModel({
    this.status,
    this.message,
   required this.data,
  });

   bool? status;
dynamic message;
    Data data;

  factory UpdateAddressModel.fromJson(Map<String, dynamic> json) => UpdateAddressModel(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };

}

class Data {
  Data({
    required this.name,
    required this.city,
    required  this.region,
    required this.details,
    required this.latitude,
    required this.longitude,
    required  this.notes,
    required  this.id,
  });

   String name;
    String city;
   String region;
   String details;
   dynamic latitude;
   dynamic longitude;
   String notes;
   int id;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    name: json["name"],
    city: json["city"],
    region: json["region"],
    details: json["details"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    notes: json["notes"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "city": city,
    "region": region,
    "details": details,
    "latitude": latitude,
    "longitude": longitude,
    "notes": notes,
    "id": id,
  };
}
