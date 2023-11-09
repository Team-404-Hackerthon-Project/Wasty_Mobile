import 'package:flutter/material.dart';
import 'package:wasty/components/custom_input_field.dart';
import 'package:wasty/components/footer_button.dart';
import 'package:wasty/constants.dart';
import 'package:wasty/components/custom_button.dart';
import 'package:wasty/screens/landingPage.dart';


import 'sign_in_screen.dart';

class RegistrationScreen extends StatelessWidget {
  RegistrationScreen({super.key});

  TextEditingController name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bodyColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Image(
              image: AssetImage(
                  'assets/images/overlapping_circles.png'
              ),
            ),

            //SizedBox(height: size * 0.05),

            const Center(child: Text('Welcome to Wasty!',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: Color(0xFF474A56),
              ),
            )),

            const SizedBox(height: 10,),

            const Center(child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 80, vertical: 40),
              child:
              Text(
                  maxLines: 4,
                  textAlign: TextAlign.center,
                  'How you manage your waste? If not then start from now', style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Color(0xFF474A56),
              ),),
            )),
            const SizedBox(height: 10,),
            Center(
              child: CustomInputField(
                  hintText: 'Enter full name',
                  textEditingController: name,
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return 'Enter your Name';
                    }

                    return null;
                  },
                  keyboardType: TextInputType.text),
            ),

            const SizedBox(height: 20,),
            Center(
              child: CustomInputField(
                  hintText: 'Email address',
                  textEditingController: name,
                  validator: (value){},
                  keyboardType: TextInputType.text),
            ),
            const SizedBox(height: 20,),
            Center(
              child: CustomInputField(
                  hintText: 'Password',
                  textEditingController: name,
                  validator: (value){},
                  keyboardType: TextInputType.text),
            ),
            const SizedBox(height: 20,),
            Center(
              child: CustomInputField(
                  hintText: 'Contact number +91',
                  textEditingController: name,
                  validator: (value){},
                  keyboardType: TextInputType.text),
            ),
            const SizedBox(height: 20,),
            Center(
              child: CustomInputField(
                  hintText: 'Current location',
                  textEditingController: name,
                  validator: (value){},
                  keyboardType: TextInputType.text),
            ),
            SizedBox(height: 40,),
            Center(child: CustomButton(buttonName:'Register',widget:LandingPage())),
            FooterButton(
                question: 'Already have an account?',
                buttonText: 'Sign In',
                object: SignInScreen(),
            )

          ],
        ),
      ) ,

    );
  }
}
