import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/custom_button.dart';
import '../constants.dart';
import 'request.dart';
import 'verify.dart';

class LandingPage extends StatefulWidget {
  @override
  State<LandingPage> createState() => _DashBordState();
}

class _DashBordState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: bodyColor,
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                'assets/images/boolaCar.png',
                fit: BoxFit.cover,
                //width: 100,
                //height: 100,
              ),
              Positioned(
                top: -15,
                left: -10,
                child: Image.asset(
                  'assets/images/shapes.png',
                  //width: 100,
                  height: 100,
                ),
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(height: size * 0.5),
              const Text(
                'Request for your waste \n to be taken',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF000000),
                ),
              ),
              SizedBox(height: size * 0.25),
              CustomButton(
                buttonName: 'Request',
                onPress: () {
                  // Navigate to the next screen
                  Get.to(const RequestPage(),
                      duration: const Duration(seconds: 1),
                      transition: Transition.native);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
