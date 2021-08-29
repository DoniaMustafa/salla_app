// To parse this JSON data, do
//
//     final verifyEmailModel = verifyEmailModelFromJson(jsonString);

import 'dart:convert';

VerifyEmailModel verifyEmailModelFromJson(String str) => VerifyEmailModel.fromJson(json.decode(str));

class VerifyEmailModel {
  VerifyEmailModel({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  dynamic message;
  VerifyData? data;

  factory VerifyEmailModel.fromJson(Map<String, dynamic> json) => VerifyEmailModel(
    status: json["status"],
    message: json["message"],
    data:json["data"]!=null? VerifyData.fromJson(json["data"]):null,
  );

}

class VerifyData {
  VerifyData({
    this.email,
  });

  String? email;

  factory VerifyData.fromJson(Map<String, dynamic> json) => VerifyData(
    email: json["email"],
  );


}




VerifyCodeModel verifyCodeModelFromJson(String str) => VerifyCodeModel.fromJson(json.decode(str));

class VerifyCodeModel {
  VerifyCodeModel({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  dynamic message;
  VerifyCodeData? data;

  factory VerifyCodeModel.fromJson(Map<String, dynamic> json) => VerifyCodeModel(
    status: json["status"],
    message: json["message"],
    data:json["data"]!=null? VerifyCodeData.fromJson(json["data"]):null,
  );

}

class VerifyCodeData {
  VerifyCodeData({
    this.email,
  });

  String? email;

  factory VerifyCodeData.fromJson(Map<String, dynamic> json) => VerifyCodeData(
    email: json["email"],
  );


}



// To parse this JSON data, do
//
//     final forgotPasswordModel = forgotPasswordModelFromJson(jsonString);


ForgotPasswordModel forgotPasswordModelFromJson(String str) => ForgotPasswordModel.fromJson(json.decode(str));

String forgotPasswordModelToJson(ForgotPasswordModel data) => json.encode(data.toJson());

class ForgotPasswordModel {
  ForgotPasswordModel({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  dynamic message;
  Data? data;

  factory ForgotPasswordModel.fromJson(Map<String, dynamic> json) => ForgotPasswordModel(
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
    this.id,
    this.name,
    this.email,
    this.phone,
    this.image,
    this.points,
  });

  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  int? points;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    image: json["image"],
    points: json["points"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "image": image,
    "points": points,
  };
}
