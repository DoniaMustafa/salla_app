import 'package:e_commerce/layout/home_layout.dart';
import 'package:e_commerce/modules/login/verify_code.dart';
import 'package:e_commerce/shared/components/constance/constants.dart';
import 'package:e_commerce/shared/components/default_button/material_but_widget.dart';
import 'package:e_commerce/shared/components/default_navigator/navigat.dart';
import 'package:e_commerce/shared/components/default_text_and_list/text_form.dart';
import 'package:e_commerce/shared/components/generale_components/components.dart';
import 'package:e_commerce/shared/cubit/cubit_app/cubit.dart';
import 'package:e_commerce/shared/cubit/cubit_logAndReg/cubit_log_and_reg.dart';
import 'package:e_commerce/shared/cubit/cubit_logAndReg/state_log_and_reg.dart';
import 'package:e_commerce/shared/di/dependency_injaction.dart';
import 'package:e_commerce/shared/stayle/icomoon_icons.dart';
import 'package:e_commerce/shared/stayle/stayles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ForgetPass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: appCubit(context).textDirection,
      child: Scaffold(
          body: BlocProvider(
        create: (BuildContext context) => di<LoginCubit>(),
        child: BlocConsumer<LoginCubit, LoginState>(listener: (context, state) {
          if (state is EmailVSuccessState&& loginCubit(context).verifyEmailModel!.status == true) {
            navigaTo(context: context, widget: VerifyCode());
          }
          if (loginCubit(context).verifyEmailModel!.status == true) {
            showToast(
                text: '${loginCubit(context).verifyEmailModel!.message}',
                tColor: ToastColors.SUCCESS,
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${transModel(context).titlePass}',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        '${transModel(context).subTitlePass}',
                        style: Theme.of(context).textTheme.subtitle1,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      textForm(context),
                      SizedBox(
                        height: 75,
                      ),
                      DefaultButton(
                        text: '${transModel(context).reset}',
                        height: 50,
                        onPress: () => loginCubit(context).verifyEmail(
                            email: cubit.emlverifyControl.text,
                            context: context),
                        width: double.infinity,
                      )
                    ],
                  ),
                  if (state is EmailVLoadingState) CircularProgressIndicator(),
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
    return defTextForm(
      widthCon: 0.0,
      heightCon: 0.0,
      width: double.infinity,
      isEnableLine: true,
      isFocusLine: true,
      text: transModel(context).email,
      control: cubit.emlverifyControl,
      validate: '${transModel(context).verifyEmail}',
      er: 10,
      fr: 10,
      mx: 1,
      isIcon: true,
      prefix: Icons.email,
    );
  }

  Widget divider(context) {
    return Row(
      children: [
        Container(width: 100, height: 1, color: Colors.grey[300]),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            '${transModel(context).haveAccount}',
            style: grey14(),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 3.4,
          height: 1,
          color: Colors.grey[300],
        ),
      ],
    );
  }
}
