import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerce/modules/login/login_screen.dart';
import 'package:e_commerce/modules/notify/notify_screen.dart';
import 'package:e_commerce/modules/order/order_screen.dart';
import 'package:e_commerce/modules/settings/setting_item/about_screen.dart';
import 'package:e_commerce/modules/settings/setting_item/contact_screen.dart';
import 'package:e_commerce/modules/settings/setting_item/faqs_screen.dart';
import 'package:e_commerce/modules/settings/setting_item/feedback_screen.dart';
import 'package:e_commerce/modules/settings/setting_item/language_screen.dart';
import 'package:e_commerce/modules/settings/setting_item/screen_account_screen.dart';
import 'package:e_commerce/modules/settings/setting_item/terms_screen.dart';
import 'package:e_commerce/shared/components/constance/constants.dart';
import 'package:e_commerce/shared/components/default_navigator/navigat.dart';
import 'package:e_commerce/shared/components/default_text_and_list/text_form.dart';
import 'package:e_commerce/shared/cubit/cubit_app/cubit.dart';
import 'package:e_commerce/shared/cubit/setting/setting_cubit.dart';
import 'package:e_commerce/shared/cubit/setting/state_cubit.dart';
import 'package:e_commerce/shared/di/dependency_injaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:loading_animations/loading_animations.dart';

class Setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
          textDirection: AppCubit.get(context).textDirection,
          child: Scaffold(
              body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      BlocProvider(
                        create: (context) => di<SettingCubit>(),
                        child: BlocConsumer<SettingCubit, SettingState>(
                          listener: (context, state) {},
                          builder: (context, state) {
                            return RefreshIndicator(
                                onRefresh: () =>
                                    appCubit(context).loadProfile(),
                                child: Conditional.single(
                                    context: context,
                                    conditionBuilder: (context) =>
                                        appCubit(context).userProfile != null,
                                    fallbackBuilder: (context) => Container(
                                          child: LoadingBouncingLine.square(
                                            backgroundColor: Colors.indigo,
                                          ),
                                        ),
                                    widgetBuilder: (context) => Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                  appCubit(context)
                                                      .userProfile!
                                                      .data!
                                                      .image!),
                                              radius: 30,
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Container(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  AutoSizeText(
                                                    appCubit(context)
                                                        .userProfile!
                                                        .data!
                                                        .name!,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText2,
                                                    maxFontSize: 15,
                                                  ),
                                                  AutoSizeText(
                                                    appCubit(context)
                                                        .userProfile!
                                                        .data!
                                                        .email!,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText2,
                                                    maxFontSize: 15,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        )));
                          },
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: () =>
                            navigaTo(context: context, widget: Account()),
                        child: rowTxIn(
                          context: context,
                          text: transModel(context).editProfile!,
                          icon: Icons.arrow_forward_ios,
                          onPress: () =>
                              navigaTo(context: context, widget: Account()),
                        ),
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      GestureDetector(
                        onTap: () =>
                            navigaTo(context: context, widget: Contacts()),
                        child: rowTxIn(
                            context: context,
                            text: transModel(context).contacts!,
                            icon: Icons.arrow_forward_ios,
                            onPress: () =>
                                navigaTo(context: context, widget: Contacts())),
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      GestureDetector(
                          onTap: () => navigaTo(
                              context: context, widget: NotificationScreen()),
                          child: rowTxIn(
                              context: context,
                              text: transModel(context).notify1!,
                              icon: Icons.arrow_forward_ios,
                              onPress: () => navigaTo(
                                  context: context,
                                  widget: NotificationScreen()))),
                      Divider(
                        thickness: 1,
                      ),
                      GestureDetector(
                          onTap: () =>
                              navigaTo(context: context, widget: OrderScreen()),
                          child: rowTxIn(
                              context: context,
                              text: '${transModel(context).order1}',
                              icon: Icons.arrow_forward_ios,
                              onPress: () => navigaTo(
                                  context: context, widget: OrderScreen()))),
                      Divider(
                        thickness: 1,
                      ),
                      rowTxIn(
                        context: context,
                        text: '${transModel(context).darkMode}',
                        isIcon: false,
                        widget: CupertinoSwitch(
                          value: isDark,
                          onChanged: (value) {
                            print('isDark this:  $value');
                            print('isDark this:  $isDark dd');

                            return appCubit(context).changeAppTheme();
                          },
                        ),
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      GestureDetector(
                          onTap: () =>
                              navigaTo(context: context, widget: Language()),
                          child: rowTxIn(
                              context: context,
                              text: transModel(context).lan!,
                              icon: Icons.arrow_forward_ios,
                              onPress: () => navigaTo(
                                  context: context, widget: Language()))),
                      Divider(
                        thickness: 1,
                      ),
                      GestureDetector(
                          onTap: () =>
                              navigaTo(context: context, widget: About()),
                          child: rowTxIn(
                              context: context,
                              text: transModel(context).about!,
                              icon: Icons.arrow_forward_ios,
                              onPress: () =>
                                  navigaTo(context: context, widget: About()))),
                      Divider(
                        thickness: 1,
                      ),
                      GestureDetector(
                        onTap: () => navigaTo(context: context, widget: FAQs()),
                        child: rowTxIn(
                          context: context,
                          text: transModel(context).faq!,
                          icon: Icons.arrow_forward_ios,
                          onPress: () =>
                              navigaTo(context: context, widget: FAQs()),
                        ),
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      GestureDetector(
                        onTap: () =>
                            navigaTo(context: context, widget: Terms()),
                        child: rowTxIn(
                            context: context,
                            text: transModel(context).condition!,
                            icon: Icons.arrow_forward_ios,
                            onPress: () =>
                                navigaTo(context: context, widget: Terms())),
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      GestureDetector(
                        onTap: () => navigaTo(
                            context: context, widget: FeedbackOrProblem()),
                        child: rowTxIn(
                            context: context,
                            text: transModel(context).feedback!,
                            icon: Icons.arrow_forward_ios,
                            onPress: () => navigaTo(
                                context: context, widget: FeedbackOrProblem())),
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      BlocProvider(
                        create: (context) => di<SettingCubit>(),
                        child: BlocConsumer<SettingCubit, SettingState>(
                          listener: (context, state) {
                            if (state is LogOutSuccessStates) {
                              clearToken();
                              navigateAndFinish(
                                  context: context, widget: Login());
                            }
                            // if(state is  LogOutLoadingStates)
                            //   CircularProgressIndicator();
                          },
                          builder: (context, state) {
                            return GestureDetector(
                                onTap: () {
                                  clearToken();
                                  settingCubit(context).logOut(context);
                                },
                                child: rowTxIn(
                                    context: context,
                                    text: transModel(context).signOut!,
                                    icon: Icons.logout,
                                    onPress: () {
                                      clearToken();
                                      settingCubit(context).logOut(context);
                                    }));
                          },
                        ),
                      ),
                      // Divider(
                      //   thickness: 1,
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ))),
    );
  }
}
