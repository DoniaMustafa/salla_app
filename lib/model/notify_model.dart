// To parse this JSON data, do
//
//     final notifyModel = notifyModelFromJson(jsonString);

import 'dart:convert';

NotifyModel notifyModelFromJson(String str) =>
    NotifyModel.fromJson(json.decode(str));

String notifyModelToJson(NotifyModel data) => json.encode(data.toJson());

class NotifyModel {
  NotifyModel({
     this.status,
    this.message,
    this.data,
  });

   bool? status;
  dynamic message;
  Data? data;

  factory NotifyModel.fromJson(Map<String, dynamic> json) => NotifyModel(
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
    this.data,
     this.currentPage,
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
  List<DataNotify>? data;
   int? currentPage;
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
        data: List<DataNotify>.from(
            json["data"].map((x) => DataNotify.fromJson(x))),
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

class DataNotify {
  DataNotify({
   required this.id,
    required this.title,
    required this.message,
  });

 late int id;

  late String title;
  late String message;

  factory DataNotify.fromJson(Map<String, dynamic> json) => DataNotify(
        id: json["id"],
        title: json["title"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "message": message,
      };
}
