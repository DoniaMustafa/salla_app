import 'package:e_commerce/model/setting_model.dart';
import 'package:e_commerce/shared/components/constance/constants.dart';
import 'package:e_commerce/shared/cubit/cubit_app/cubit.dart';
import 'package:e_commerce/shared/cubit/cubit_app/statet.dart';
import 'package:e_commerce/shared/cubit/setting/setting_cubit.dart';
import 'package:e_commerce/shared/cubit/setting/state_cubit.dart';
import 'package:e_commerce/shared/di/dependency_injaction.dart';
import 'package:e_commerce/shared/stayle/default_color.dart';
import 'package:e_commerce/shared/stayle/stayles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:url_launcher/url_launcher.dart';

class Contacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<SettingCubit>()..getContact(),
      child: BlocConsumer<SettingCubit, SettingState>(
        listener: (context, state) {},
        builder: (context, state) {
          // ContactsModel contact = settingCubit(context).contacts!;
          return Directionality(
            textDirection: AppCubit.get(context).textDirection,
            child: Scaffold(
              appBar: AppBar(
                title: Text('${transModel(context).contacts}',
                    style: Theme.of(context).textTheme.headline6),
              ),
              body: Conditional.single(
                  context: context,
                  conditionBuilder: (context) =>
                      settingCubit(context).contacts != null,
                  fallbackBuilder: (context) => Container(
                        alignment: Alignment.center,
                        child: LoadingBouncingLine.square(
                          backgroundColor: Colors.indigo,
                        ),
                      ),
                  widgetBuilder: (context) => Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Text('${transModel(context).contacts2}',
                          // style: black22Bold(),),
                          SizedBox(height: 30),
                          Expanded(
                            child: ListView.separated(
                              itemCount: settingCubit(context)
                                  .contacts!
                                  .data!
                                  .data!
                                  .length,
                              itemBuilder: (context, i) => ListTile(
                                title: Text(
                                  '${settingCubit(context).contacts!.data!.data![i].value}',
                                  style:isDark?white18regular():indigo18regular(),
                                ),
                                leading: Container(
                                  width: 50,
                                  height: 50,
                                  child: Image.network(
                                    settingCubit(context)
                                        .contacts!
                                        .data!
                                        .data![i]
                                        .image!,
                                    color: indigo(),

                                  ),
                                ),
                              ),
                              separatorBuilder: (context, i) => Divider(
                                thickness: 2,
                                indent: 15,
                                endIndent: 15,
                              ),
                            ),
                          ),
                        ],
                      ))),
            ),
          );
        },
      ),
    );
  }
}
