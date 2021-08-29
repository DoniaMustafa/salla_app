// To parse this JSON data, do
//
//     final promoCodeModel = promoCodeModelFromJson(jsonString);

import 'dart:convert';

PromoCodeModel promoCodeModelFromJson(String str) =>
    PromoCodeModel.fromJson(json.decode(str));

String promoCodeModelToJson(PromoCodeModel data) => json.encode(data.toJson());

class PromoCodeModel {
  PromoCodeModel({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  dynamic message;
  Data? data;

  factory PromoCodeModel.fromJson(Map<String, dynamic> json) => PromoCodeModel(
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
     this.code,
     this.value,
     this.percentage,
     this.startDate,
     this.endDate,
     this.usagePerUser,
  });

   int? id;
   String? code;
   int? value;
   int? percentage;
   DateTime? startDate;
   DateTime? endDate;
   int? usagePerUser;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        code: json["code"],
        value: json["value"],
        percentage: json["percentage"],
        startDate: DateTime.parse(json["start_date"]),
        endDate: DateTime.parse(json["end_date"]),
        usagePerUser: json["usage_per_user"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "value": value,
        "percentage": percentage,
        "start_date":
            "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "end_date":
            "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
        "usage_per_user": usagePerUser,
      };
}
