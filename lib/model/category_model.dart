// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

CategoryModel categoryModelFromJson(String str) => CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  CategoryModel({
    this.status,
    this.message,
     this.data = null,
  });

  bool? status;
  dynamic message;
  CategoryData? data;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    status: json["status"],
    message: json["message"],
    data:CategoryData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data!.toJson(),
  };
}

class CategoryData {
  CategoryData({
    this.data,
  });

  List<DataOfCategory>? data;


  factory CategoryData.fromJson(Map<String, dynamic> json) => CategoryData(
    data: List<DataOfCategory>.from(json["data"].map((x) => DataOfCategory.fromJson(x))),

  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class DataOfCategory {
  DataOfCategory({
    this.id,
    this.name,
    this.image,
  });

  int? id;
  String? name;
  String? image;

  factory DataOfCategory.fromJson(Map<String, dynamic> json) => DataOfCategory(
    id: json["id"],
    name: json["name"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
  };
}

