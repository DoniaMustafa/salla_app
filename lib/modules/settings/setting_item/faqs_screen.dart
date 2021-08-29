import 'package:e_commerce/model/setting_model.dart';
import 'package:e_commerce/shared/components/constance/constants.dart';
import 'package:e_commerce/shared/cubit/cubit_app/cubit.dart';
import 'package:e_commerce/shared/cubit/setting/setting_cubit.dart';
import 'package:e_commerce/shared/cubit/setting/state_cubit.dart';
import 'package:e_commerce/shared/di/dependency_injaction.dart';
import 'package:e_commerce/shared/stayle/stayles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:loading_animations/loading_animations.dart';

class FAQs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => di<SettingCubit>()..getFAQ(),
        child: BlocConsumer<SettingCubit, SettingState>(
          listener: (context, state) {},
          builder: (context, state) {
            // FaqModel faq = settingCubit(context).faqModel!;
            return Directionality(
                textDirection: AppCubit.get(context).textDirection,
              child: Scaffold(
                appBar: AppBar(
                  title:  Text('${transModel(context).faq}',
                      style: Theme.of(context).textTheme.headline6),
                ),
                body:Conditional.single(
              context: context,
              conditionBuilder: (context) =>
              settingCubit(context).faqModel !=null ,
              fallbackBuilder: (context) => Container(
                alignment: Alignment.center,
              child: LoadingBouncingLine.square(
              backgroundColor: Colors.indigo,
              ),
              ),
              widgetBuilder: (context) =>Padding(
                    padding: EdgeInsets.symmetric(vertical: 30,horizontal: 10),
                    child: Expanded(
                      child: ListView.separated(
                        itemCount: settingCubit(context).faqModel!.data!.data!.length,
                        itemBuilder: (context,i){
                         return ExpansionTile(

                            title:Text(settingCubit(context).faqModel!.data!.data![i].question!,style: Theme.of(context).textTheme.bodyText1) ,
                          children:[
                            Text(settingCubit(context).faqModel!.data!.data![i].answer!,
                                style: Theme.of(context).textTheme.bodyText2)
                          ]
                          );
                        },
                        separatorBuilder:(context,i)=>Divider(
                          endIndent: 15,
                          indent: 15,
                          thickness: 2,
                        ) ,
                      ),
                    ),
                  )

                  ),
                ),

            );
          },
        ),
      ),
    );
  }
}