import 'package:e_commerce/layout/home_layout.dart';
import 'package:e_commerce/modules/login/login_screen.dart';
import 'package:e_commerce/modules/select_language/select_language_screen.dart';
import 'package:e_commerce/shared/components/constance/constants.dart';
import 'package:e_commerce/shared/cubit/cubit_app/cubit.dart';
import 'package:e_commerce/shared/cubit/cubit_app/statet.dart';
import 'package:e_commerce/shared/cubit/cubit_home_product/cubit_pro.dart';
import 'package:e_commerce/shared/di/dependency_injaction.dart';
import 'package:e_commerce/shared/network/remote/dio_helper.dart';
import 'package:e_commerce/shared/stayle/default_color.dart';
import 'package:e_commerce/shared/stayle/stayles.dart';
import 'package:e_commerce/shared/stayle/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  myToken = await getUserToken();
  appLangDirection = await getAppLangAndDir();
  String translateFile = await getTranslationFile(appLangDirection ??'en');
  Widget start;
  if (appLangDirection != null && myToken != null) {
    start = Layout();
  } else if (appLangDirection != null && myToken == null) {
    start = Login();
  } else {
    start = SelectLanguage();
  }


  runApp(
    MyApp(
      translate: translateFile,
      code: appLangDirection.toString(),
      widget: start,
    ),
  //     DevicePreview(
  //   builder: (context) =>
  // )
  );
}

class MyApp extends StatelessWidget {
  final Widget widget;
  final String code;
  final String translate;
  MyApp({required this.translate, required this.code, required this.widget});


  @override
  Widget build(BuildContext context) {
    DioImplementation();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => di<AppCubit>()
              ..setLanguage(translateFileJson: translate, code: code)
              ..getNotify()
              ..getTheme()..setFSM('$myToken')
              ..getProfileInfo()
              ..getHomeData()
              ..getCategory()
              ..getProductFromFavorite()
              ..getProductFromCart()),
        BlocProvider(create: (context) => di<ProductCubit>())
      ],
      child: BlocConsumer<AppCubit, AppState>(

        builder: (context, state) {
          // print('appLangDirection $appLangDirection');
          // print('main isDark $isDark');

          return MaterialApp(
              // builder: DevicePreview.appBuilder,
              debugShowCheckedModeBanner: false,
              // debugShowMaterialGrid: true,
              title: 'Flutter Demo',
              darkTheme: darkTheme,
              theme: lightTheme,
              themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
              home: Directionality(
                  textDirection: di<AppCubit>().textDirection, child: widget));
        },
        listener: (context, state){},
      ),
    );
  }

}
