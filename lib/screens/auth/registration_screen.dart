import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wasty/components/custom_input_field.dart';
import 'package:wasty/components/footer_button.dart';
import 'package:wasty/constants.dart';
import 'package:wasty/components/custom_button.dart';
import 'package:wasty/screens/landingPage.dart';
import 'package:wasty/apis/wasty_api_client.dart';
import '../../components/verifyBTN.dart';
import 'sign_in_screen.dart';
import 'package:wasty/components/progress_indicator.dart';

DioClient client = DioClient();

class RegistrationScreen extends StatefulWidget{
  RegistrationScreen({super.key});

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


  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: bodyColor,
      body: SingleChildScrollView(
        child:
        Form(
          key: _formKey,
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

              const SizedBox(height: 20,),


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
                    textEditingController: email,
                    validator: (value){
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email address';
                      }

                      return null;
                    },
                    keyboardType: TextInputType.text),
              ),
              const SizedBox(height: 20,),
              Center(
                child: CustomInputField(
                    hintText: 'Password',
                    textEditingController: password,
                    validator: (value){
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Password';
                      }

                      return null;
                    },
                    keyboardType: TextInputType.text),
              ),
              const SizedBox(height: 20,),
              Center(
                child: CustomInputField(
                    hintText: 'Confirm password',
                    textEditingController: confirmPassword,
                    validator: (value){
                      if (value == null || value.isEmpty || value != password.text) {
                        return 'password do not match';
                      }

                      return null;
                    },
                    keyboardType: TextInputType.text),
              ),
              const SizedBox(height: 20,),

              SizedBox(height: 40,),
              Center(
                  child:

                  VerifyBTN(btn: 'Register', onTap: () async{

                    if (_formKey.currentState!.validate()){
                      progressIndicatorBuilder(context);
                      final result = await client.postRegistration(name.text,email.text,password.text);
                      Navigator.pop(context);
                      Get.to(LandingPage(),
                          duration: const Duration(seconds: 1),transition: Transition.native);
                    }
                  },),
              ),
              FooterButton(
                  question: 'Already have an account?',
                  buttonText: 'Log In',
                  object: SignInScreen(),
              )

            ],
          ),
        ),
      ) ,

    );
  }
}
