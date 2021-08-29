// To parse this JSON data, do
//
//     final searchModel = searchModelFromJson(jsonString);
import 'dart:convert';

SearchModel searchModelFromJson(String str) =>
    SearchModel.fromJson(json.decode(str));

String searchModelToJson(SearchModel data) => json.encode(data.toJson());

class SearchModel {
  SearchModel({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  dynamic message;
  SearchData? data;

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        status: json["status"],
        message: json["message"],
        data: SearchData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data!.toJson(),
      };
}

class SearchData {
  SearchData({
    this.data,
  });

  List<SearchProduct>? data;

  factory SearchData.fromJson(Map<String, dynamic> json) => SearchData(
        data: List<SearchProduct>.from(
            json["data"].map((x) => SearchProduct.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class SearchProduct {
  SearchProduct({
     this.id,
     this.price,
     this.image,
     this.name,
     this.description,
     this.images,
     this.inFavorites,
     this.inCart,
  });

   int? id;
   dynamic price;
   String? image;
   String? name;
   String? description;
   List<String>? images;
   bool? inFavorites;
   bool? inCart;

  factory SearchProduct.fromJson(Map<String, dynamic> json) => SearchProduct(
        id: json["id"],
        price: json["price"],
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
        "image": image,
        "name": name,
        "description": description,
        "images": List<dynamic>.from(images!.map((x) => x)),
        "in_favorites": inFavorites,
        "in_cart": inCart,
      };
}
