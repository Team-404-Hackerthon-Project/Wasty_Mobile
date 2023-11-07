import 'package:flutter/material.dart';
import 'package:wasty/constants.dart';

class CustomButton extends StatelessWidget {
  final String buttonName;
  final VoidCallback onPress;

  const CustomButton({
    Key? key, // Add the Key parameter here
    required this.buttonName,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        foregroundColor: buttonTextColor,
        elevation: 0,
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 130, vertical: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0),
        ),
        textStyle: const TextStyle(
          fontSize: 20,
        ),
      ),
      onPressed: () {
        onPress(); // Call the onPress callback here
      },
      child: Text(
        buttonName,
      ),
    );
  }
}
