import 'package:flutter/material.dart';
import 'package:wasty/constants.dart';
import 'package:wasty/components/custom_button.dart';
import 'package:wasty/screens/auth/registration_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;

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

            const Center(
              child: Text(
                  'Wasty',
                style: TextStyle(
                  fontSize: 35,
                ),
              ),
            ),
            SizedBox(height: size * 0.02),

            const Center(
              child: Image(
                  image: AssetImage(
                    'assets/images/lady_next_to_phone.png'
                  ),
              ),
            ),
            SizedBox(height: size * 0.1),



            const Center(child: Text('Manage your waste effectively!')),
            SizedBox(height: size * 0.1),



            const Center(child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 80, vertical: 40),
              child:
                Text(
                  maxLines: 4,
                  textAlign: TextAlign.center,
                    'Wasty is a waste management application. Here you\'ll be able to connect with your nearest vendors based on your location'),
            )),
            SizedBox(height: size * 0.1),

            Center(child: CustomButton(buttonName:'Get Started', widget: RegistrationScreen(),)),
          ],
        ),
      ) ,

    );
  }
}
