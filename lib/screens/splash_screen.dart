import 'package:flutter/material.dart';
import 'package:wasty/constants.dart';
import 'package:wasty/components/custom_button.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bodyColor,
      body:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Image(
            image: AssetImage(
                'assets/images/overlapping_circles.png'
            ),
          ),

          const Center(
            child: Text(
                'Wasty',
              style: TextStyle(
                fontSize: 35,
              ),
            ),
          ),

          const Center(
            child: Image(
                image: AssetImage(
                  'assets/images/lady_next_to_phone.png'
                ),
            ),
          ),

          const SizedBox(height: 20,),

          const Center(child: Text('Manage your waste effectively!')),

          const SizedBox(height: 20,),

          const Center(child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 80, vertical: 40),
            child:
              Text(
                maxLines: 4,
                textAlign: TextAlign.center,
                  'Wasty is a waste management application. Here you\'ll be able to connect with your nearest vendors based on your location'),
          )),
          const SizedBox(height: 30,),
          Center(child: CustomButton(buttonName:'Get Started', onPress: () {  },)),
        ],
      ) ,

    );
  }
}
