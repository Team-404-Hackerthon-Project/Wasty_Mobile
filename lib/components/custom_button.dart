import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
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
          //minimumSize: Size.fromRadius(8),
          fixedSize:const Size(370,50),
          //Size.fromWidth(370),
          backgroundColor: buttonColor,

          foregroundColor: buttonTextColor,
          elevation: 0,
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 100, vertical: 10.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
          ),
          textStyle: const TextStyle(
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


