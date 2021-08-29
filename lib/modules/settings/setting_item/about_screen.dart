import 'package:e_commerce/model/setting_model.dart';
import 'package:e_commerce/shared/components/constance/constants.dart';
import 'package:e_commerce/shared/cubit/cubit_app/cubit.dart';
import 'package:e_commerce/shared/cubit/setting/setting_cubit.dart';
import 'package:e_commerce/shared/cubit/setting/state_cubit.dart';
import 'package:e_commerce/shared/di/dependency_injaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:loading_animations/loading_animations.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: AppCubit.get(context).textDirection,
      child: Scaffold(
        body: BlocProvider(
          create: (context) => di<SettingCubit>()..getSettings(),
          child: BlocConsumer<SettingCubit, SettingState>(
            listener: (context, state) {},
            builder: (context, state) {
              // SettingsModel setting = settingCubit(context).setting!;
              return Directionality(
                textDirection: appCubit(context).textDirection,
                child: Scaffold(
                  appBar: AppBar(
                    title: Text(
                      '${transModel(context).about2}',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  body: Conditional.single(
                      context: context,
                      conditionBuilder: (context) =>
                          settingCubit(context).setting != null,
                      fallbackBuilder: (context) => Container(
                            alignment: Alignment.center,
                            child: LoadingBouncingLine.square(
                              backgroundColor: Colors.indigo,
                            ),
                          ),
                      widgetBuilder: (context) => Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Text(
                                settingCubit(context).setting!.data!.about!,
                                textDirection:
                                    appCubit(context).textDirection,
                                style: Theme.of(context).textTheme.bodyText2),
                          )),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
