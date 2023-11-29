import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:wasty/utils/constants.dart';
import 'package:wasty/components/Buttons/custom_button.dart';
import 'package:wasty/screens/auth/splash_screen.dart';

import '../../components/Textfields/custom_input_field.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  final TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bodyColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Image(
            image: AssetImage(
                'assets/images/overlapping_circles.png'
            ),
          ),

          const Center(
            child: Text(
              'Set new password',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          const SizedBox(height: 40,),
          Center(
            child: CustomInputField(
                hintText: 'Email address',
                textEditingController: email,
                validator: (value){
                  return null;
                },
                keyboardType: TextInputType.text),
          ),
          const SizedBox(height: 20,),
          Center(
            child: CustomInputField(
                hintText: 'Email address',
                textEditingController: email,
                validator: (value){
                  return null;
                },
                keyboardType: TextInputType.text),
          ),
          const SizedBox(height: 20,),
          Center(
            child: CustomInputField(
                hintText: 'Email address',
                textEditingController: email,
                validator: (value){
                  return null;
                },
                keyboardType: TextInputType.text),
          ),
          const SizedBox(height: 20,),
          const Center(
            child: Image(
              image: AssetImage(
                  'assets/images/password.png'
              ),
            ),
          ),
          const SizedBox(height: 40,),

          Center(
            child: CustomButton(
                buttonName: 'Done',
                 onTap: () {
                  Get.to(SplashScreen());
            },
            ),
          )
        ],
      ) ,

    );
  }
}
