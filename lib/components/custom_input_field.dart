import 'package:flutter/material.dart';
import 'package:wasty/constants.dart';

class CustomInputField extends StatefulWidget {
  final String hintText;
  final String? Function(String?)? validator;
  final TextEditingController textEditingController;
  final TextInputType keyboardType;

  const CustomInputField(
      {Key? key,
        required this.hintText,
        required this.textEditingController,
        required this.validator,
        required this.keyboardType,}): super(key:key);

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  @override
  Widget build(BuildContext context) {
    return Container(
          width: 380,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
              )
            ],
            color: formFieldColor,
            borderRadius: BorderRadius.circular(50),),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 30),
            child: TextFormField(
              keyboardType: widget.keyboardType,
              controller: widget.textEditingController,
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: TextStyle(
                  color: formFieldHintColor,
                ),
                border: InputBorder.none),
              validator: widget.validator,
              ),
            ),
          );
  }
}
