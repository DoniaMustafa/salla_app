import 'package:dio/dio.dart';
import 'package:e_commerce/model/forgotpass_Model.dart';
import 'package:e_commerce/model/user_profile_model.dart';
import 'package:e_commerce/model/user_regi_model.dart';
import 'package:e_commerce/shared/components/constance/constants.dart';
import 'package:e_commerce/shared/components/generale_components/components.dart';
import 'package:e_commerce/shared/cubit/cubit_logAndReg/state_log_and_reg.dart';
import 'package:e_commerce/shared/di/dependency_injaction.dart';
import 'package:e_commerce/shared/network/end_path.dart';
import 'package:e_commerce/shared/network/local/cache_helper.dart';
import 'package:e_commerce/shared/network/remote/dio_helper.dart';
import 'package:e_commerce/shared/network/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginCubit extends Cubit<LoginState> {
  Repository repository;
  DioHelper dioHelper;
  LoginCubit(this.repository, this.dioHelper) : super(InitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  final GlobalKey<FormState> formKay = GlobalKey<FormState>();
  final GlobalKey<FormState> formKay2 = GlobalKey<FormState>();
  TextEditingController emlControl = TextEditingController();
  TextEditingController emlverifyControl = TextEditingController();
  TextEditingController codeVerifyControl = TextEditingController();
  TextEditingController resetNewPassControl = TextEditingController();

  TextEditingController pasControl = TextEditingController();
  TextEditingController em2lControl = TextEditingController();
  TextEditingController passControl = TextEditingController();
  TextEditingController usControl = TextEditingController();
  TextEditingController phoControl = TextEditingController();
  bool isPass = true;
  // File image;
  UserProfileModel? userData;
  UserModel? userModel;
  ForgotPasswordModel? forgotPasswordModel;
  // final picker = ImagePicker();
  UserData? data;
  VerifyEmailModel? verifyEmailModel;
  showPass() {
    isPass = !isPass;
    emit(LoginShowPassState());
  }

  // final userInfo = FirebaseAuth.instance.currentUser;
  // Future getImageCamera() async {
  //   // final pickedFile = await picker.getImage(source: ImageSource.camera);
  //
  //   if (pickedFile != null) {
  //     image = File(pickedFile.path);
  //   } else {
  //     print('No image selected.');
  //   }
  //   emit(RegisterGetImageCameraState());
  // }

  // Future getImageGallery() async {
  //   final pickedFile = await picker.getImage(source: ImageSource.gallery);
  //
  //   if (pickedFile != null) {
  //     image = File(pickedFile.path);
  //   } else {
  //     print('No image selected.');
  //   }
  //   emit(RegisterGetImageGalleryState());
  // }

  bool islogin = true;

  ff() {
    if (islogin) {
      islogin = false;
      emit(DLoadingState());
    } else {
      islogin = true;

      emit(DSuccessState());
    }
  }
 var user;
  Future<Response?> signIn(
      {required String email, required String pass, context}) async {
    emit(LoginLoadingState());
    // return await repository
    //      .userLogin(email: email, password: pass)
    Dio().post('https://student.valuxapps.com/api/login',
        data: {'email': email, 'password': pass}).then((value) async {
      print('data>>>>>>>${value.data}');
      user=value.data;
      userData = userProfileModelFromJson(value.toString());
      print('dataModel>>>>>>>${userData!.data!.name}');
      print('message ${userData!.message}');
      LoginSuccesddsState();
      di<CacheHelper>().put('userModel', userData).then((value) {
        // myToken=userData.data.token.toString();
        di<CacheHelper>()
            .put('userToken', userData!.data!.token)
            .then((values) async {
          print('tokeeeeen: ${getUserToken().toString()}');
          emit(LoginSuccessState());
        }).catchError((onError) {
          print(onError.toString());
        });
      }).catchError((error) {
        print(error.toString());
      });

      //
      // if(userData!.status==true) {
      //   print('status ${userData!.status}');
      //
      //   emit(LoginSuccessState());
      // }else
      //   print('message ${userData!.message}');
      //   emit(LoginErrorState(userData!.message));
    }).catchError((error) {
      if (user['status'] == false) {
        showToast(
            text: '${user['message'] }',
            tColor: ToastColors.ERROR,
            gravity: ToastGravity.BOTTOM);
      }
      print('error userToken ${error.toString()}');
      emit(LoginErrorState(error.toString()));
    });
  }

  Future<Response?> verifyEmail(
      {required String email, required BuildContext context}) async {
    emit(EmailVLoadingState());
    return await Dio().post('https://student.valuxapps.com/api/verify-email',
        data: {"email": email}).then((value) {
      verifyEmailModel = verifyEmailModelFromJson(value.toString());
      print(value.data);

      if (loginCubit(context).verifyEmailModel!.status == false) {
        showToast(
            text: '${loginCubit(context).verifyEmailModel!.message}',
            tColor: ToastColors.ERROR,
            gravity: ToastGravity.BOTTOM);
      }
      emit(EmailVSuccessState());
    }).catchError((onError) {
      print(onError.toString());
      // showToast(text: '${loginCubit(context).verifyEmailModel!.message}', tColor: ToastColors.ERROR, gravity: ToastGravity.BOTTOM);

      emit(EmailVErrorState());
    });
  }

  VerifyCodeModel? verifyCodeModel;

  Future<Response?> verifyCode(
      {required String email,
      required int code,
      required BuildContext context}) async {
    emit(CodeVerifyLoadingState());
    return await Dio().post('https://student.valuxapps.com/api/verify-code',
        data: {"email": email, "code": code}).then((value) {
      verifyCodeModel = verifyCodeModelFromJson(value.toString());
      print(value.data);
      if (loginCubit(context).verifyCodeModel!.status == false) {
        showToast(
            text: '${loginCubit(context).verifyCodeModel!.message}',
            tColor: ToastColors.ERROR,
            gravity: ToastGravity.BOTTOM);
      }

      emit(CodeVerifySuccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(CodeVerifyErrorState());
    });
  }

  Future<Response?> resetPass(
      {required String email,
      required String code,
      required String password}) async {
    emit(ResetLoadingState());
    return await Dio().post('https://student.valuxapps.com/api/reset-password',
        data: {
          "email": email,
          "code": code,
          "password": password
        }).then((value) {
      print(value.data);
      emit(ResetSuccessState());
    }).catchError((onError) {
      print(onError.toString());

      emit(ResetErrorState());
    });
  }

  Future<Response?> register({
    String? name,
    String? phone,
    String? email,
    String? password,
  }) async {
    emit(RegisterLoadingState());
    return await Dio()
        .post('https://student.valuxapps.com/api/register', data: {
      'email': email,
      'password': password,
      'name': name,
      'phone': phone,
      'image': 'https://student.valuxapps.com/storage/assets/defaults/user.jpg'
    }).then((value) {
      userModel = UserModel.fromJson(value.data);
      print(userModel);
      // repository.userVerify(email: userModel.data.email).then((val) {
      //   print('userVerify : ${val.data}');
      // }).catchError((onError){});
      if (userModel!.status!) {
        emit(RegisterSuccessState(userModel!));
      } else {
        emit(RegisterErrorState(userModel!.message));
      }
    }).catchError((error) {
      print(error.toString());
      emit(RegisterErrorState(error.toString()));
    });
  }
  //
  // String data1;
  // String data2;
  // String data3;
  // Future<UserCredential> authByFacebook() async {
  //   emit(FacebookLoadingState());
  //
  //   final AccessToken accessToken = await FacebookAuth.instance.login();
  //
  //   print(accessToken.token);
  //   final credential = FacebookAuthProvider.credential(accessToken.token);
  //   print(credential.accessToken);
  //   return await FirebaseAuth.instance
  //       .signInWithCredential(credential)
  //       .then((value)async {
  //     // if (value != null && !value.user.emailVerified) {
  //     //   var actionCodeSettings = ActionCodeSettings(
  //     //     url: 'https://www.example.com/?email=${value.user.email}',
  //     //     handleCodeInApp: true,
  //     //   );
  //     //   await value.user.sendEmailVerification(actionCodeSettings);
  //     // }
  //     //
  //     //
  //     // // String data = value.additionalUserInfo.username;
  //     // data1 = value.user.displayName;
  //     // var bdata2=value.user.uid;
  //     // print('tokeeeeen: $bdata2');
  //     //
  //     // print('name : $data1');
  //     // di<CacheHelper>().put('userModel', value.user).then((val) {
  //     //   // myToken=userData.data.token.toString();
  //     //   di<CacheHelper>()
  //     //       .put('userToken', value.user.refreshToken)
  //     //       .then((values) async {
  //     //
  //     //     print('tokeeeeen: ${getUserToken().toString()}');
  //     //   });
  //     // });
  //
  //     emit(FacebookSuccessState());
  //   }).catchError((onError) {
  //     print('erroe ${onError.toString()}');
  //     emit(FacebookErrorState());
  //   });

  // Future<UserCredential> signInWithFacebook() async {
  //   // Trigger the sign-in flow
  //   final AccessToken result = await FacebookAuth.instance.login();
  //
  //   // Create a credential from the access token
  //   final facebookAuthCredential = FacebookAuthProvider.credential(result.token);
  //
  //   // Once signed in, return the UserCredential
  //   return await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  // }
}

// GoogleSignIn _googleSignIn = GoogleSignIn(
//   scopes: [
//     'email',
//     'https://www.googleapis.com/auth/contacts.readonly',
//   ],
// );
// Future<UserCredential> signInWithGoogle() async {
//   // Trigger the authentication flow
//   print('ddcv');
//   final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
//
//   // Obtain the auth details from the request
//   final GoogleSignInAuthentication googleAuth =
//       await googleUser.authentication;
//
//   // Create a new credential
//   final GoogleAuthCredential credential = GoogleAuthProvider.credential(
//     accessToken: googleAuth.accessToken,
//     idToken: googleAuth.idToken,
//   );
//
//   // Once signed in, return the UserCredential
//   await FirebaseAuth.instance.signInWithCredential(credential);
//   // emit(GoogleLoadingState());
// }

// Future<void> authByGoogle() async {
//   emit(GoogleLoadingState());
//   try {
//     await _googleSignIn.signIn();
//   } catch (error) {
//     emit(GoogleErrorState());
//
//     print(error);
//   }
// }
// final googleSignIn = GoogleSignIn();
//   GoogleSignInAccount _user;
//   GoogleSignInAccount get user =>_user;
//   Future googleLogin()async{
//     final googleUser = await GoogleSignIn().signIn();
//     // if(googleUser ==null)
//       _user =googleUser;
//     final googleAuth = await googleUser.authentication;
//
//     final credential = GoogleAuthProvider.credential(
//       accessToken: googleAuth.accessToken,
//       idToken: googleAuth.idToken,
//     );
//      await FirebaseAuth.instance.signInWithCredential(credential);
//     emit(GoogleSuccessState());
//   }
