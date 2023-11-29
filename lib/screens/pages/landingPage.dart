import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wasty/screens/pages/request.dart';
import '../../components/Buttons/custom_button.dart';
import '../../post_functions/post_functions.dart';
import '../../utils/constants.dart';

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
                  textAlign: TextAlign.center,
                  'Request for your waste \n to be taken',
                  style: AppStyle.headerText,
                ),
                SizedBox(height: size * 0.25),
                 CustomButton(
                  buttonName: 'Request',
                   onTap: () { Get.to(const RequestPage()); },
                ),
                ElevatedButton(
                  onPressed: () async {
                    await AuthPostRequest.logout();
                  },
                  child: Text('Logout'),
                )

              ],
            ),
          ],
        ),
      ),
    );
  }
}
