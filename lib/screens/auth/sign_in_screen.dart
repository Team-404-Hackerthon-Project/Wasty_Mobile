import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wasty/components/custom_text_button.dart';
import 'package:wasty/components/footer_button.dart';
import 'package:wasty/components/progress_indicator.dart';
import 'package:wasty/constants.dart';
import 'package:wasty/components/custom_button.dart';
import 'package:wasty/components/custom_input_field.dart';
import 'package:wasty/screens/auth/registration_screen.dart';
import 'package:wasty/screens/landingPage.dart';
import '../../components/verifyBTN.dart';
import '../../utils/sharedPrefs/usersData.dart';
import 'forgot_password_screen.dart';
import 'package:wasty/apis/wasty_api_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

//AuthAPI client = AuthAPI();

DioClient client = DioClient();

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  void performLoginRequest() async {
    final dio = Dio();

    // Define the login endpoint and request data
    const String loginEndpoint = "https://hackathon-waste-api.onrender.com/api/v1/auth/login";
    final Map<String, dynamic> loginData = {
      "email": email.text,
      "password": password.text,
      "appType": "app2",
    };

    try {
      // Make a POST request to the login endpoint
      final response = await dio.post(loginEndpoint, data: loginData);

      // Handle the response
      if (response.statusCode == 200) {
        SharedPreferences prefs = await SharedPreferences.getInstance();

        prefs.setString('accessToken', response.data['accessToken']);

        Get.to(LandingPage(),
            duration: const Duration(seconds: 1),transition: Transition.native);

      } else {
        print("Login failed. Status code: ${response.statusCode}");
        print("Error message: ${response.data}");
      }
    } catch (error) {
      print("Error: $error");
    }
  }


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
                  textEditingController: password,
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
              VerifyBTN(btn: 'Log in', onTap: () async {

                if (_formKey.currentState!.validate()){
                  progressIndicatorBuilder(context);
                  performLoginRequest();
                  final SharedPreferences prefs = await SharedPreferences.getInstance();
                  final result = await client.postLogIn(email.text,password.text);
                  prefs.setString('accesstoken', result);
                  Navigator.pop(context);
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
