import 'package:e_commerce/modules/settings/setting_item/screen_account_screen.dart';
import 'package:e_commerce/shared/components/constance/constants.dart';
import 'package:e_commerce/shared/components/default_button/circal_but_widget.dart';
import 'package:e_commerce/shared/components/default_navigator/navigat.dart';
import 'package:e_commerce/shared/components/default_text_and_list/text_form.dart';
import 'package:e_commerce/shared/components/generale_components/components.dart';
import 'package:e_commerce/shared/cubit/cubit_app/cubit.dart';
import 'package:e_commerce/shared/cubit/setting/setting_cubit.dart';
import 'package:e_commerce/shared/cubit/setting/state_cubit.dart';
import 'package:e_commerce/shared/di/dependency_injaction.dart';
import 'package:e_commerce/shared/stayle/stayles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ChangePass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: AppCubit.get(context).textDirection,
      child: BlocProvider(
        create: (context) => di<SettingCubit>(),
        child: BlocConsumer<SettingCubit, SettingState>(
          listener: (context, state) {
            if(state is ChangePasswordErrorState){
               showToast(text: settingCubit(context).passError, tColor: ToastColors.ERROR, gravity:ToastGravity.CENTER);
            }
            if(state is ChangePasswordSuccessState){
               showToast(text:'${settingCubit(context).passError}', tColor: ToastColors.SUCCESS, gravity:ToastGravity.CENTER);
            }
          },
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                title: Text('${transModel(context).changePassword}',
                    style: Theme.of(context).textTheme.headline6),
              ),
              body: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if(state is ChangePasswordLoadingState)
                      LinearProgressIndicator(),
                    SizedBox(height: 20,),
                    Form(
                      key: settingCubit(context).changePass,
                      child: Column(
                        children: [
                          defTextForm(
                              height: 60,
                              mx: 1,
                              validate: '${transModel(context).enterCurrentPass}',
                              text: '${transModel(context).currentPass}',
                              control:
                                  settingCubit(context).currentPassController),
                          SizedBox(
                            height: 20,
                          ),
                          defTextForm(
                              height: 60,
                              mx: 1,
                              validate: '${transModel(context).enterNewPass}',
                              text: '${transModel(context).newPass}',
                              control: settingCubit(context).newPassController),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DefaultCircleButton(
                          fun: () {
                            if (settingCubit(context)
                                .changePass
                                .currentState!
                                .validate()) {
                              return settingCubit(context).changePassword(
                                  currentP: settingCubit(context)
                                      .currentPassController
                                      .text,
                                  newP: settingCubit(context)
                                      .newPassController
                                      .text);
                            }
                            print('ok');
                          },
                          text: '${transModel(context).save}',
                          hs: 50,
                          color: Colors.indigo,
                          style: black20regular(),
                          ws: 150,
                          r: 20,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        DefaultCircleButton(
                          fun: () => showMyDialog(
                              text: '${transModel(context).cancelDialogTitle}',
                              cont: '${transModel(context).contentDialog}',
                              context: context,
                              but1: '${transModel(context).but1dialog}',
                              but2: '${transModel(context).but2dialog}',
                              onTap:()=>navigaTo(context: context, widget:Account() )
                          ),
                          text: '${transModel(context).cancelPass}',
                          hs: 50,
                          color: Colors.indigo,
                          style: black20regular(),
                          ws: 150.0,
                          r: 20,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
