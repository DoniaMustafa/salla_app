// To parse this JSON data, do
//
//     final upDataProfileModel = upDataProfileModelFromJson(jsonString);

import 'dart:convert';

UpDataProfileModel upDataProfileModelFromJson(String str) =>
    UpDataProfileModel.fromJson(json.decode(str));

String upDataProfileModelToJson(UpDataProfileModel data) =>
    json.encode(data.toJson());

class UpDataProfileModel {
  UpDataProfileModel({
    this.status,
    this.message,
    required this.data,
  });

  bool? status;
  dynamic message;
  Data data;

  factory UpDataProfileModel.fromJson(Map<String, dynamic> json) =>
      UpDataProfileModel(
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
   required this.id,
   required this.name,
   required this.email,
   required this.phone,
   required this.image,
   required this.points,
   required this.credit,
   required this.token,
  });

  int id;
  String name;
  String email;
  dynamic phone;
  String image;
  dynamic points;
  dynamic credit;
  String token;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        image: json["image"],
        points: json["points"],
        credit: json["credit"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "image": image,
        "points": points,
        "credit": credit,
        "token": token,
      };
}
