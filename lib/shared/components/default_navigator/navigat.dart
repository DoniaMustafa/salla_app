import 'package:flutter/material.dart';

 navigaTo({required context, required Widget widget})=>Navigator.push(
      context, MaterialPageRoute(builder: (context) => widget));



void navigateAndFinish({context, widget}) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
        (Route<dynamic> route) => false);

navigateUntilPop({@required context}) =>
    Navigator.pop(context);

