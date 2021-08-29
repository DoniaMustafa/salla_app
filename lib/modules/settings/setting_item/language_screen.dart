import 'package:e_commerce/layout/home_layout.dart';
import 'package:e_commerce/shared/components/constance/constants.dart';
import 'package:e_commerce/shared/components/default_button/circal_but_widget.dart';
import 'package:e_commerce/shared/components/default_navigator/navigat.dart';
import 'package:e_commerce/shared/components/generale_components/components.dart';
import 'package:e_commerce/shared/cubit/cubit_app/cubit.dart';
import 'package:e_commerce/shared/cubit/cubit_app/statet.dart';
import 'package:e_commerce/shared/stayle/stayles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Language extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: AppCubit.get(context).textDirection,
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment:MainAxisAlignment.center ,
            children: [
              Container(
                width: double.infinity,
                height: 100,
                child: Text(
                  '${transModel(context).changLan}',
                  style: Theme.of(context).textTheme.headline6,
                  textAlign: TextAlign.center,
                ),
              ),
              BlocConsumer<AppCubit, AppState>(
                  listener: (context, state) {
                    if(state is AppLoadLocalState){
                      AppCubit.get(context)
                          .onClickCurrentIndex(3);
                      navigaTo(context: context, widget: Layout());
                    }
                  },
                  builder: (context, state) => Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                            Flexible(
                              child: ListView.separated(
                                shrinkWrap: true,
                                itemCount: listLang.length,
                                separatorBuilder: (context, index) => Divider(
                                  thickness: 2,
                                  endIndent: 15,
                                  indent: 15,
                                ),
                                itemBuilder: (context, index) => Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: languageItem(
                                      model: listLang[index],
                                      index: index,
                                      context: context),
                                ),
                              ),
                            ),
                            Spacer(
                              flex: 1,
                            ),
                            Container(
                              child: DefaultCircleButton(
                                  fun: () {


                                    int selectedLanguage =
                                        AppCubit.get(context).selectLanguageIndex!;
                                    print(selectedLanguage);
                                    print('selectedLanguage');

                                    if (appCubit(context).selectLanguageIndex == null) {
                                     return showToast(gravity: ToastGravity.BOTTOM,
                                          text: 'please enter your Language',
                                          tColor: ToastColors.WARNING);
                                    } else {
                                      var model = listLang[selectedLanguage];
                                      print(model.code);

                                     return setLangDirToShard(model.code!).then((value) {
                                        getTranslationFile(model.code!)
                                            .then((value) {
                                              AppCubit.get(context).setLanguage(
                                                  translateFileJson: value,
                                                  code: model.code);
                                            })
                                            .catchError((error) {
                                              print('error 1: ${error.toString()}');
                                        })
                                            .then((value) {

                                            })
                                            .catchError((error) {print('error 2: ${error.toString()}');});
                                      }).catchError((error) {print('error 3: ${error.toString()}');});
                                    }
                                  },
                                  text: '${transModel(context).done}',
                                  hs: 50.0,
                                  r: 0.0,
                                  color: Colors.indigo,
                                  style: white20regular()),
                            ),
                          ],
                        ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
