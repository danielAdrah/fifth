import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'success_alert.dart';

void showDoneSuccess (BuildContext context,String title){
  
    showDialog(
      context: context,
      barrierDismissible:
          true, // Set to false if you want the dialog to not close when tapping outside
      builder: (BuildContext context) {
        return ZoomIn(
          delay: Duration(milliseconds: 150),
          curve: Curves.fastLinearToSlowEaseIn,
          child: SuccessAlert(text: title),
        );
      },
    );
  
}