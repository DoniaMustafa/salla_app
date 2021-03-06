// To parse this JSON data, do
//
//     final ordersModel = ordersModelFromJson(jsonString);

import 'dart:convert';

OrdersModel ordersModelFromJson(String str) => OrdersModel.fromJson(json.decode(str));

String ordersModelToJson(OrdersModel data) => json.encode(data.toJson());

class OrdersModel {
  OrdersModel({
      this.status,
    this.message,
     this.data,
  });

  bool? status;
  dynamic message;
   OrdersData? data;

  factory OrdersModel.fromJson(Map<String, dynamic> json) => OrdersModel(
    status: json["status"],
    message: json["message"],
    data: OrdersData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data!.toJson(),
  };
}

class OrdersData {
  OrdersData({
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
   List<OrdersInfo>? data;
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

  factory OrdersData.fromJson(Map<String, dynamic> json) => OrdersData(
    currentPage: json["current_page"],
    data: List<OrdersInfo>.from(json["data"].map((x) => OrdersInfo.fromJson(x))),
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

class OrdersInfo {
  OrdersInfo({
      this.id,
      this.total,
     this.date,
     this.status,
  });

  int? id;
   double? total;
   String? date;
   String? status;

  factory OrdersInfo.fromJson(Map<String, dynamic> json) => OrdersInfo(
    id: json["id"],
    total: json["total"].toDouble(),
    date: json["date"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "total": total,
    "date":date,
    "status": status,
  };



}
