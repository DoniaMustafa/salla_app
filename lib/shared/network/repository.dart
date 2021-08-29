import 'package:dio/dio.dart';
import 'package:e_commerce/shared/network/end_path.dart';
import 'package:e_commerce/shared/network/local/cache_helper.dart';
import 'package:e_commerce/shared/network/remote/dio_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class Repository {
  Future<Response> userLogin(
      {required String email, required String password});

  Future<Response> homeProduct({required String token});

  Future<Response> userRegister({required String email,
    required String password,
    required String name,
    required String phone,
    String image});

  Future<Response> addAddress({
    required String token,
    required String name,
    required String city,
    required String region,
    required String details,
    required dynamic latitude,
    required dynamic longitude,
    required String notes,
  });

  Future<Response> getAddress({
    required String token,
  });

  Future<Response> upDateAddress({
    required String token,
    required String name,
    required int id,
    required String city,
    required String region,
    required String details,
    required dynamic latitude,
    required dynamic longitude,
    required String notes,
  });

  Future<Response> deleteAddress({
    required String token,
    required int id,
  });

  Future<Response> userProfile({@required String token});

  Future<Response> search({
    required String text,
    required String token,
  });

  Future<Response> categories();

  Future<Response> singleCategory({required String token, required int id});

  Future<Response> singleProduct({required int id, required String token});

  Future<Response> upDateUser({
    required String name,
    required String email,
    required String phone,
    required String token,
  });

  Future<Response> changePass({
    required String currentPassword,
    required String newPassword,
    required String token,
  });

  Future<Response> settings();

  Future<Response> faqs();

  Future<Response> contacts();

  Future<Response> complaints({
    required String name,
    required String phone,
    required String email,
    required String message,
  });

  Future<Response> notifications({
    required String token,
  });

  Future<Response> getFavorites({
    required String token,
  });

  Future<Response> addAndRemoveFavorite(
      {required String token, required int id});

  Future<Response> addAndRemoveCart({required String token, required int id});

  Future<Response> updateCart(
      {required String token,required int id, required int quantity});

  Future<Response> getCart({required String token});
  Future<Response>  removeSingleProInsideCart({ required String token,
    required int id,}
      );

  Future<Response> addOrder({
    required String token,
    required int addressId,
    required int paymentMethod,
     bool? usePoints,
    required int promoCodeId,
  });


  Future<Response> promoCode({
    required String token,
    required String code
  });

  Future<Response> getOrder({
    required String token,
  });

  Future<Response> orderDetails({
    required String token,
    required int id

  });
  Future<Response> estimateOrder({
    required String token,
  });
  Future<Response> cancelOrder({
    required String token,
    required int id
  });


  Future<Response> logOut({
    required String token,
  });

}

class RepoImplementation extends Repository {
   DioHelper dioHelper;
   CacheHelper cacheHelper;

  RepoImplementation({ required this.dioHelper,required  this.cacheHelper});

  @override
  Future<Response>userLogin({ String? email, String? password}) async {
    return await dioHelper.postData(
        url: Login_End_Path, data: {'email': email, 'password': password});
  }

  @override
  Future<Response> homeProduct({ String? token}) async {
    return await dioHelper.getData(token: token!, url: Home_End_Path);
  }

  @override
  Future<Response> userRegister(
      { String? email,
         String? password,
         String? name,
         String? phone,
         String? image}) async {
    return await dioHelper.postData(url: Register_End_Path, data: {
      'email': email,
      'password': password,
      'name': name,
      'phone': phone,
      'image': 'https://student.valuxapps.com/storage/assets/defaults/user.jpg'
    });
  }

  @override
  Future<Response> userProfile({ String? token}) async {
    return await dioHelper.getData(url: Profile_End_Path, token: token!);
  }

  @override
  Future<Response> categories() async {
    return await dioHelper.getData(url: Category_End_Path,);
  }

  @override
  Future<Response> singleCategory(
      { String? token,  int? id}) async {
    return await dioHelper.getData(
        url: 'categories/$id', token: token.toString());
  }

  @override
  Future<Response> search({
      String? text,
     String? token,
  }) async {
    return await dioHelper.postData(
        url: Search_End_Path, data: {'text': text}, token: token!);
  }

  @override
  Future<Response> singleProduct(
      { int? id,  String? token}) async {
    return await dioHelper.getData(url: '$Single_Product_End_Path/$id',token: token!);
  }

  @override
  Future<Response> upDateUser(
      { String? name,  String? email,  String? phone,  String? token}) async {
    return await dioHelper.putData(url: UpData_Profile_End_Path, token: token!, data: {
      'name': name,
      'email': email,
      'phone': phone,
      'image':
          'https://cdn4.iconfinder.com/data/icons/small-n-flat/24/user-alt-512.png',
      'password': '123456789'
    });
  }

  @override
  Future<Response> changePass(
      { String? currentPassword,
         String? newPassword,
         String? token}) async {
    return await dioHelper.postData(
        url: Change_Password_End_Path,
        token: '$token',
        data: {
          'current_Password': currentPassword,
          'new_password': newPassword
        });
  }

