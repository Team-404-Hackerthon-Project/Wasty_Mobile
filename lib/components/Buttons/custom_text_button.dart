import 'package:flutter/material.dart';
import 'package:wasty/utils/constants.dart';


class CustomTextButton extends StatelessWidget {
  final String buttonName;

  final VoidCallback onTap;


  const CustomTextButton({super.key,required this.buttonName, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
          foregroundColor: emphasisTextColor,
        ),
        onPressed: onTap,
        child: Text(
            buttonName,
            maxLines: 1,
        ),
    );
  }
}
