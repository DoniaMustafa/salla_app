

import 'dart:convert';

import 'package:flutter/cupertino.dart';

GetCartModel getCartModelFromJson(String str) =>
    GetCartModel.fromJson(json.decode(str));

String getCartModelToJson(GetCartModel data) => json.encode(data.toJson());


class GetCartModel {
  GetCartModel({
    this.status,
    this.message,
   required this.data,
  });

  bool? status;
  dynamic message;
    CartData data;

  factory GetCartModel.fromJson(Map<String, dynamic> json) => GetCartModel(
        status: json["status"],
        message: json["message"],
        data: CartData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class CartData {
  CartData({
     this.cartItems,
     this.subTotal,
     this.total,
  });

   List<CartItem>? cartItems;
   double? subTotal;
   double? total;

  factory CartData.fromJson(Map<String, dynamic> json) => CartData(
        cartItems: List<CartItem>.from(
            json["cart_items"].map((x) => CartItem.fromJson(x))),
        subTotal: json["sub_total"].toDouble(),
        total: json["total"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "cart_items": List<dynamic>.from(cartItems!.map((x) => x.toJson())),
        "sub_total": subTotal,
        "total": total,
      };
}

class CartItem {
  CartItem({
     this.id,
    required this.quantity,
     this.product,
  });

   int? id;
   int quantity;
   GetCartProduct? product;

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
        id: json["id"],
        quantity: json["quantity"],
        product: GetCartProduct.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "quantity": quantity,
        "product": product!.toJson(),
      };
}

class GetCartProduct {
  GetCartProduct({
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
   double? price;
   double? oldPrice;
   int? discount;
   String? image;
   String? name;
   String? description;
   List<String>? images;
   bool? inFavorites;
   bool? inCart;

  factory GetCartProduct.fromJson(Map<String, dynamic> json) => GetCartProduct(
        id: json["id"],
        price: json["price"].toDouble(),
        oldPrice: json["old_price"].toDouble(),
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

AddOrRemoveCartModel addOrRemoveCartFromModelFromJson(String str) =>
    AddOrRemoveCartModel.fromJson(json.decode(str));

String addOrRemoveCartFromModelToJson(AddOrRemoveCartModel data) =>
    json.encode(data.toJson());

class AddOrRemoveCartModel {
  AddOrRemoveCartModel({
    this.status,
    this.message,
     this.data,
  });

  bool? status;
  dynamic message;
   AddOrRemoveData? data;

  factory AddOrRemoveCartModel.fromJson(Map<String, dynamic> json) =>
      AddOrRemoveCartModel(
        status: json["status"],
        message: json["message"],
        data: AddOrRemoveData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data!.toJson(),
      };
}

class AddOrRemoveData {
  AddOrRemoveData({
     this.id,
     this.quantity,
     this.product,
  });

   int? id;
   int? quantity;
   AddOrRemoveProductToCart? product;

  factory AddOrRemoveData.fromJson(Map<String, dynamic> json) =>
      AddOrRemoveData(
        id: json["id"],
        quantity: json["quantity"],
        product: AddOrRemoveProductToCart.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "quantity": quantity,
        "product": product!.toJson(),
      };
}

class AddOrRemoveProductToCart {
  AddOrRemoveProductToCart({
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

  factory AddOrRemoveProductToCart.fromJson(Map<String, dynamic> json) =>
      AddOrRemoveProductToCart(
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

RemoveOrderCartModel removeOrderCartModelFromJson(String str) =>
    RemoveOrderCartModel.fromJson(json.decode(str));

String removeOrderModelToJson(RemoveOrderCartModel data) =>
    json.encode(data.toJson());

class RemoveOrderCartModel {
  RemoveOrderCartModel({
    this.status,
    this.message,
     this.data,
  });

  bool? status;
  String? message;
  RemoveDataCart? data;

  factory RemoveOrderCartModel.fromJson(Map<String, dynamic> json) =>
      RemoveOrderCartModel(
        status: json["status"],
        message: json["message"],
        data: RemoveDataCart.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data!.toJson(),
      };
}

class RemoveDataCart {
  RemoveDataCart({
    this.cart,
    this.subTotal,
    this.total,
  });

   RemoveDataOfCart? cart;
   dynamic subTotal;
   dynamic total;

  factory RemoveDataCart.fromJson(Map<String, dynamic> json) => RemoveDataCart(
        cart: RemoveDataOfCart.fromJson(json["cart"]),
        subTotal: json["sub_total"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "cart": cart!.toJson(),
        "sub_total": subTotal,
        "total": total,
      };
}

class RemoveDataOfCart {
  RemoveDataOfCart({
     this.id,
     this.quantity,
     this.product,
  });

   int? id;
   int? quantity;
   RemoveProductOfCart? product;

  factory RemoveDataOfCart.fromJson(Map<String, dynamic> json) =>
      RemoveDataOfCart(
        id: json["id"],
        quantity: json["quantity"],
        product: RemoveProductOfCart.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "quantity": quantity,
        "product": product!.toJson(),
      };
}

class RemoveProductOfCart {
  RemoveProductOfCart({
     this.id,
     this.price,
     this.oldPrice,
     this.discount,
     this.image,
  });

   int? id;
 dynamic price;
  dynamic  oldPrice;
   int? discount;
   String? image;

  factory RemoveProductOfCart.fromJson(Map<String, dynamic> json) =>
      RemoveProductOfCart(
        id: json["id"],
        price: json["price"],
        oldPrice: json["old_price"],
        discount: json["discount"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "price": price,
        "old_price": oldPrice,
        "discount": discount,
        "image": image,
      };
}