  @override
  Future<Response> settings() async {
    return await dioHelper.getData(url: Settings_End_Path);
  }

  @override
  Future<Response> faqs() async {
    return await dioHelper.getData(url: FAQ_End_Path);
  }

  @override
  Future<Response> complaints(
      {required String name, required String phone,required String email,required String message}) async {
    return await dioHelper.postData(url: Complaint_End_Path, data: {
      'name': name,
      'phone': phone,
      'email': email,
      'message': message
    });
  }

  @override
  Future<Response> contacts() async {
    return await dioHelper.getData(url: Contact_End_Path);
  }

  @override
  Future<Response> notifications({ String? token}) async {
    return await dioHelper.getData(url: Notifications_End_Path, token: token!);
  }

  @override
  Future<Response> addAndRemoveFavorite({String? token, int? id}) async {
    return await dioHelper.postData(
        url: Add_Favorite_End_Path, data: {'product_id': id}, token: token!);
  }

  @override
  Future<Response> getFavorites({String? token}) async {
    return await dioHelper.getData(url: Get_Favorites_End_Path, token: token!);
  }

  @override
  Future<Response> addAndRemoveCart({String? token, int? id}) async {
    return await dioHelper.postData(
        url: Cart_Add_Remove_Get_End_Path,
        token: '$token',
        data: {'product_id': id});
  }

  @override
  Future<Response> getCart({String? token, int? id}) async {
    return await dioHelper.getData(url: Get_Cart_End_Path, token: token!);
  }

  @override
  Future<Response> updateCart({String? token, int? id, int? quantity}) async {
    return await dioHelper.putData(
        url: '$Update_Cart_End_Path/$id',
        token: token!,
        data: {'quantity': quantity});
  }

  @override
  Future<Response> addAddress(
      { String? token,
          String? name,
          String? city,
          String? region,
         String? details,
         dynamic latitude,
         dynamic longitude,
         String? notes}) async {
    return await dioHelper.postData(url: '$Add_Address_End_Path', token: '$token', data: {
      'name': name,
      'city': city,
      'region': region,
      'details': details,
      'latitude': '$latitude',
      'longitude': '$longitude',
      'notes': notes,
    });
  }

  @override
  Future<Response> getAddress({String? token}) async {
    return await dioHelper.getData(url: '$Get_Address_End_Path', token: token!);
  }

  @override
  Future<Response> upDateAddress(
      {String? token,
      String? name,
      int? id,
      String? city,
      String? region,
      String? details,
      dynamic latitude,
      dynamic longitude,
      String? notes}) async {
    return await dioHelper
        .putData(url: '$UpDate_Address_End_Path/$id', token: token!, data: {
      'name': name,
      'city': city,
      'region': region,
      'details': details,
      'latitude': '$latitude',
      'longitude': '$longitude',
      'notes': notes,
    });
  }

  @override
  Future<Response> deleteAddress({ String? token,  int? id}) async {
    return await dioHelper.deleteData(
        url: '$Delete_Address_End_Path/$id' , token: token!);
  }

  @override
  Future<Response> addOrder({String? token, int? addressId, int? paymentMethod,
    bool? usePoints, int promoCodeId = 0}) async{
    return await dioHelper.postData(
        url: Add_Orders_Address_End_Path,
        token: '$token',
        data: {'address_id':addressId,
        'payment_method': paymentMethod,
          'use_points':false,
          'promo_code_id':promoCodeId
        });
  }

  @override
  Future<Response> promoCode({String? token, String? code})async {
    return await dioHelper.postData(
        url: Promo_Code_End_Path,
        token: '$token',
        data: {'code':'$code'
        });
  }

  @override
  Future<Response> getOrder({String? token})async {
    return await dioHelper.getData(url: '$Get_Orders_Address_End_Path', token: token!);
  }



  @override
  Future<Response> estimateOrder({String? token,
  bool? usePoints,int? promoCodeId})async {
    return await dioHelper.postData(url: '$Estimate_Order_End_Path ', token: token!,
    data: {
      'use_points':usePoints,
      'promo_code_id':promoCodeId
    });

  }

  @override
  Future<Response> orderDetails({String? token,int? id})async {
    return await dioHelper.getData(url: '$Order_Details_Address_End_Path/$id', token: token!);

  }

  @override
  Future<Response> cancelOrder({String? token ,int? id}) async{
    return await dioHelper.getData(url:'$Order_Cancel__Address_End_Path/$id/$Cancel_Order_End_Path', token: token!);

  }

  @override
  Future<Response> userVerify({String? email})async{
    return await dioHelper.postData(url: '$Email_Verify_Address_End_Path', data: {'email':email});
  }

  @override
  Future<Response> removeSingleProInsideCart({String? token, int? id}) async {
    return await dioHelper.deleteData(
        url:'$Cart_Remove_Single_pro_End_Path/$id', token: token!);
  }

  @override
  Future<Response> logOut({String? token})async {
    return await dioHelper.postData(url: '$Logout_End_Path',token: token!, data: {});
  }
}
