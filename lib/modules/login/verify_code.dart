import 'package:csc_picker/csc_picker.dart';
import 'package:e_commerce/modules/login/reset_new_pass.dart';
import 'package:e_commerce/shared/components/constance/constants.dart';
import 'package:e_commerce/shared/components/default_button/material_but_widget.dart';
import 'package:e_commerce/shared/components/default_navigator/navigat.dart';
import 'package:e_commerce/shared/components/default_text_and_list/text_form.dart';
import 'package:e_commerce/shared/components/generale_components/components.dart';
import 'package:e_commerce/shared/cubit/cubit_logAndReg/cubit_log_and_reg.dart';
import 'package:e_commerce/shared/cubit/cubit_logAndReg/state_log_and_reg.dart';
import 'package:e_commerce/shared/di/dependency_injaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class VerifyCode extends StatelessWidget {
  const VerifyCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: appCubit(context).textDirection,
      child: Scaffold(
          body: BlocProvider(
        create: (BuildContext context) => di<LoginCubit>(),
        child: BlocConsumer<LoginCubit, LoginState>(listener: (context, state) {
          if (state is CodeVerifySuccessState &&loginCubit(context).verifyCodeModel!.status ==true) {
            navigaTo(context: context, widget:ResetPass());
          }
          if (state is CodeVerifyErrorState) {
            showToast(
                text: '${loginCubit(context).verifyCodeModel!.message}',
                tColor: ToastColors.ERROR,
                gravity: ToastGravity.BOTTOM);
          }


        }, builder: (context, state) {
          var cubit = LoginCubit.get(context);

          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [


                  Text(
                    '${transModel(context).code}',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  // SizedBox(height: 12,),
                  // Text(
                  //   'Enter the email address associated with your account',
                  //   style: Theme.of(context).textTheme.subtitle1,
                  //   textAlign: TextAlign.center,),
                  SizedBox(
                    height: 20,
                  ),
                  textForm(context),
                  SizedBox(
                    height: 75,
                  ),
                  TextButton(
                    onPressed: () => loginCubit(context).verifyCode(
                        context: context,
                        email: cubit.emlverifyControl.text,
                        code: int.parse(cubit.codeVerifyControl.text)),
                    child:Text('${transModel(context).resend}') ,
                  ),
                  DefaultButton(
                    text: '${transModel(context).sendBut}',
                    height: 50,
                    onPress: () => loginCubit(context).verifyCode(
                      context: context,
                        email: cubit.emlverifyControl.text,
                        code: int.parse(cubit.codeVerifyControl.text)),
                    width: double.infinity,
                  )
                ],
              ),
            ),
          );
        }),
      )),
    );
  }

  Widget textForm(context) {
    var cubit = LoginCubit.get(context);
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 150),
      child: defTextForm(
        widthCon: 0.0,
        textAlign:TextAlign.center,
        heightCon: 0.0,
        width: 100.0,
        isEnableLine: true,
        isFocusLine: true,
        control: cubit.codeVerifyControl,
        validate: '${transModel(context).verifyCode}',
        er: 10,
        type: TextInputType.number,
        fr: 10,
        mx: 1,
        isIcon: true,
      ),
    );
  }
}
