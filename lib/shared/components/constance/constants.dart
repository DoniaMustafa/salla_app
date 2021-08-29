import 'package:e_commerce/model/user_profile_model.dart';
import 'package:e_commerce/shared/cubit/cubit_app/cubit.dart';
import 'package:e_commerce/shared/cubit/cubit_home_product/cubit_pro.dart';
import 'package:e_commerce/shared/cubit/cubit_logAndReg/cubit_log_and_reg.dart';
import 'package:e_commerce/shared/cubit/order/order_cubit.dart';
import 'package:e_commerce/shared/cubit/setting/setting_cubit.dart';
import 'package:e_commerce/shared/di/dependency_injaction.dart';
import 'package:e_commerce/shared/localization/model_translate%20.dart';
import 'package:e_commerce/shared/network/local/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

  String? appLangDirection  ;
 String? myToken ='' ;
 bool isDark = false;
double width(context) {
  double width = MediaQuery.of(context).size.width;
  return width;
}

TranslationModel transModel(context) => AppCubit.get(context).translationModel!;
ProductCubit productCubit(context) => ProductCubit.get(context);
AppCubit appCubit(context) => AppCubit.get(context);
LoginCubit loginCubit(context) => LoginCubit.get(context);

SettingCubit settingCubit(context) => SettingCubit.get(context);
OrderCubit orderCubit(context) => OrderCubit.get(context);

Future<bool> setLangDirToShard(String setCode) async {
  appLangDirection = setCode;
  return await di<CacheHelper>().put('languageDir', setCode);
}

Future<dynamic> getAppLangAndDir() async {
  return await di<CacheHelper>().get('languageDir');
}

Future<dynamic> getUserToken() async {

  return await di<CacheHelper>().get('userToken');
}

Future<dynamic> getUserData() async {
  return await di<CacheHelper>().get('userModel');
}

Future<dynamic> clearToken() async {
  return await di<CacheHelper>().clear('userToken');
}

Future<String> getTranslationFile(String code) async {
  return await rootBundle.loadString('assets/translation/${code.toString() == null ?'en':code.toString()}.json');
}

Future<bool> saveAppTheme(bool theme) async {
  return await di<CacheHelper>().put('theme', theme);
}

Future<dynamic> getAppTheme() async {
  return await di<CacheHelper>().get('theme');
}
