import 'package:e_commerce/shared/components/constance/constants.dart';
import 'package:e_commerce/shared/components/default_button/material_button.dart';
import 'package:e_commerce/shared/cubit/cubit_home_product/cubit_pro.dart';
import 'package:e_commerce/shared/stayle/stayles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget badge({required String text}) {
  return Container(
    width: 15,
    height: 17.5,
    alignment: Alignment.topCenter,
    decoration: BoxDecoration(
shape: BoxShape.circle,
      color: Colors.red,
    ),

    padding: EdgeInsets.only(
      bottom: 3.0
    ),
    child: Text(
      '$text',
      style: black14regular(),
      textAlign: TextAlign.center,
    ),
  );
}
