import 'package:flutter/material.dart';
import 'package:wasty/components/custom_text_button.dart';
import 'package:wasty/components/footer_button.dart';
import 'package:wasty/constants.dart';
import 'package:wasty/components/custom_button.dart';
import 'package:wasty/components/custom_input_field.dart';
import 'package:wasty/screens/auth/registration_screen.dart';

import 'forgot_password_screen.dart';
class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

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
              'Welcome to Wasty again!',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),

          Center(
            child: Image(
              image: AssetImage(
                  'assets/images/man_next_to_phone.png'
              ),
            ),
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

          Center(child: CustomTextButton(buttonName: 'Forgot Password ?', widget: ForgotPasswordScreen(),)),
          SizedBox(height: 20,),
          Center(child: CustomButton(buttonName:'Get Started', widget: RegistrationScreen(),)),
          Center(
            child: FooterButton(question: 'Dont have an account?', buttonText: 'Sign Up', object: RegistrationScreen()),
          )

        ],
      ) ,

    );
  }
}
