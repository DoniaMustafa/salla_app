import 'package:e_commerce/shared/components/constance/constants.dart';
import 'package:e_commerce/shared/components/default_button/material_but_widget.dart';
import 'package:e_commerce/shared/components/default_button/material_button.dart';
import 'package:e_commerce/shared/components/default_navigator/navigat.dart';
import 'package:e_commerce/shared/components/default_text_and_list/text_form.dart';
import 'package:e_commerce/shared/components/generale_components/components.dart';
import 'package:e_commerce/shared/cubit/cubit_app/cubit.dart';
import 'package:e_commerce/shared/cubit/cubit_app/statet.dart';
import 'package:e_commerce/shared/cubit/setting/setting_cubit.dart';
import 'package:e_commerce/shared/cubit/setting/state_cubit.dart';
import 'package:e_commerce/shared/di/dependency_injaction.dart';
import 'package:e_commerce/shared/stayle/stayles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EditOfProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<SettingCubit>()..getProfileInfo(),
      child: BlocConsumer<SettingCubit, SettingState>(
        listener: (context, state) {
          if(state is UpDateSuccessStates){
            showToast(text: 'DONE', tColor: ToastColors.SUCCESS, gravity: ToastGravity.BOTTOM);
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return Directionality(
            textDirection: AppCubit.get(context).textDirection,
            child: Scaffold(
              appBar: AppBar(
                title: Text('${transModel(context).editProfile}',
                    style: Theme.of(context).textTheme.headline6),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  child: Column(
                    // mainAxisSize:MainAxisSize.max ,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if(state is UpDateLoadingStates)
                        LinearProgressIndicator(),
                      SizedBox(height: 30,),
                      Form(
                        key: settingCubit(context).upDate,
                        child: Column(
                          children: [
                            defTextForm(
                                prefix: Icons.person,
                                mx: 1,
                                height: 60,
                                // validate: 'UserName validation',
                                text: '${transModel(context).userProfile}',
                                isIcon: false,
                                control: settingCubit(context).usController,
                                validate: ''),
                            SizedBox(
                              height: 20,
                            ),
                            defTextForm(
                                prefix: Icons.email,
                                mx: 1,
                                height: 60,
                                // validate: 'email validation',
                                text: '${transModel(context).emailProfile}',
                                control: settingCubit(context).emController,
                                validate: ''),
                            SizedBox(
                              height: 20,
                            ),
                            defTextForm(
                              prefix: Icons.phone,
                              height: 60,
                              mx: 1,
                              // validate: 'Phone validation',
                              text: '${transModel(context).phoneProfile}',
                              control: settingCubit(context).phController,
                              validate: '',
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: 100,
                      ),
                      DefaultButton(
                        onPress: () {
                          print('ok');

                          return settingCubit(context).upDateProfile(
                              context:context,
                              name: settingCubit(context).usController.text,
                              email: settingCubit(context).emController.text,
                              phone: settingCubit(context).phController.text);
                        },
                        text: '${transModel(context).update}',
                        height: 40.0,
                        style: white18regular(),
                        width: 150.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
