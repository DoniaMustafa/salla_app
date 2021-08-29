import 'package:e_commerce/layout/home_layout.dart';
import 'package:e_commerce/modules/login/forget_pass.dart';
import 'package:e_commerce/modules/register/register_screen.dart';
import 'package:e_commerce/shared/components/constance/constants.dart';
import 'package:e_commerce/shared/components/default_button/material_but_widget.dart';
import 'package:e_commerce/shared/components/default_navigator/navigat.dart';
import 'package:e_commerce/shared/components/default_text_and_list/text_form.dart';
import 'package:e_commerce/shared/components/generale_components/components.dart';
import 'package:e_commerce/shared/cubit/cubit_app/cubit.dart';
import 'package:e_commerce/shared/cubit/cubit_logAndReg/cubit_log_and_reg.dart';
import 'package:e_commerce/shared/cubit/cubit_logAndReg/state_log_and_reg.dart';
import 'package:e_commerce/shared/di/dependency_injaction.dart';
import 'package:e_commerce/shared/stayle/stayles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: appCubit(context).textDirection,
      child: Scaffold(

          body: BlocProvider(
        create: (BuildContext context) => di<LoginCubit>(),
        child: BlocConsumer<LoginCubit, LoginState>(listener: (context, state) {
          if (state is LoginSuccessState) {
            AppCubit.get(context).onClickCurrentIndex(0);
            navigateAndFinish(context: context, widget: Layout());
          }
        }, builder: (context, state) {
          var cubit = LoginCubit.get(context);

          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    padding: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/GUI/logo.jpg'),
                            fit: BoxFit.fill)),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,

                      children: [
                        textForm(context),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: ()=> navigaTo(context: context, widget: ForgetPass()),
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: Text(
                              '${transModel(context).forgotPassword}',
                              style: indigo14regular()
                                  .copyWith(decoration: TextDecoration.underline),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          width: 200,
                          height: 50,
                          child: DefaultButton(
                            text: transModel(context).login!,
                            style: white20bold(),
                            width: 200,
                            height: 50,
                            onPress: () {

                              if (LoginCubit.get(context)
                                  .formKay
                                  .currentState!
                                  .validate()) {
                                print('ok');
                                return cubit.signIn(
                                    email: cubit.emlControl.text,
                                    pass: cubit.pasControl.text,
                                    context: context);
                              }
                            },
                          ),
                        ),

                        SizedBox(
                          height: 35,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Text('${transModel(context).haveAccount}'),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            GestureDetector(
                              onTap: () => navigaTo(
                                  context: context, widget: Register()),
                              child: Container(
                                child: Text(
                                  '${transModel(context).signUp}',
                                  style: indigo16bold(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
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
    return Form(
      key: LoginCubit.get(context).formKay,
      child: Column(
        children: [
          defTextForm(
            widthCon: 0.0,
          heightCon: 0.0,
            width: double.infinity,
            isEnableLine: true,
            isFocusLine: true,
            text: transModel(context).email,
            control: cubit.emlControl,
            validate: transModel(context).validationEmail!,
            er: 10,
            fr: 10,
            mx: 1,

            isIcon: true,
            prefix: Icons.email,
          ),
          SizedBox(
            height: 20.0,
          ),
          defTextForm(
            isContainer:  true,
            width: double.infinity,
              isEnableLine: true,
              isFocusLine: true,
              height: 70.0,
              text: transModel(context).password,
              control: cubit.pasControl,
              hint: transModel(context).enterPass,
              validate: transModel(context).validationPass!,
              er: 10,
              fr: 10,
              mx: 1,
              suffixSize: 20,
              isIcon: true,
              prefix: Icons.lock,
              isPass: cubit.isPass,
              suffix: cubit.isPass ? Icons.visibility_off : Icons.visibility,
              onPress: () => cubit.showPass())
        ],
      ),
    );
  }

  Widget divider(context) {
    return Row(
      children: [
        Container(width: 100, height: 1, color : Colors.grey[300]),
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

  Widget signUp(
    context,
  ) {
    return DefaultButton(
        height: 40,
        text: transModel(context).signUp!,
        onPress: () => navigaTo(context: context, widget: Register()),
        style: black20regular(), );
  }

  Widget sign({required Function  onPress,required String text ,required context,icon,color}) {

    return GestureDetector(
      onTap:( ){return onPress();},
      child: Container(
        alignment: Alignment.center,
        width: 350,
        // height: 50,

        child: Row(
          mainAxisAlignment:MainAxisAlignment.center ,
          children: [
            Icon(icon,
            color: color,),
            SizedBox(width: 10,),
            Text(text,
            style: Theme.of(context).textTheme.bodyText2,),
          ],
        ),

      ),
    );

}}
