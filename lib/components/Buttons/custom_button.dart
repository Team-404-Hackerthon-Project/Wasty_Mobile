import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wasty/utils/constants.dart';


class CustomButton extends StatelessWidget {
  final String buttonName;
  final Map<String, String>? arguments;
  final bool validationCondition;
  final bool disableStraightRouting;
  final Future<dynamic>? function;
  final Function? block;
  final VoidCallback onTap;



  const CustomButton(
    {super.key,required this.buttonName, this.arguments,this.function,this.block,this.validationCondition = true, this.disableStraightRouting = false, required this.onTap});

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
        onPressed: onTap,

      child: Text(
            buttonName,
          maxLines: 1,
        ),

    );
  }
}


