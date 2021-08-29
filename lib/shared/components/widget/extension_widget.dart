import 'package:flutter/material.dart';

class ExtensionWidget extends StatelessWidget {
  late String titleText;
   String? subtitle;
   Function? onTap;
   bool? isShow;
  ExtensionWidget({ this.subtitle,  this.onTap, required this.titleText,this.isShow = true});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        children: [
          Text(
            titleText,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Spacer(
            flex: 1,
          ),
        if ( isShow!)
          GestureDetector(
            onTap: (){
              return onTap!();
            },
            child: Text(
              subtitle!,
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ),
        ],
      ),
    );
  }

}
