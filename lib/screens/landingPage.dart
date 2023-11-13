import 'package:flutter/material.dart';
import '../components/custom_button.dart';
import '../constants.dart';
import 'request.dart';
//import 'verify.dart';

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/images/boolaCar.png',
                  fit: BoxFit.cover,
                  
                ),
                Positioned(
                  top: -15,
                  left: -10,
                  child: Image.asset(
                    'assets/images/shapes.png',
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
                  style: AppStyle.headerText,
                ),
                SizedBox(height: size * 0.25),
                const CustomButton(
                  buttonName: 'Request',
                  widget: RequestPage(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
