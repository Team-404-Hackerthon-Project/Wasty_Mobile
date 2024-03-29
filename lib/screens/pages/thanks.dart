import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wasty/screens/pages/landingPage.dart';


import '../../components/Buttons/custom_button.dart';
import '../../utils/constants.dart';

class ConfirmationPage extends StatelessWidget {
  const ConfirmationPage({super.key});

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
              image: AssetImage('assets/images/overlapping_circles.png'),
            ),
            SizedBox(
              height: size * 0.1,
            ),
            Column(
              children: [
                const Center(
                  child: Image(
                    image: AssetImage('assets/images/rejoys.png'),
                  ),
                ),
                SizedBox(
                  height: size * 0.25,
                ),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: size * 0.05),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(80.0),
                      child: const Card(
                        elevation: 10,
                        color: Colors.white,
                        child: Center(
                            child: Text(
                          'Your messaged has been sent successfully!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF474A56),
                          ),
                        )),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size * 0.3,
                ),
                CustomButton(
                  buttonName: '< Done',
                   onTap: () {Get.to(LandingPage());  },
                ),
                SizedBox(
                  height: size * 0.1,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
