import 'package:flutter/cupertino.dart';

class LanguageModel {
   String? language;
   String? code;

  LanguageModel({ this.language,this.code});
}
class LocationModel{
  late String name;

  LocationModel({required this.name});
}

class PaymentModel {
  late IconData icon;
  late String title;
  late String subTitle;

  PaymentModel({required this.icon,required this.title,required this.subTitle});
}