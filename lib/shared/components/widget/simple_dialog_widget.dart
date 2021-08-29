
import 'package:e_commerce/layout/home_layout.dart';
import 'package:e_commerce/shared/components/constance/constants.dart';
import 'package:e_commerce/shared/components/default_navigator/navigat.dart';
import 'package:flutter/material.dart';

class SimpleDialogWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
          title: new Text('Order is done',style: Theme.of(context).textTheme.subtitle2,textAlign: TextAlign.center,),
      children: [
        MaterialButton(
            child: Text('Close'),
            onPressed: ()
    {
            appCubit(context).onClickCurrentIndex(0);
            return navigateAndFinish(context:context,widget: Layout());
    })
      ],
    );
  }
}
