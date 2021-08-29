// To parse this JSON data, do
//
//     final addFavorieModel = addFavorieModelFromJson(jsonString);

import 'dart:convert';

// To parse this JSON data, do
//
//     final getFavoriteModel = getFavoriteModelFromJson(jsonString);


GetFavoriteModel getFavoriteModelFromJson(String str) => GetFavoriteModel.fromJson(json.decode(str));

String getFavoriteModelToJson(GetFavoriteModel data) => json.encode(data.toJson());

class GetFavoriteModel {
  GetFavoriteModel({
     this.status,
     this.message,
      this.data,
  });

  bool? status;
  dynamic message;
  FavoriteData? data;

  factory GetFavoriteModel.fromJson(Map<String, dynamic> json) => GetFavoriteModel(
    status: json["status"],
    message: json["message"],
    data: FavoriteData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data!.toJson(),
  };
}

class FavoriteData {
  FavoriteData({
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
  List<Datum>? data;
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

  factory FavoriteData.fromJson(Map<String, dynamic> json) => FavoriteData(
    currentPage: json["current_page"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
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

class Datum {
  Datum({
      this.id,
     this.product,
  });

   int? id =0;
   GetFavProduct? product;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    product: GetFavProduct.fromJson(json["product"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product": product!.toJson(),
  };
}

class GetFavProduct {
  GetFavProduct({
    this.id,
    this.price,
     this.oldPrice,
     this.discount,
     this.image,
    this.name,
     this.description,
  });

  int? id=0;
   dynamic price;
  dynamic oldPrice;
   int? discount;
   String? image;
   String? name;
   String? description;

  factory GetFavProduct.fromJson(Map<String, dynamic> json) => GetFavProduct(
    id: json["id"],
    price: json["price"].toDouble(),
    oldPrice: json["old_price"].toDouble(),
    discount: json["discount"],
    image: json["image"],
    name: json["name"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "price": price,
    "old_price": oldPrice,
    "discount": discount,
    "image": image,
    "name": name,
    "description": description,
  };
}


AddFavoriteModel addFavoriteModelFromJson(String str) => AddFavoriteModel.fromJson(json.decode(str));

String addFavoriteModelToJson(AddFavoriteModel data) => json.encode(data.toJson());

class AddFavoriteModel {
  AddFavoriteModel({
    this.status,
    this.message,
     this.data,
  });

  bool? status;
  dynamic message;
   Data? data;

  factory AddFavoriteModel.fromJson(Map<String, dynamic> json) => AddFavoriteModel(
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
     this.quantity,
     this.product,
  });

    int? id;
   int? quantity;
   AddFavoriteProduct? product;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    quantity: json["quantity"],
    product: AddFavoriteProduct.fromJson(json["product"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "quantity": quantity,
    "product": product!.toJson(),
  };
}

class AddFavoriteProduct {
  AddFavoriteProduct({
     this.id,
     this.price,
     this.oldPrice,
     this.discount,
     this.image,
     this.name,
     this.description,
  });

   int? id;
  dynamic price;
  dynamic oldPrice;
   int? discount;
   String? image;
   String? name;
   String? description;

  factory AddFavoriteProduct.fromJson(Map<String, dynamic> json) => AddFavoriteProduct(
    id: json["id"],
    price: json["price"],
    oldPrice: json["old_price"],
    discount: json["discount"],
    image: json["image"],
    name: json["name"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "price": price,
    "old_price": oldPrice,
    "discount": discount,
    "image": image,
    "name": name,
    "description": description,
  };
}
