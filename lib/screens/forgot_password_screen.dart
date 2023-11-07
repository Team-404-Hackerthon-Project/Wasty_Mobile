import 'package:flutter/material.dart';
import 'package:wasty/constants.dart';
import 'package:wasty/components/custom_button.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

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
              'Wasty',
              style: TextStyle(
                fontSize: 35,
              ),
            ),
          ),

          Center(
            child: Image(
              image: AssetImage(
                  'assets/images/lady_next_to_phone.png'
              ),
            ),
          ),

          SizedBox(height: 20,),

          Center(child: Text('Manage your waste effectively!')),

          SizedBox(height: 20,),

          Center(child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 40),
            child:
            Text(
                maxLines: 4,
                textAlign: TextAlign.center,
                'Wasty is a waste management application. Here you\'ll be able to connect with your nearest vendors based on your location'),
          )),
          SizedBox(height: 30,),
          Center(child: CustomButton(buttonName:'Get Started')),
        ],
      ) ,

    );
  }
}
