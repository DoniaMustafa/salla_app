import 'package:e_commerce/shared/components/constance/constants.dart';
import 'package:e_commerce/shared/components/default_button/circal_but_widget.dart';
import 'package:e_commerce/shared/components/default_text_and_list/text_form.dart';
import 'package:e_commerce/shared/components/generale_components/components.dart';

import 'package:e_commerce/shared/cubit/setting/setting_cubit.dart';
import 'package:e_commerce/shared/cubit/setting/state_cubit.dart';
import 'package:e_commerce/shared/di/dependency_injaction.dart';
import 'package:e_commerce/shared/stayle/stayles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FeedbackOrProblem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<SettingCubit>()..getContact(),
      child: BlocConsumer<SettingCubit, SettingState>(
        listener: (context, state) {
          if(state is ComplaintsSuccessState)
            showToast(text: '${transModel(context).feedProcess}', tColor: ToastColors.SUCCESS, gravity: ToastGravity.CENTER);
        },
        builder: (context, state) {
          return Directionality(
            textDirection: appCubit(context).textDirection,
            child: Scaffold(
              appBar: AppBar(
                title: Text(transModel(context).feedback!,style: Theme.of(context).textTheme.headline6),
              ),
              body: SingleChildScrollView(
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Form(
                          key: settingCubit(context).feedbackKay,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              defTextForm(
                                mx: 1,
                                height: 60,
                                isIcon: true,

                                prefix: Icons.person,
                                text: '${transModel(context).feedName}',
                                control: settingCubit(context).conName, validate: '',
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              defTextForm(
                                mx: 1,
                                height: 60,
                                isIcon: true,
                                prefix: Icons.email,
                                text: '${transModel(context).feedEmail}',
                                control: settingCubit(context).conEmail, validate: '',
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              defTextForm(
                                mx: 1,
                                height: 60,
                                isIcon: true,
                                prefix: Icons.phone,
                                text: '${transModel(context).feedPhone}',
                                control: settingCubit(context).conPhone, validate: '',
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              defTextForm(
                                // alignment: appLangDirection =="en"?Alignment.topLeft: Alignment.topRight,
                                height: 150,
                                isIcon: true,
                                prefix: Icons.feedback,
                                text: '${transModel(context).feedback1}',
                                control:
                                    settingCubit(context).complaintController,
                                mx: 15, validate: '',
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        DefaultCircleButton(
                            text: 'submit',
                            hs: 50,
                            r: 10.0,
                            style: black20bold(),
                            color: Colors.indigo,
                            fun: () {
                              if (settingCubit(context)
                                  .feedbackKay
                                  .currentState!
                                  .validate()) {
                                settingCubit(context).setComplaints(
                                  name: settingCubit(context).conName.text,
                                  email: settingCubit(context).conEmail.text,
                                  phone: settingCubit(context).conPhone.text,
                                  message: settingCubit(context)
                                      .complaintController
                                      .text,
                                );
                              }
                            }, ),
                      ],
                    )),
              ),
            ),
          );
        },
      ),
    );
  }
}
