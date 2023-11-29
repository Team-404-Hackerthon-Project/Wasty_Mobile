import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasty/utils/constants.dart';

import '../../components/Buttons/BTN.dart';
import '../../components/Buttons/footer_button.dart';
import '../../components/Textfields/custom_input_field.dart';
import '../../post_functions/post_functions.dart';
import 'sign_in_screen.dart';

//DioClient client = DioClient();

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
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
                'Welcome to Wasty!',
                style: AppStyle.headerText,
              )),
              SizedBox(height: size * 0.05),
              const Center(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 80, vertical: 40),
                child: Text(
                  maxLines: 4,
                  textAlign: TextAlign.center,
                  'How you manage your waste? If not then start from now',
                  style: AppStyle.bodyText,
                ),
              )),
              SizedBox(height: size * 0.05),
              Center(
                child: CustomInputField(
                    hintText: 'Enter full name',
                    textEditingController: name,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter your Name';
                      }

                      return null;
                    },
                    keyboardType: TextInputType.text),
              ),
              SizedBox(height: size * 0.05),
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
                    keyboardType: TextInputType.text),
              ),
              SizedBox(height: size * 0.05),
              Center(
                child: CustomInputField(
                    obscureText: true,
                    hintText: 'Password',
                    textEditingController: password,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Password';
                      }
                      return null;
                    },
                     showVisibilityToggle: true,
                    keyboardType: TextInputType.text),
              ),
              SizedBox(height: size * 0.05),
              Center(
                child: CustomInputField(
                    obscureText: true,
                    hintText: 'Confirm password',
                    textEditingController: confirmPassword,
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          value != password.text) {
                        return 'password do not match';
                      }
                      return null;
                    },
                     showVisibilityToggle: true,
                    keyboardType: TextInputType.text),
              ),
              SizedBox(height: size * 0.1),
              Center(
                child: MyBTN(
                  btn: 'Register',
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      // SharedPreferences prefs = await SharedPreferences.getInstance();
                      // prefs.setString('email', email.text);
                      // progressIndicatorBuilder(context);
                      // final result = await client.postRegistration(name.text,email.text,password.text);
                      // Navigator.pop(context);
                      //  ScaffoldMessenger.of(context).showSnackBar(
                      //         const SnackBar(
                      //             content: Text('Registration successful..')),
                      //       );
                      // Get.to(SignInScreen(),
                      //     duration: const Duration(seconds: 1),transition: Transition.native);

                      // Start ProgressIndicator
                      setState(() {
                        isLoading = true;
                      });

                      final Map data = {
                        'username': name.text,
                        'email': email.text,
                        'password': password.text,
                        'appType': 'app2'
                      };
                      await AuthPostRequest.registerUser(data);
                      // stop progress indicator
                      setState(() {
                        isLoading = true;
                      });

                    }
                  },
                ),
              ),
              FooterButton(
                question: 'Already have an account?',
                buttonText: 'Log In',
                 onTap: () { Get.to(SignInScreen()); },
              )
            ],
          ),
        ),
      ),
    );
  }
}
