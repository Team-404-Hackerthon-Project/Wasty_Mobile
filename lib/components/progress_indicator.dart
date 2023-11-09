import 'package:flutter/material.dart';
import 'package:wasty/constants.dart';

Future<void> progressIndicatorBuilder(BuildContext context){
  return showDialog<void>(
      context: context,
      builder: (BuildContext context){
        return SimpleDialog(
          //insetPadding: EdgeInsets.symmetric(horizontal: 100,vertical:50),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)),
          children: [
            Container(
              width: 50.0,
              height: 50.0,
              child: Center(
                child: CircularProgressIndicator(
                  color: buttonColor,
                  strokeWidth: 10,
                ),
              ),
            ),
          ],

        );
      },
  );

}