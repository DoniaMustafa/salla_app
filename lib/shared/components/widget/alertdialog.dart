import 'package:e_commerce/shared/stayle/stayles.dart';
import 'package:flutter/material.dart';

class MyStatelessWidget extends  StatelessWidget {
  late Function onPress;
MyStatelessWidget({required this.onPress});

  @override
  Widget build(BuildContext context) {
    return
      AlertDialog(
        title:  Text('Cancel order',style: black20bold(),),

        content:  Text('are you want cancellation this order?',
            style: black18regular()),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: (){
              return onPress();
            },
            child: const Text('OK'),
          ),
        ],

    );
  }

}
