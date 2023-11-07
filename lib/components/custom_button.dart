import 'package:flutter/material.dart';
import 'package:wasty/constants.dart';
import 'package:wasty/utils/navigation/route_navigator.dart';

class CustomButton extends StatelessWidget {
  final String buttonName;
  final Widget object;

  const CustomButton({super.key,required this.buttonName,required this.object});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          //minimumSize: Size.fromRadius(radius),
          fixedSize:Size(370,70),
          //Size.fromWidth(370),
          backgroundColor: buttonColor,
          foregroundColor: buttonTextColor,
          elevation: 0,
          padding: EdgeInsetsDirectional.symmetric(horizontal: 100, vertical: 0.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
          ),
          textStyle: TextStyle(
            fontSize: 20,
          )


        ),
        onPressed: (){routeNavigator(context, object);},
        child: Text(
            buttonName,
          maxLines: 1,
        ),

    );
  }
}


