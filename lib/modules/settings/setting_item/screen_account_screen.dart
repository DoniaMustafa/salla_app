import 'package:e_commerce/modules/settings/account/change_password_screen.dart';
import 'package:e_commerce/modules/settings/account/edit_screen.dart';
import 'package:e_commerce/shared/components/constance/constants.dart';
import 'package:e_commerce/shared/components/default_navigator/navigat.dart';
import 'package:e_commerce/shared/cubit/cubit_app/cubit.dart';
import 'package:e_commerce/shared/cubit/cubit_app/statet.dart';
import 'package:e_commerce/shared/stayle/default_color.dart';
import 'package:e_commerce/shared/stayle/stayles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:loading_animations/loading_animations.dart';

class Account extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Directionality(
            textDirection: AppCubit.get(context).textDirection,
            child: Scaffold(
                appBar: AppBar(
                  title: Text(
                      '${transModel(context).personInfo}',
        style: Theme.of(context).textTheme.headline6
                  ),
                ),
                body: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Container(
                        // height: 300,
                        child: Card(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 20),
                            child:Conditional.single(
                              context: context,
                              conditionBuilder: (context) =>
                              appCubit(context).userProfile !=null ,
                              fallbackBuilder: (context) => Container(
                                child: LoadingBouncingLine.square(
                                  backgroundColor: Colors.indigo,
                                ),
                              ),
                              widgetBuilder: (context) => Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Spacer(
                                        flex: 1,
                                      ),
                                      GestureDetector(
                                          onTap: () => navigaTo(
                                              context: context,
                                              widget: EditOfProfile()),
                                          child: Text(
                                            '${transModel(context).editProfile2}',
                                            style: black14regular()
                                                .copyWith(color: Colors.blue),
                                          ))
                                    ],
                                  ),
                                  MyInfo(
                                      title: '${transModel(context).userProfile}',
                                      context: context,
                                      icon: Icons.person,
                                      name: appCubit(context)
                                          .userProfile!
                                          .data!
                                          .name!),

                                  MyInfo(
                                      title: '${transModel(context).emailProfile}',
                                      context: context,
                                      icon: Icons.email,
                                      name: appCubit(context)
                                          .userProfile!
                                          .data!
                                          .email!),

                                  MyInfo(
                                      title: '${transModel(context).phoneProfile}',
                                      context: context,
                                      icon: Icons.phone,
                                      name: appCubit(context)
                                          .userProfile!
                                          .data!
                                          .phone!),

                                ],
                              )
                              ),
                            ),
                          ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        color: Colors.white,
                          alignment: Alignment.center,
                          width: double.infinity,
                          child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 20),
                              child: GestureDetector(
                                onTap:()=>navigaTo(context: context, widget: ChangePass()),
                                child: Text(transModel(context).changePassword!,
                                style: indigo20regular(),),
                              )))
                    ],
                  ),

                )));
      },
    );
  }

  Widget MyInfo(
          {required BuildContext context,required String title,required String name,required IconData icon}) =>
      ListTile(
        title: Text(title, style: grey16()),
        subtitle: Text(name, style: indigo16regular()),
        leading: Icon(
          icon,
          color: indigo(),
        ),
      );
}

// Padding(
// padding: EdgeInsets.all(20),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.stretch,
// mainAxisAlignment: MainAxisAlignment.start,
// children: [
// Container(
// height: 300,
// child: Card(
// child: Padding(
// padding: EdgeInsets.symmetric(
// horizontal: 15, vertical: 20),
// child: ConditionalBuilder(
// condition: state is SettingSuccessState &&
// appCubit(context).userProfile != null,
// builder: (context) => Column(
// crossAxisAlignment:
// CrossAxisAlignment.stretch,
// children: [
// Text(
// '${transModel(context).personInfo}',
// style: black20regular()
//     .copyWith(color: Colors.black),
// ),
// SizedBox(
// height: 10,
// ),
// Text(
// '${transModel(context).userProfile} : ${appCubit(context).userProfile.data.name} ',
// style: black18regular(),
// ),
// SizedBox(
// height: 10,
// ),
// Text(
// '${transModel(context).emailProfile} : ${appCubit(context).userProfile.data.email}',
// style: black18regular(),
// ),
// SizedBox(
// height: 10,
// ),
// Text(
// '${transModel(context).phoneProfile} : ${appCubit(context).userProfile.data.phone}',
// style: black18regular(),
// ),
// SizedBox(
// height: 20,
// ),
// GestureDetector(
// onTap: () => navigaTo(
// context: context,
// widget: EditOfProfile()),
// child: defButton(
// txt:
// '${transModel(context).editProfile2}',
// r: 0.0,
// style: black22bold(),
// ),
// )
// ],
// ),
// fallback: (context) => Center(),
// ),
// ),
// ),
// ),
// SizedBox(
// height: 10,
// ),
// SizedBox(
// height: 20,
// ),
// defaultCircleButton(
// text: '${transModel(context).changePassword}',
// r: 0.0,
// style: white20bold(),
// fun: () =>
// navigaTo(context: context, widget: ChangePass()),
// )
// ],
// ))
