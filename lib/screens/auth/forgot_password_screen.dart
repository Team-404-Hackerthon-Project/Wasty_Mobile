import 'package:flutter/material.dart';
import 'package:wasty/components/custom_input_field.dart';
import 'package:wasty/constants.dart';
import 'package:wasty/components/custom_button.dart';
import 'package:wasty/screens/splash_screen.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bodyColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            image: AssetImage(
                'assets/images/overlapping_circles.png'
            ),
          ),

          Center(
            child: Text(
              'Set new password',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          SizedBox(height: 40,),
          Center(
            child: CustomInputField(
                hintText: 'Email address',
                textEditingController: email,
                validator: (value){},
                keyboardType: TextInputType.text),
          ),
          SizedBox(height: 20,),
          Center(
            child: CustomInputField(
                hintText: 'Email address',
                textEditingController: email,
                validator: (value){},
                keyboardType: TextInputType.text),
          ),
          SizedBox(height: 20,),
          Center(
            child: CustomInputField(
                hintText: 'Email address',
                textEditingController: email,
                validator: (value){},
                keyboardType: TextInputType.text),
          ),
          SizedBox(height: 20,),
          Center(
            child: Image(
              image: AssetImage(
                  'assets/images/password.png'
              ),
            ),
          ),
          SizedBox(height: 40,),

          Center(
            child: CustomButton(
                buttonName: 'Done',
                widget: SplashScreen()
            ),
          )
        ],
      ) ,

    );
  }
}
