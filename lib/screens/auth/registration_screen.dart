import 'package:flutter/material.dart';
import 'package:wasty/components/custom_input_field.dart';
import 'package:wasty/components/footer_button.dart';
import 'package:wasty/constants.dart';
import 'package:wasty/components/custom_button.dart';
import 'package:wasty/screens/landingPage.dart';
import 'package:wasty/apis/wasty_api_client.dart';


import 'sign_in_screen.dart';

AuthAPI client = AuthAPI();

class RegistrationScreen extends StatefulWidget{
  RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController name = TextEditingController();

  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  TextEditingController confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context){
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

            const SizedBox(height: 20,),

            const Center(child: Text('Welcome to Wasty!')),

            const SizedBox(height: 10,),

            const Center(child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 80, vertical: 40),
              child:
              Text(
                  maxLines: 4,
                  textAlign: TextAlign.center,
                  'How you manage your waste? If not then start from now'),
            )),
            const SizedBox(height: 10,),
            Center(
              child: CustomInputField(
                  hintText: 'Enter full name',
                  textEditingController: name,
                  validator: (value){},
                  keyboardType: TextInputType.text),
            ),

            const SizedBox(height: 20,),
            Center(
              child: CustomInputField(
                  hintText: 'Email address',
                  textEditingController: email,
                  validator: (value){},
                  keyboardType: TextInputType.text),
            ),
            const SizedBox(height: 20,),
            Center(
              child: CustomInputField(
                  hintText: 'Password',
                  textEditingController: password,
                  validator: (value){},
                  keyboardType: TextInputType.text),
            ),
            const SizedBox(height: 20,),
            Center(
              child: CustomInputField(
                  hintText: 'Confirm password',
                  textEditingController: confirmPassword,
                  validator: (value){},
                  keyboardType: TextInputType.text),
            ),
            const SizedBox(height: 20,),

            SizedBox(height: 40,),
            Center(
                child:
                CustomButton(
                    buttonName:'Register',
                    widget:LandingPage(),
                    function: client.register(name.text, email.text, password.text)  ,
                    arguments: {
                      "username": name.text,
                      "email": email.text,
                      "password": password.text,
                    },

                )
            ),
            FooterButton(
                question: 'Already have an account?',
                buttonText: 'Log In',
                object: SignInScreen(),
            )

          ],
        ),
      ) ,

    );
  }
}
