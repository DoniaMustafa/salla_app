import 'package:e_commerce/shared/components/default_button/circal_but_widget.dart';
import 'package:e_commerce/shared/stayle/stayles.dart';
import 'package:flutter/material.dart';




// Widget defButton({
//   @required String txt,
//   TextStyle style,
//   Color color,
//   double r=0.0,
//   Function fun,
//   String img,
//   bool isImg = false,
//   double width = double.infinity,
//   double height=0.0,
//   BoxFit fit
// }) {
//   return MaterialButton(
//     onPressed: () =>fun,
//     child: Container(
//       padding: EdgeInsets.all(10),
//       width: width,
//       height: height,
//       decoration: BoxDecoration(
//           color: color,
//           borderRadius: BorderRadius.circular(r),
//           border: Border.all(color: Colors.grey)),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           isImg == true
//               ? Image(
//                   image: NetworkImage(img),
//                   fit: fit,           )
//               : Container(),
//           Text(
//             '$txt',
//
//             style: style,
//           )
//         ],
//       ),
//     ),
//   );
// }

// Widget defaultCircleButton(
//     { fun,
//     color = Colors.blue,
//     double r=0.0,
//     IconData icon,
//     double size=0.0,
//     Color iconColor: Colors.white,
//     double ws = 0.0 ,
//     double hs= 0.0 ,
//     bool isIcon = true,
//     String text='',
//     TextStyle style,
//     TextAlign align,
//     Alignment alignment,
//       isImg= false,
//       fit,
//       img
//       }) {
//   return Container(
//     width: ws,
//     height: hs,
//     alignment: alignment,
//     decoration:
//         BoxDecoration(borderRadius: BorderRadius.circular(r), color: color),
//     child: MaterialButton(
//       // focusElevation: 20.0,
//       onPressed:() {
//         print('dvdvok');
//         return  fun;
//       } ,
//       padding: EdgeInsets.only(right: 0.0),
//       child: isIcon
//           ? Container(
//             child: Icon(
//                 icon ?? null,
//                 size: size,
//                 color: iconColor,
//
//               ),
//           ): isImg == true
//           ? Image(
//         image: NetworkImage(img),
//         fit: fit,           )
//           : Text(
//               text,
//               style: style,
//               textAlign: align,
//             ),
//     ),
//   );
// }

Widget radiusButton(
    {String txet1 = '',
    String txet2 = '',
    double ws = 0.0,
    double hs = 0.0,
    double hRadius2 = 0.0,
    double wRadius2 = 0.0,
    double hRadius1 = 0.0,
    double wRadius1 = 0.0,
    Color color = Colors.indigo,
    double r = 0.0,
    double r1 = 0.0,
    double r2 = 0.0,
    icon1,
    icon2,
    double iconSize1=0.0,
    double iconSize2=0.0,
    Color? iconColor1,
    Color? iconColor2,
    Color backColor1 = Colors.grey,
    Color backColor2 = Colors.grey}) {
  return Container(
    height: hs,
    width: ws,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(r),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          txet1,
          style: black20regular(),
        ),
        SizedBox(
          width: 10,
        ),
        Container(
          child: DefaultCircleButton(
            icon: icon1,
            size: iconSize1,
            r: r1,
            fun: (){},
            iconColor: iconColor1!,
            color: backColor1,
            hs: hRadius1,
            ws: wRadius1,
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Text(
          txet2,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          width: 20,
        ),
        DefaultCircleButton(
          icon: icon2,
          size: iconSize2,
          r: r2,
          fun: (){},
          hs: hRadius2,
          ws: wRadius2,
          iconColor: iconColor1,
          color: backColor2,
        ),
      ],
    ),
  );
}
defaultImage({double width =0.0,Color color =Colors.transparent,double r=0.0,required String image,
  double height=0.0,
  required BoxFit fit,
})=>
    Container(
      constraints: BoxConstraints(
        maxWidth: width,
        maxHeight: height
      ),
      // margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color:color ,
        borderRadius: BorderRadius.circular(r),
        image: DecorationImage(
          image: NetworkImage(image),
          fit: fit
        )
      ),
);
