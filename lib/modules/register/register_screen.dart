import 'package:e_commerce/shared/components/constance/constants.dart';
import 'package:e_commerce/shared/components/default_button/material_but_widget.dart';
import 'package:e_commerce/shared/components/default_text_and_list/text_form.dart';
import 'package:e_commerce/shared/components/generale_components/components.dart';
import 'package:e_commerce/shared/cubit/cubit_app/cubit.dart';
import 'package:e_commerce/shared/cubit/cubit_logAndReg/cubit_log_and_reg.dart';
import 'package:e_commerce/shared/cubit/cubit_logAndReg/state_log_and_reg.dart';
import 'package:e_commerce/shared/di/dependency_injaction.dart';
import 'package:e_commerce/shared/stayle/stayles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<LoginCubit>(),
      child: BlocConsumer<LoginCubit, LoginState>(builder: (context, state) {
        var cubit = LoginCubit.get(context);
        return Directionality(
          textDirection: appCubit(context).textDirection,
          child: Scaffold(
            appBar: AppBar(
              title: Text(transModel(context).register!,
                  style: Theme.of(context).textTheme.headline6),
            ),
            body: Container(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Padding(
                      //   padding: EdgeInsets.symmetric(vertical: 20),
                      //   child: Text(
                      //    '${ transModel(context).register}',
                      //     style: indigo20regular(),
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      Form(
                        key: cubit.formKay2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            defTextForm(
                              isEnableLine: true,
                                isFocusLine:true ,
                                height: 50,
                                mx: 1,
                                type: TextInputType.name,
                                text: transModel(context).userName,
                                control: cubit.usControl,
                                hint: transModel(context).enterName,
                                validate: transModel(context).validationName!,
                                er: 20,
                                fr: 20,
                                isIcon: true,
                                prefix: Icons.person,
                                isPass: false),
                            SizedBox(
                              height: 30,
                            ),
                            defTextForm(
                              isEnableLine: true,
                              isFocusLine:true ,
                              height: 50,
                              mx: 1,
                              type: TextInputType.emailAddress,
                              text: transModel(context).email,
                              control: cubit.em2lControl,
                              hint: transModel(context).enterEmail,
                              validate: transModel(context).validationEmail!,
                              er: 20,
                              fr: 20,
                              isIcon: true,
                              prefix: Icons.email,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            defTextForm(
                              isEnableLine: true,
                              isFocusLine:true ,
                              height: 50,
                              mx: 1,
                              type: TextInputType.phone,
                              text: transModel(context).phone,
                              control: cubit.phoControl,
                              hint: transModel(context).enterPhone,
                              validate: transModel(context).validationPhone!,
                              er: 20,
                              fr: 20,
                              isIcon: true,
                              prefix: Icons.phone,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            defTextForm(
                                isEnableLine: true,
                                isFocusLine:true ,
                                height: 50,
                                mx: 1,
                                type: TextInputType.visiblePassword,
                                text: transModel(context).password,
                                control: cubit.passControl,
                                hint: transModel(context).enterPass,
                                validate: transModel(context).validationPass!,
                                er: 20,
                                fr: 20,
                                isIcon: true,
                                suffixSize: 20,
                                prefix: Icons.lock,
                                isPass: cubit.isPass,
                                suffix: cubit.isPass
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                onPress: () => cubit.showPass()),
                            SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      ),
                      // SizedBox(
                      //   height: 50,
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   children: [
                      //     CircleAvatar(
                      //       radius: 35,
                      //       backgroundImage: NetworkImage(
                      //           'https://cdn4.iconfinder.com/data/icons/small-n-flat/24/user-alt-512.png'),
                      //       backgroundColor: Colors.grey[200],
                      //     ),
                      //     Spacer(
                      //       flex: 1,
                      //     ),
                      //     DefaultButton(
                      //       height: 40,
                      //       width: 150,
                      //       text: transModel(context).choseImage,
                      //       onPress: () => _showDialog(context),
                      //       style:  white18regular(),
                      //     ),
                      //   ],
                      // ),
                      SizedBox(
                        height: 100,
                      ),
                      DefaultButton(
                          height: 50,
                          width: 200,
                          text: transModel(context).save!,
                          onPress: () {
                            print('gggggggggg');
                            if (cubit.formKay2.currentState!.validate()) {
                              cubit.register(
                                name: cubit.usControl.text,
                                email: cubit.em2lControl.text,
                                password: cubit.passControl.text,
                                phone: cubit.phoControl.text,
                              );

                              print('ok');
                            }
                          },
                          style: white18regular()),
                    ],
                  ),
                ),
              ),
            ),
          ),

        );
      }, listener: (context, state) {
        if (state is RegisterSuccessState) {
          return Navigator.pop(context);
        }
        if (state is RegisterErrorState) {
          showToast(text: state.error, tColor: ToastColors.ERROR, gravity: ToastGravity.BOTTOM);
        }
      }),
    );
  }

}
