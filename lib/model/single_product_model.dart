// To parse this JSON data, do
//
//     final singleProductModel = singleProductModelFromJson(jsonString);

import 'dart:convert';

SingleProductModel singleProductModelFromJson(String str) =>
    SingleProductModel.fromJson(json.decode(str));

String singleProductModelToJson(SingleProductModel data) =>
    json.encode(data.toJson());

class SingleProductModel {
  SingleProductModel({
    this.status,
    this.message,
    required this.data,
  });

  bool? status;
  dynamic message;
   Data data;

  factory SingleProductModel.fromJson(Map<String, dynamic> json) =>
      SingleProductModel(
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
     this.id,
     this.price,
     this.oldPrice,
     this.discount,
     this.image,
     this.name,
     this.description,
     this.inFavorites,
     this.inCart,
     this.images,
  });
  dynamic price;
  dynamic oldPrice;
   int? id;
   int? discount;
   String? image;
   String? name;
   String? description;
   bool? inFavorites;
   bool? inCart;
   List<String>? images;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        price: json["price"],
        oldPrice: json["old_price"],
        discount: json["discount"],
        image: json["image"],
        name: json["name"],
        description: json["description"],
        inFavorites: json["in_favorites"],
        inCart: json["in_cart"],
        images: List<String>.from(json["images"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "price": price,
        "old_price": oldPrice,
        "discount": discount,
        "image": image,
        "name": name,
        "description": description,
        "in_favorites": inFavorites,
        "in_cart": inCart,
        "images": List<dynamic>.from(images!.map((x) => x)),
      };
}
