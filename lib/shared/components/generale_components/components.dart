import 'package:e_commerce/model/list_model.dart';
import 'package:e_commerce/shared/components/default_button/material_button.dart';
import 'package:e_commerce/shared/cubit/cubit_app/cubit.dart';
import 'package:e_commerce/shared/stayle/default_color.dart';
import 'package:e_commerce/shared/stayle/stayles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

showToast({required String text, required ToastColors tColor,
  required ToastGravity gravity
}) {
  Fluttertoast.showToast(
    msg: '$text',
    toastLength: Toast.LENGTH_SHORT,
    fontSize: 16,
    backgroundColor: setToastColor(tColor),

    gravity:gravity
  );
}

// enum ToastGravity{CENTER,BOTTOM,TOP}
// setToastGravity(ToastGravity gravity) {
//   ToastGravity basicGravity;
//   switch (gravity) {
//     case ToastGravity.CENTER:
//       basicGravity = ToastGravity.CENTER;
//       break;
//     case ToastGravity.BOTTOM:
//       basicGravity = ToastGravity.BOTTOM;
//       break;
//     case ToastGravity.TOP:
//       basicGravity = ToastGravity.TOP;
//
//       break;
//   }
//   return basicGravity;
// }

enum ToastColors { SUCCESS, ERROR, WARNING }

setToastColor(ToastColors color) {
  Color basicColor;
  switch (color) {
    case ToastColors.SUCCESS:
      basicColor = Colors.green;
      break;
    case ToastColors.ERROR:
      basicColor = Colors.red;
      break;
    case ToastColors.WARNING:
      basicColor = Colors.yellow;

      break;
  }
  return basicColor;
}

Future<void> showMyDialog(
    {context, onTap, required String text, required String but1,required String but2, required String cont}) async {
  return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('$text',style:black20bold() ,),
          content: Text('$cont',style:black16bold() ),
          actions: <Widget>[
            TextButton(
              child: Text('$but1'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('$but2'),
              onPressed: ()=>onTap,
            ),
          ],
        );
      });
}

List<PaymentModel> pay = [
  PaymentModel(
      icon: Icons.money, title: 'Cash on Delivery', subTitle: 'dfgvsgv'),
  PaymentModel(
      icon: Icons.credit_card, title: 'OnLine', subTitle: 'dfgvsgv'),
];

List<LanguageModel> listLang = [
  LanguageModel(language: 'English', code: 'en'),
  LanguageModel(language: 'العربية', code: 'ar')
];

Widget languageItem({required LanguageModel model, context, index}) => InkWell(
    onTap: () {
      return AppCubit.get(context).changeSelectLanguage(index);
    },
    child: Row(
      children: [
        Text(
          '${model.language}',
          style: Theme.of(context).textTheme.bodyText1,
        ),
        Spacer(
          flex: 1,
        ),
        if (AppCubit.get(context).itemLang[index])
          Icon(
            Icons.check_circle,
            color: indigo(),
          ),
      ],
    ));
