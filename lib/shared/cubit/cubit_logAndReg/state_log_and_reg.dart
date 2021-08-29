
import 'package:e_commerce/model/user_profile_model.dart';
import 'package:e_commerce/model/user_regi_model.dart';

abstract class LoginState{}
class InitialState extends LoginState{}
class LoginLoadingState extends LoginState{

}
class LoginSuccessState extends LoginState{
  // final UserProfileModel userData;

  // LoginSuccessState();
}
class LoginSuccesddsState extends LoginState{}

class LoginErrorState extends LoginState{
  final String error;

  LoginErrorState(this.error);
}
class LoginShowPassState extends LoginState{}

class RegisterLoadingState extends LoginState{}
class RegisterSuccessState extends LoginState{
  final UserModel userModel;

  RegisterSuccessState(this.userModel);
}
class RegisterErrorState extends LoginState{
  final String error;

  RegisterErrorState(this.error);
}
class RegisterGetImageGalleryState extends LoginState{}
class RegisterGetImageCameraState extends LoginState{}

class FacebookLoadingState extends LoginState{}
class FacebookSuccessState extends LoginState{}
class FacebookErrorState extends LoginState{}
class DLoadingState extends LoginState{}
class DSuccessState extends LoginState{}
class DErrorState extends LoginState{}

class EmailVLoadingState extends LoginState{}
class EmailVSuccessState extends LoginState{}
class EmailVErrorState extends LoginState{}
class CodeVerifyLoadingState extends LoginState{}
class CodeVerifySuccessState extends LoginState{}
class CodeVerifyErrorState extends LoginState{}
class ResetLoadingState extends LoginState{}
class ResetSuccessState extends LoginState{}
class ResetErrorState extends LoginState{}
class SaveState extends LoginState{}
class GetState extends LoginState{}
