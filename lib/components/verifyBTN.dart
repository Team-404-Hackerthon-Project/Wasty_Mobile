import 'package:flutter/material.dart';

class VerifyBTN extends StatelessWidget {
  final String btn;
  final VoidCallback onTap;

  VerifyBTN({super.key, required this.btn, required this.onTap,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 50,
          width: double.infinity,
          color: const Color(0xFF00BD15),
          child: Center(child: Text(btn,style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Color(0xFFFFFFFF),
          ),)),
        ),
      ),
    );
  }
}
