import 'package:flutter/material.dart';

class DefaultCircleButton extends StatelessWidget {
  final Function fun;
  final Color? color;
  final double r;
  final IconData? icon;
  final double? size;
  final Color iconColor;
  final double? ws;
  final  double hs;
  final bool isIcon;
  final  String? text;
  final   TextStyle? style;
  final TextAlign? align;
  final Alignment? alignment;
  DefaultCircleButton(
      {required this.fun,
         this.color,
      this.r = 0.0,
         this.icon,
        this.size,
      this.iconColor = Colors.white,
          this.ws,
        required this.hs,
      this.isIcon = false,
      this.text,
      this.style,
      this.align,
      this.alignment});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ws,
      height: hs,
      alignment: alignment,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(r), color: color),
      child: MaterialButton(
        padding: EdgeInsets.only(right: 1),
        onPressed: ()=>fun(),
        child: isIcon
            ? Container(
                child: Icon(
                  icon ?? null,
                  size: size,
                  color: iconColor,
                ),
              )
                : Text(
                    text!,
                    style: style,
                    textAlign: align,
                  ),
      ),
    );
  }
}
