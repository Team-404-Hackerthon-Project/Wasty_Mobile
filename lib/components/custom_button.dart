import 'package:flutter/material.dart';
import 'package:wasty/constants.dart';
import 'package:wasty/utils/navigation/route_navigator.dart';

class CustomButton extends StatelessWidget {
  final String buttonName;
  final Widget widget;
  final Map<String, String>? arguments;
  final bool condition;
  final Future<dynamic>? function;
  final Function? block;

  const CustomButton(
    {super.key,required this.buttonName,required this.widget, this.arguments,this.function,this.block,this.condition = true});

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
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 100, vertical: 0.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
          ),
          textStyle: TextStyle(
            fontSize: 20,
          )


        ),
        onPressed: () async{
          if (condition) {
            block;
            final result = await function;
            if(result.isEmpty()) {
              routeNavigator(widget,arguments);}

          }
          },
        child: Text(
            buttonName,
          maxLines: 1,
        ),

    );
  }
}


