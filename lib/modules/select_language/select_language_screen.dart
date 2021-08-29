import 'package:e_commerce/modules/on_boarder/on_boarder_screen.dart';
import 'package:e_commerce/shared/components/constance/constants.dart';
import 'package:e_commerce/shared/components/default_navigator/navigat.dart';
import 'package:e_commerce/shared/components/generale_components/components.dart';
import 'package:e_commerce/shared/cubit/cubit_app/cubit.dart';
import 'package:e_commerce/shared/cubit/cubit_app/statet.dart';
import 'package:e_commerce/shared/stayle/default_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SelectLanguage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          MediaQuery(
                            data: MediaQueryData(
                              textScaleFactor: 1.0
                            ),
                            child: Text(
                              '${transModel(context).selectEn}',
                              style: Theme.of(context).textTheme.headline5,
                              // style: white20(),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            '${transModel(context).selectAr}',
                            // translateModel. ,
                            style: Theme.of(context).textTheme.headline5,

                            textDirection: AppCubit.get(context).textDirection,
                            textAlign: TextAlign.right,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Expanded(
                      child: ListView.separated(

                          physics: BouncingScrollPhysics(),
                          itemCount: listLang.length,
                          separatorBuilder: (context, index) => Divider(
                            thickness: 2,
                          ),
                          itemBuilder: (context, index) => Padding(
                            padding:  EdgeInsets.all(10.0),
                            child: languageItem(
                                model: listLang[index],
                                index: index,
                                context: context),
                          )),
                    ),

                    Spacer(
                      flex: 1,
                    ),

                    MaterialButton(
                      child: Text('Done',style: Theme.of(context).textTheme.subtitle1,),
                        color: indigo(),
                        onPressed: (){
                      print('onhoui');

                      int selectedLanguage =
                          appCubit(context).selectLanguageIndex!;
                      if (selectedLanguage == null) {
                        showToast(
                          gravity: ToastGravity.CENTER,
                            text: 'please enter your Language',
                            tColor: ToastColors.WARNING);
                      } else {
                        var model = listLang[selectedLanguage];
                        print(model.code);

                        setLangDirToShard(model.code!).then((value) {
                          getTranslationFile(model.code!)
                              .then((value) {
                            AppCubit.get(context).setLanguage(
                                translateFileJson: value,
                                code: model.code);
                          })
                              .catchError((error) {})
                              .then((value) {
                            navigateAndFinish(
                                context: context, widget: Boarder());
                          })
                              .catchError((error) {});
                        }).catchError((error) {});
                      }
                    })
                  ],
                ),
              ),
            ),
          );
        });
  }
}

