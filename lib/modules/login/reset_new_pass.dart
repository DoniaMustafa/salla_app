import 'package:e_commerce/modules/login/login_screen.dart';
import 'package:e_commerce/shared/components/constance/constants.dart';
import 'package:e_commerce/shared/components/default_button/material_but_widget.dart';
import 'package:e_commerce/shared/components/default_navigator/navigat.dart';
import 'package:e_commerce/shared/components/default_text_and_list/text_form.dart';
import 'package:e_commerce/shared/components/generale_components/components.dart';
import 'package:e_commerce/shared/cubit/cubit_logAndReg/cubit_log_and_reg.dart';
import 'package:e_commerce/shared/cubit/cubit_logAndReg/state_log_and_reg.dart';
import 'package:e_commerce/shared/di/dependency_injaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ResetPass extends StatelessWidget {

  @override
   Widget build(BuildContext context) {
    return Directionality(
      textDirection: appCubit(context).textDirection,
      child: Scaffold(
          body: BlocProvider(
            create: (BuildContext context) => di<LoginCubit>(),
            child: BlocConsumer<LoginCubit, LoginState>(listener: (context, state) {
              if (state is ResetSuccessState) {
                navigaTo(context: context, widget: Login());
              }
              if (state is CodeVerifyErrorState) {
                showToast(
                    text: '${loginCubit(context).forgotPasswordModel!.message}',
                    tColor: ToastColors.ERROR,
                    gravity: ToastGravity.BOTTOM);
              }
            }, builder: (context, state) {
              var cubit = LoginCubit.get(context);

              return Scaffold(
                appBar: AppBar(),
                body: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisSize: MainAxisSize.min,
                        children: [
                         Text(
                          '${transModel(context).newPassTitle}',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                       defTextForm(
                        widthCon: 0.0,
                        heightCon: 0.0,
                        width: 50.0,
                        isEnableLine: true,
                        isFocusLine: true,
                        control: cubit.resetNewPassControl,
                        validate: '${transModel(context).validateNewPass}',
                        er: 10,
                        type: TextInputType.number,
                        fr: 10,
                        mx: 1,
                        isIcon: true,
                      ),
                          SizedBox(
                            height: 30,
                          ),
                          DefaultButton(
                            text: '${transModel(context).newPassBut}',
                            height: 50,
                            width: double.infinity,
                            onPress: () => loginCubit(context).resetPass(
                                email: cubit.emlverifyControl.text,
                                code: cubit.codeVerifyControl.text,
                            password: cubit.resetNewPassControl.text),
                            ),

                        ],
                      ),
                      if (state is ResetLoadingState)
                        CircularProgressIndicator(),
                    ],
                  ),
                ),
              );
            }),
          )),
    );
  }
  // Widget textForm(context) {
  //   var cubit = LoginCubit.get(context);
  //   return Container(
  //     alignment: Alignment.center,
  //     padding: EdgeInsets.symmetric(horizontal: 150),
  //     child: defTextForm(
  //       widthCon: 0.0,
  //       heightCon: 0.0,
  //       // width: 50.0,
  //       isEnableLine: true,
  //       isFocusLine: true,
  //       control: cubit.resetNewPassControl,
  //       validate: '{transModel(context).verifyCode}',
  //       er: 10,
  //       type: TextInputType.number,
  //       fr: 10,
  //       mx: 1,
  //       isIcon: true,
  //     ),
  //   );
  // }
}
