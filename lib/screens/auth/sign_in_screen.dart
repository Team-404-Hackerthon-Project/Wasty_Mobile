import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wasty/components/custom_text_button.dart';
import 'package:wasty/components/footer_button.dart';
import 'package:wasty/constants.dart';
import 'package:wasty/components/custom_button.dart';
import 'package:wasty/components/custom_input_field.dart';
import 'package:wasty/screens/auth/registration_screen.dart';
import '../../components/verifyBTN.dart';
import 'forgot_password_screen.dart';
import 'package:wasty/apis/wasty_api_client.dart';

//AuthAPI client = AuthAPI();

DioClient client = DioClient();

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: bodyColor,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Image(
                image: AssetImage(
                    'assets/images/overlapping_circles.png'
                ),
              ),

              const Center(
                child: Text(
                  'Welcome to Wasty again!',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF474A56),
                  ),
                ),
              ),
              SizedBox(height: size * 0.05),

              const Center(
                child: Image(
                  image: AssetImage(
                      'assets/images/man_next_to_phone.png'
                  ),
                ),
              ),
              SizedBox(height: size * 0.1),
              Center(
                child: CustomInputField(
                    hintText: 'Email address',
                    textEditingController: email,
                    validator: (value){
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email address';
                      }

                      return null;
                    }, keyboardType: TextInputType.emailAddress,
    )),
              SizedBox(height: size * 0.05),


            Center(
              child: CustomInputField(
                  hintText: 'Password',
                  textEditingController: email,
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return 'Please provide a password';
                    }

                    return null;
                  },
                  keyboardType: TextInputType.text),
            ),

            Center(
                child: CustomTextButton(
                  buttonName: 'Forgot Password ?',
                  widget: ForgotPasswordScreen(),
                )),

            SizedBox(height: 20,),
            // Center(
            //     child: CustomButton(
            //       buttonName:'Log In',
            //       widget: RegistrationScreen(),
            //       function: client.postLogIn(email.text, password.text),
            //     )),
              VerifyBTN(btn: 'Log in', onTap: () {

                if (_formKey.currentState!.validate()){
                  Get.to(RegistrationScreen(),
                      duration: const Duration(seconds: 1),transition: Transition.native);
                }
                },),
            Center(
              child: FooterButton(question: 'Dont have an account?', buttonText: 'Sign Up', object: RegistrationScreen()),
            )


                    ,

              // SizedBox(height: size * 0.03),
              // Center(
              //   child: CustomInputField(
              //       hintText: 'Email address',
              //       textEditingController: email,
              //       validator: (value){},
              //       keyboardType: TextInputType.text),
              // ),

              //Center(child: CustomTextButton(buttonName: 'Forgot Password ?', widget: ForgotPasswordScreen(),)),
              //SizedBox(height: size * 0.05),
              //Center(child: CustomButton(buttonName:'Get Started', widget: RegistrationScreen(),)),
              //SizedBox(height: size * 0.01),
              // Center(
              //   child: FooterButton(question: 'Dont have an account?', buttonText: 'Sign Up', object: RegistrationScreen()),
              // ),
              //SizedBox(height: size * 0.01),

            ],
          ),
        ),
      ) ,

    );
  }
}
