import 'package:e_commerce/shared/components/constance/constants.dart';
import 'package:e_commerce/shared/components/default_navigator/navigat.dart';
import 'package:e_commerce/shared/cubit/cubit_app/cubit.dart';
import 'package:e_commerce/shared/stayle/default_color.dart';
import 'package:e_commerce/shared/stayle/icomoon_icons.dart';
import 'package:e_commerce/shared/stayle/stayles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

Widget defTextForm(
    {required String validate,
     String? text,
     String? hint,
    required TextEditingController control,
      final IconData? prefix,
      final   IconData? suffix,
      final double er = 10.0,
      final double fr = 10.0,
      final Color fColor = Colors.indigo,
    // Function fun,
      final bool isPass = false,
      final bool isIcon = false,
        Function? change,
      final String? i,
      type,
      TextAlign textAlign = TextAlign.start,
      final double width = double.infinity,
      final  double height = 0.0,
      final  double suffixSize = 0.0,
      final  bool focus = false,
      final int mx = 0,
      final bool isEnableLine = false,
      final bool isFocusLine = false,
      final bool isContainer = false,
      final double widthCon = 0.0,
      final double heightCon = 0.0,
      final String txt = '',
      final Function? onPress,
      // final Alignment? alignment
    // int maxLength = 0
    }) {
  return TextFormField(
textAlignVertical: TextAlignVertical.center,
      cursorColor: Color(0xFF643ac7),
      textAlign: textAlign,
      validator: (String? value) {
        if (value!.isEmpty) {
          return validate;
        }
      },
      // maxLength: maxLength,
      style: black18regular()
          .copyWith(color: Colors.black54, decoration: TextDecoration.none,),
      autofocus: focus,
      controller: control,
      obscureText: isPass,
      keyboardType: type,
      maxLines: mx,
      onChanged: (String i) =>change!(i),
      decoration: InputDecoration(
        border: InputBorder.none,
        focusColor: Colors.grey,
        labelText: text,
        labelStyle: grey16(),
        errorBorder: InputBorder.none,
        prefixIcon: prefix != null
            ? Icon(
                prefix,
                size: 20,

                color: indigo(),
              )
            : null,
        suffixIcon: isContainer
            ? GestureDetector(
                onTap:(){return onPress!();},
                child: isIcon
                    ? Icon(
                        suffix,
                        color: indigo(),
                        size: suffixSize,
                      )
                    : Container(
                        alignment: Alignment.center,
                        color: Colors.indigo,
                        width: widthCon,
                        height: heightCon,
                        child: Text(
                          txt,
                          textAlign: TextAlign.center,
                        ),
                      ),
              )
            : null,
        filled: true,
        fillColor: Colors.white,
        enabledBorder: isEnableLine
            ? OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(er)),
                borderSide: BorderSide(
                  color: Colors.grey,
                  width: 0.0,
                  style: BorderStyle.solid,
                ))
            : null,
        focusedBorder: isFocusLine
            ? OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(fr)),
                borderSide: BorderSide(
                    color: fColor, width: 0.0, style: BorderStyle.solid),
              )
            : null,
      ));
}

Widget rowTxIn(
    {Function? onPress,
    required String text,
     IconData? icon,
       Widget? widget,
    context,
    bool isIcon = true}) {
  return Container(
    height: 50,
    child: Row(
      children: [
        Text(
          '$text',
          style: Theme.of(context).textTheme.bodyText1,
        ),
        Spacer(
          flex: 1,
        ),
        if (isIcon)
          IconButton(
                icon: Icon(icon),
                color: Colors.grey[800],
                iconSize: 20,
                onPressed: () => onPress,
              ) else
                widget!
      ],
    ),
  );
}
