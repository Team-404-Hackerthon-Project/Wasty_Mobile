import 'package:flutter/material.dart';
import 'package:wasty/constants.dart';

class CustomButton extends StatelessWidget {
  final String buttonName;

  const CustomButton({super.key,required this.buttonName});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          foregroundColor: buttonTextColor,
          elevation: 0,
          padding: EdgeInsetsDirectional.symmetric(horizontal: 130, vertical: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
          ),
          textStyle: TextStyle(
            fontSize: 20,
          )


        ),
        onPressed: (){},
        child: Text(
            buttonName,
        ),

    );
  }
}


void routeNavigator (String route, context , Widget object){
  Navigator.push(context, MaterialPageRoute(builder: (context) => object));
}
