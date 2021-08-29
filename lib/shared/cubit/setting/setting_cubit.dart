import 'package:dio/dio.dart';
import 'package:e_commerce/model/notify_model.dart';
import 'package:e_commerce/model/setting_model.dart';
import 'package:e_commerce/model/updata_profile_model.dart';
import 'package:e_commerce/model/user_profile_model.dart';
import 'package:e_commerce/modules/login/login_screen.dart';
import 'package:e_commerce/shared/components/constance/constants.dart';
import 'package:e_commerce/shared/components/default_navigator/navigat.dart';
import 'package:e_commerce/shared/cubit/setting/state_cubit.dart';
import 'package:e_commerce/shared/network/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingCubit extends Cubit<SettingState>{

  Repository repository;
  SettingCubit(this.repository) : super(SittingInitialState());
  static SettingCubit get(context) => BlocProvider.of(context);
   SettingsModel? setting;
   FaqModel? faqModel;
   ContactsModel? contacts;
   UpDataProfileModel? updateProfile;
     UserProfileModel? userProfile;

   String?  myName ;
   String?  myEmail;
   String?  myPhone;
  var passError ;
   final upDate = GlobalKey<FormState>();
  final changePass = GlobalKey<FormState>();
  final feedbackKay = GlobalKey<FormState>();
  final feedController = TextEditingController();
  final controller = TextEditingController();
  final usController = TextEditingController();
  final emController = TextEditingController();
  final phController = TextEditingController();
  final currentPassController = TextEditingController();
  final newPassController = TextEditingController();
  final conName = TextEditingController();
  final conEmail = TextEditingController();
  final conPhone = TextEditingController();
  final complaintController = TextEditingController();

  Future<Response?>getProfileInfo() async {
    emit(ProfileLoadingState());
    return await repository.userProfile(token: '$myToken').then((value) {
      userProfile = userProfileModelFromJson(value.toString());
      print(userProfile!.data!.name);
      myName=  userProfile!.data!.name.toString();  
      myEmail= userProfile!.data!.email.toString(); 
      myPhone= userProfile!.data!.phone.toString(); 
       usController.text =myName.toString();
       emController.text=myEmail.toString();
       phController.text=myPhone.toString();
      emit(ProfileSuccessState());
    }).catchError((error) {
      print('getProfileInfoerror : ${error.toString()}');
      emit(ProfileErrorState());
    });
  }

  Future <Response?> upDateProfile(
      {required String name,required String email, required String phone,context}) async {
    emit(UpDateLoadingStates());
    return await repository
        .upDateUser(name: '$name', phone: '$phone', email: '$email', token: '$myToken')
        .then((value) {
       updateProfile = upDataProfileModelFromJson(value.toString());
       print(value.data);
       emit(UpDateSuccessStates());
    }).catchError((error) {
      print('error ${error.toString()}');
      emit(UpDateErrorStates());
    });
  }

  Future <Response?> changePassword({required String currentP,required  String newP}) async {
    emit(ChangePasswordLoadingState());
    return await repository
        .changePass(
        currentPassword: '$currentP', newPassword: '$newP', token: '$myToken')
        .then((value) {
      passError =value.data['message'];
      print('ChangePass ${value.data}');
      emit(ChangePasswordSuccessState());
    }).catchError((error) {
      print('ChangePass Error ${error.toString()}');
      emit(ChangePasswordErrorState());
    });
    
  }

  Future<Response?> getSettings() async {
     // emit(SettingLoadingState());
     return await Dio().get('https://student.valuxapps.com/api/settings').then((value) {
      setting = settingModelFromJson(value.toString());
      print(setting!.data!.about);
      emit(SettingSuccessState());
    }).catchError((error) {
      print('error settings ${error.toString()}');
      emit(SettingErrorState());
    });
  }

  Future<Response?>getFAQ() async {
    // emit(FAQLoadingState());

    return await Dio().get('https://student.valuxapps.com/api/faqs').then((value) {
      faqModel = faqModelFromJson(value.toString());
      print(faqModel);
      emit(FAQSuccessState());
    }).catchError((onError) {
      print('Complaint ON Error${onError.toString()}');
      emit(FAQErrorState());
    });
  }

   Future <Response?>getContact() async {
    emit(ContactsLoadingState());
    print('content');
    return await Dio().get( 'https://student.valuxapps.com/api/contacts').then((value) {

      contacts = contactsModelFromJson(value.toString());
      print('content ${value.data}');
      emit(ContactsSuccessState());
    }).catchError((onError) {
      print('Contact ON Error${onError.toString()}');
      emit(ContactsErrorState());
    });
  }
  Future <Response?>getontact() async {
    emit(ContactLoadingState());
    return await Dio().get('https://student.valuxapps.com/api/contacts').then((value) {

      // contacts = contactsModelFromJson(value.toString());
      print('content ${value.data}');
      emit(ContactSuccessState());
    }).catchError((onError) {
      print('Contact ON Error${onError.toString()}');
      emit(ContactErrorState());
    });
  }
  Future <Response?>  setComplaints({
    required String name,
    required String email,
    required String phone,
    required String message,
  }) async {
    emit(ComplaintsLoadingState());
    return  Dio().post('https://student.valuxapps.com/api/complaints', data: {
      'name': name,
      'phone': phone,
      'email': email,
      'message': message
    })
    // repository
    //     .complaints(name: '$name', phone: '$phone', email: '$email', message: '$message')
        .then((value) {
      // complaint = jsonDecode(value.data);

      print(value.data);
      emit(ComplaintsSuccessState());
    }).catchError((onError) {
      print('Complaint ON Error${onError.toString()}');
      emit(ComplaintsErrorState());
    });
  }
  Future <Response?> logOut(context) async {
    emit(LogOutLoadingStates());
    return await repository.logOut(token: '$myToken')
        .then((value) {
      print('logout : ${value.data}');

      emit(LogOutSuccessStates());
    }).catchError((onError) {
      print('Logout Error States${onError.toString()}');
      emit(LogOutErrorStates());
    });
  }


}