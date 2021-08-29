// To parse this JSON data, do
//
//     final settingModel = settingModelFromJson(jsonString);

import 'dart:convert';

SettingsModel settingModelFromJson(String str) => SettingsModel.fromJson(json.decode(str));

String settingModelToJson(SettingsModel data) => json.encode(data.toJson());

class SettingsModel {
  SettingsModel({
     this.status,
    this.message,
     this.data,
  });

   bool? status;
    dynamic message;
    SettingData? data;

  factory SettingsModel.fromJson(Map<String, dynamic> json) => SettingsModel(
    status: json["status"],
    message: json["message"],
    data: SettingData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data!.toJson(),
  };
}

class SettingData {
  SettingData({
    this.about,
     this.terms,
  });

   String? about;
   String? terms;

  factory SettingData.fromJson(Map<String, dynamic> json) => SettingData(
    about: json["about"],
    terms: json["terms"],
  );

  Map<String, dynamic> toJson() => {
    "about": about,
    "terms": terms,
  };
}


// To parse this JSON data, do
//
//     final faqModel = faqModelFromJson(jsonString);


FaqModel faqModelFromJson(String str) => FaqModel.fromJson(json.decode(str));

String faqModelToJson(FaqModel data) => json.encode(data.toJson());

class FaqModel {
  FaqModel({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  dynamic message;
  FaqData? data;

  factory FaqModel.fromJson(Map<String, dynamic> json) => FaqModel(
    status: json["status"],
    message: json["message"],
    data: FaqData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data!.toJson(),
  };
}

class FaqData {
  FaqData({
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
  List<DataOfFaq>? data;
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

  factory FaqData.fromJson(Map<String, dynamic> json) => FaqData(
    currentPage: json["current_page"],
    data: List<DataOfFaq>.from(json["data"].map((x) => DataOfFaq.fromJson(x))),
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

class DataOfFaq {
  DataOfFaq({
      this.id,
     this.question,
     this.answer,
  });

  int? id;
  String? question;
  String? answer;

  factory DataOfFaq.fromJson(Map<String, dynamic> json) => DataOfFaq(
    id: json["id"],
    question: json["question"],
    answer: json["answer"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "question": question,
    "answer": answer,
  };
}


// To parse this JSON data, do
//
//     final contactsModel = contactsModelFromJson(jsonString);


ContactsModel contactsModelFromJson(String str) => ContactsModel.fromJson(json.decode(str));

String contactsModelToJson(ContactsModel data) => json.encode(data.toJson());

class ContactsModel {
  ContactsModel({
     this.status,
     this.message,
    this.data,
  });

   bool? status;
   dynamic message;
   ContactData? data;

  factory ContactsModel.fromJson(Map<String, dynamic> json) => ContactsModel(
    status: json["status"],
    message: json["message"],
    data: ContactData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data!.toJson(),
  };
}

class ContactData {
  ContactData({
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
   List<Contact>? data;
   String? firstPageUrl;
   int? from;
   int? lastPage;
   String? lastPageUrl;
   dynamic nextPageUrl;
   String? path;
  dynamic perPage;
  dynamic prevPageUrl;
   int? to;
   int? total;

  factory ContactData.fromJson(Map<String, dynamic> json) => ContactData(
    currentPage: json["current_page"],
    data: List<Contact>.from(json["data"].map((x) => Contact.fromJson(x))),
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

class Contact {
  Contact({
     this.id,
     this.type,
      this.value,
     this.image,
  });

   int? id;
   int? type;
   String? value;
   String? image;

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
    id: json["id"],
    type: json["type"],
    value: json["value"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "value": value,
    "image": image,
  };
}

