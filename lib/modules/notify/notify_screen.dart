import 'package:e_commerce/shared/components/constance/constants.dart';
import 'package:e_commerce/shared/cubit/cubit_app/cubit.dart';
import 'package:e_commerce/shared/cubit/cubit_app/statet.dart';
import 'package:e_commerce/shared/di/dependency_injaction.dart';
import 'package:e_commerce/shared/stayle/stayles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:loading_animations/loading_animations.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<AppCubit>()..getNotify(),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          // NotifyModel cubit =appCubit(context).notify!;

          return Directionality(
            textDirection: AppCubit.get(context).textDirection,
            child: Scaffold(
              appBar: AppBar(
                title: Text(
                    // '${transModel(context).notify!}'
                    appLangDirection == 'ar' ? 'الاشعارات' : 'Notification',
                    style: Theme.of(context).textTheme.headline6),
              ),
              body: SafeArea(
                  child: Conditional.single(
                      context: context,
                      conditionBuilder: (context) =>
                          AppCubit.get(context).notify != null,
                      widgetBuilder: (context) => Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 30, horizontal: 10),
                            child: Expanded(
                              child: ListView.separated(
                                itemCount: appCubit(context)
                                    .notify!
                                    .data!
                                    .data!
                                    .length,
                                itemBuilder: (context, i) {
                                  return ListTile(
                                    title: Text(
                                      appCubit(context)
                                          .notify!
                                          .data!
                                          .data![i]
                                          .title,
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                    subtitle: Text(
                                        appCubit(context)
                                            .notify!
                                            .data!
                                            .data![i]
                                            .message,
                                        style: white16regular(),
                                        maxLines: 2,
                                        overflow: TextOverflow.fade),
                                  );
                                },
                                separatorBuilder: (context, i) => Divider(
                                  endIndent: 15,
                                  indent: 15,
                                  thickness: 2,
                                ),
                              ),
                            ),
                          ),
                      fallbackBuilder: (context) => Container(
                            alignment: Alignment.center,
                            child: LoadingBouncingLine.square(
                              backgroundColor: Colors.indigo,
                            ),
                          ))),
            ),
          );
        },
      ),
    );
  }
}
