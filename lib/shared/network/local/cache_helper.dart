import 'dart:convert' hide utf8;

import 'package:shared_preferences/shared_preferences.dart';


abstract class CacheHelper{

  Future get(String kay);

  Future<bool> has(String kay);
  Future<bool> clear(String kay);
  Future<bool> put(String kay,dynamic value);
  Future<bool> putBool(String kay,bool value);

}
class CacheImp extends CacheHelper{
  final SharedPreferences _sharedPreferences;


  CacheImp(this._sharedPreferences);

  @override
  // Future<bool> has(String key)async {
  //   // final bool f = await _basicGetHandel(()async{
  //     return _sharedPreferences.containsKey(key)
  //         && _sharedPreferences.get(key).isEmpty;
  //   // });
  //   // return f;
  // }
  Future<bool> has(String key) async
  {
    // final bool f = await _basicErrorHandling(() async {
      return _sharedPreferences.containsKey(key) ;
          // && _sharedPreferences!.get(key);
    // });
    // return f;
  }
  @override
  Future get( String key) async {
    // final f = await _basicErrorHandling(() async {
    //   if (await has(key)) {
        return await jsonDecode(_sharedPreferences.get(key).toString());
    //   }
    //   return null;
    // });
    // return f;
  }
  @override
  Future<bool> put(String key,dynamic value) async{
    // final bool f = await _basicGetHandel(() async{
      return _sharedPreferences.setString(key, jsonEncode(value));
    // });
    // return f;
  }
  @override
  Future<bool> putBool(String key,bool value) async{
    // final bool f = await _basicGetHandel(() async{
    return _sharedPreferences.setBool(key, value);
    // });
    // return f;
  }
  @override
  Future<bool> clear(String key) async{
    // final bool f = await _basicGetHandel(() async{
      return _sharedPreferences.remove(key);
    // });
    // return f;
  }

  // @override
  // Future<bool> getBool(String key)async{
  //   return  sharedPreferences.getBool(key);
  //
  // }



}
 //it’s using in case the error
// extension on CacheHelper
// {
//    _basicErrorHandling<T>(Future<T> onSuccess()) async {
//
//     try {
//       final f = await onSuccess();
//       return f;
//     } catch (e)
//     {
//       print(e);
//     }
//
//   }
// }
