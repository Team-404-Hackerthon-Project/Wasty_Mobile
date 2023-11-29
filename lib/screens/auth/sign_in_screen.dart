import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:wasty/utils/constants.dart';
import 'package:wasty/screens/auth/registration_screen.dart';
import '../../components/Buttons/BTN.dart';
import '../../components/Buttons/custom_text_button.dart';
import '../../components/Buttons/footer_button.dart';
import '../../components/Textfields/custom_input_field.dart';
import '../../post_functions/post_functions.dart';
import 'forgot_password_screen.dart';


class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();
  bool isLoading = false;

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
                image: AssetImage('assets/images/overlapping_circles.png'),
              ),
              const Center(
                child: Text(
                  textAlign: TextAlign.center,
                  'Welcome to Wasty again!',
                  style: AppStyle.headerText,
                ),
              ),
              SizedBox(height: size * 0.05),
              const Center(
                child: Image(
                  image: AssetImage('assets/images/man_next_to_phone.png'),
                ),
              ),
              SizedBox(height: size * 0.1),
              Center(
                  child: CustomInputField(
                hintText: 'Email address',
                textEditingController: email,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email address';
                  }

                  return null;
                },
                keyboardType: TextInputType.emailAddress,
                
              )),
              SizedBox(height: size * 0.05),
              Center(
                child: CustomInputField(
                    obscureText: true,
                    hintText: 'Password',
                    textEditingController: password,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please provide a password';
                      }
                      return null;
                    },
                    showVisibilityToggle: true,
                    keyboardType: TextInputType.text),
              ),
              Center(
                  child: CustomTextButton(
                buttonName: 'Forgot Password ?', onTap: () {
                  Get.to(ForgotPasswordScreen());
                  },
              )),
              FooterButton(
                  question: 'Dont have an account?',
                  buttonText: 'Sign Up',
                  onTap: () {Get.to(const RegistrationScreen());  },),
              const SizedBox(
                height: 20,
              ),
              MyBTN(
                  btn: 'Log in',
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {

                      // Start ProgressIndicator
                      setState(() {
                        isLoading = true;
                      });

                      // Creating user registration mapData
                      final Map<String, dynamic> userLoginData = {
                        "email": email.text,
                        "password": password.text,
                        "appType": 'app2',
                      };
                      // Gather and send data to Register post function
                      await AuthPostRequest.loginUser(userLoginData);

                      // STOP ProgressIndicator
                      setState(() {
                        isLoading = false;
                      });
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
