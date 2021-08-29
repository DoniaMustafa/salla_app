
import 'package:e_commerce/shared/stayle/default_color.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final  double? width;
  final double height;
  Function? onPress;
  final  TextStyle? style;
  DefaultButton({required this.text, this.width,required this.height, required this.onPress, this.style});

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQueryData(
        textScaleFactor: 1.0,
      ),
      child: Container(
          height: height,
          width: width,
          child: MaterialButton(
              child: Text(
                text,
                style: style,
              ),
              color: indigo(),
              onPressed: ()=> onPress!()  ),
    ));
  }
}
