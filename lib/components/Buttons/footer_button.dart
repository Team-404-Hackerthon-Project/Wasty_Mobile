import 'package:flutter/material.dart';
import 'custom_text_button.dart';

class FooterButton extends StatelessWidget {
  final String question;
  final String buttonText;
  final VoidCallback onTap;


  const FooterButton({super.key, required this.question, required this.buttonText, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(question),
        CustomTextButton(buttonName: buttonText,  onTap: onTap,)
      ],
    );
  }
}
