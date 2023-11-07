import 'package:flutter/material.dart';
import 'package:wasty/constants.dart';
import 'package:wasty/utils/navigation/route_navigator.dart';

class CustomTextButton extends StatelessWidget {
  final String buttonName;
  final Widget object;

  const CustomTextButton({super.key,required this.buttonName, required this.object});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
          foregroundColor: emphasisTextColor,
        ),
        onPressed: (){routeNavigator(context, object);},
        child: Text(
            buttonName,
            maxLines: 1,
        ),
    );
  }
}
