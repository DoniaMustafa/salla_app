// To parse this JSON data, do
//
//     final categoriesProductModel = categoriesProductModelFromJson(jsonString);

import 'dart:convert';

CategoriesProductModel categoriesProductModelFromJson(String str) => CategoriesProductModel.fromJson(json.decode(str));

String categoriesProductModelToJson(CategoriesProductModel data) => json.encode(data.toJson());

class CategoriesProductModel {
  CategoriesProductModel({
    this.status,
    this.message,
     this.data,
  });

  bool? status;
  dynamic message;
  Data? data;

  factory CategoriesProductModel.fromJson(Map<String, dynamic> json) => CategoriesProductModel(
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
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  int? currentPage;
   List<DataSingleCategory>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  dynamic nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    currentPage: json["current_page"],
    data: List<DataSingleCategory>.from(json["data"].map((x) => DataSingleCategory.fromJson(x))),
    firstPageUrl: json["first_page_url"],
    from: json["from"],
    lastPage: json["last_page"],
    lastPageUrl: json["last_page_url"],
    nextPageUrl: json["next_page_url"],
    path: json["path"],
    perPage: json["per_page"],
    prevPageUrl: json["prev_page_url"],
    to: json["to"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "first_page_url": firstPageUrl,
    "from": from,
    "last_page": lastPage,
    "last_page_url": lastPageUrl,
    "next_page_url": nextPageUrl,
    "path": path,
    "per_page": perPage,
    "prev_page_url": prevPageUrl,
    "to": to,
    "total": total,
  };
}

class DataSingleCategory{
  DataSingleCategory({
      this.id,
     this.price,
     this.oldPrice,
    this.discount,
    this.image,
    this.name,
    this.description,
    this.images,
     this.inFavorites,
     this.inCart,
  });

  int? id;
   dynamic price;
   dynamic oldPrice;
   int? discount;
   String? image;
   String? name;
   String? description;
   List<String>? images;
   bool? inFavorites;
   bool? inCart;

  factory DataSingleCategory.fromJson(Map<String, dynamic> json) => DataSingleCategory(
    id: json["id"],
    price: json["price"],
    oldPrice: json["old_price"],
    discount: json["discount"],
    image: json["image"],
    name: json["name"],
    description: json["description"],
    images: List<String>.from(json["images"].map((x) => x)),
    inFavorites: json["in_favorites"],
    inCart: json["in_cart"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "price": price,
    "old_price": oldPrice,
    "discount": discount,
    "image": image,
    "name": name,
    "description": description,
    "images": List<dynamic>.from(images!.map((x) => x)),
    "in_favorites": inFavorites,
    "in_cart": inCart,
  };
}


