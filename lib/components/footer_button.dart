import 'package:flutter/material.dart';
import 'custom_text_button.dart';

class FooterButton extends StatelessWidget {
  final String question;
  final String buttonText;
  final Widget object;

  const FooterButton({super.key, required this.question, required this.buttonText, required this.object});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(question),
        CustomTextButton(buttonName: buttonText, object:object)
      ],
    );
  }
}
