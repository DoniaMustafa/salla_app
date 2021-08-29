// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.status,
    this.message,
     this.data,
  });

  bool? status;
  dynamic message;
  UserDataMode? data;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        status: json["status"],
        message: json["message"],
        data: UserDataMode.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data!.toJson(),
      };
}

class UserDataMode {
  UserDataMode({
     this.id,
     this.name,
     this.email,
     this.phone,
     this.image,
     this.points,
     this.credit,
     this.token,
  });

  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  dynamic points;
 dynamic credit;
  String? token;

  factory UserDataMode.fromJson(Map<String, dynamic> json) => UserDataMode(
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
