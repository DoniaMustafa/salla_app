// To parse this JSON data, do
//
//     final orderDetailsModel = orderDetailsModelFromJson(jsonString);

import 'dart:convert';

OrderDetailsModel orderDetailsModelFromJson(String str) => OrderDetailsModel.fromJson(json.decode(str));

String orderDetailsModelToJson(OrderDetailsModel data) => json.encode(data.toJson());

class OrderDetailsModel {
  OrderDetailsModel({
     this.status,
    this.message,
     required this.data,
  });

   bool? status;
  dynamic message;
    late Data data;

  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) => OrderDetailsModel(
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
    this.cost,
    this.discount,
    this.points,
    this.vat,
    this.total,
    this.pointsCommission,
    required this.promoCode,
    required this.paymentMethod,
    required  this.date,
    required  this.status,
    required  this.address,
    required this.products,
  });

 late int id;
  dynamic cost;
  dynamic discount;
  dynamic points;
  dynamic vat;
  dynamic total;
  dynamic pointsCommission;
  late String promoCode;
  late String paymentMethod;
  late String date;
  late String status;
  late Address address;
  late List<Product> products;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    cost: json["cost"],
    discount: json["discount"],
    points: json["points"],
    vat: json["vat"].toDouble(),
    total: json["total"].toDouble(),
    pointsCommission: json["points_commission"],
    promoCode: json["promo_code"],
    paymentMethod: json["payment_method"],
    date: json["date"],
    status: json["status"],
    address: Address.fromJson(json["address"]),
    products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "cost": cost,
    "discount": discount,
    "points": points,
    "vat": vat,
    "total": total,
    "points_commission": pointsCommission,
    "promo_code": promoCode,
    "payment_method": paymentMethod,
    "date": date,
    "status": status,
    "address": address.toJson(),
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
  };
}

class Address {
  Address({
    required  this.id,
    required this.name,
    required this.city,
    required this.region,
    required this.details,
    required this.notes,
    required this.latitude,
    required this.longitude,
  });

  late int id;
  late String name;
  late String city;
  late String region;
  late String details;
  late String notes;
  dynamic latitude;
  dynamic longitude;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    id: json["id"],
    name: json["name"],
    city: json["city"],
    region: json["region"],
    details: json["details"],
    notes: json["notes"],
    latitude: json["latitude"].toDouble(),
    longitude: json["longitude"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "city": city,
    "region": region,
    "details": details,
    "notes": notes,
    "latitude": latitude,
    "longitude": longitude,
  };
}

class Product {
  Product({
    required this.id,
    required this.quantity,
    required this.price,
    required this.name,
    required this.image,
  });

  late int id;
  dynamic quantity;
  dynamic price;
  late String name;
  late String image;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    quantity: json["quantity"],
    price: json["price"],
    name: json["name"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "quantity": quantity,
    "price": price,
    "name": name,
    "image": image,
  };
}
