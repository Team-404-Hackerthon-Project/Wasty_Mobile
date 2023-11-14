import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wasty/components/progress_indicator.dart';


import '../components/BTN.dart';
import '../constants.dart';
import 'thanks.dart';

class SubmitInformation extends StatelessWidget {
  const SubmitInformation({Key? key}) : super(key: key);

  void performWasteRequest() async {
    final dio = Dio();

    // Define the login endpoint and request data
    const String loginEndpoint = "https://hackathon-waste-api.onrender.com/api/v1/waste-request/add/";
    final Map<String, dynamic> loginData1 = {
        "username":Get.arguments['name'].toString(),
        "location":Get.arguments['location'].toString(),
        "landmark":Get.arguments['landmark'].toString(),
        "telephone":Get.arguments['telephone'].toString(),
        "date":Get.arguments['date'].toString(),
        "numberOfBins":int.parse(Get.arguments['numberOfBins']),
        "serviceOption":Get.arguments['service-option'].toString(),
        "wasteType":Get.arguments['waste-type'].toString(),
    };
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = await prefs.getString('accessToken');
    final header = 'Bearer $token';


    try {
      // Make a POST request to the login endpoint
      print(loginData1);
      print('============================');
      print('Request initiated');
      print('============================');
      final response = await dio.post(loginEndpoint, data: loginData1, options: Options(
          headers: {
            'token':header,
            'Content-Type':'application/json'
          }));

      // Handle the response
      if (response.statusCode == 200) {
        print(response.data);

        // Get.to(ConfirmationPage(),
        //     duration: const Duration(seconds: 1),transition: Transition.native);

      }
    } catch (error) {
      print("Error: $error");
    }
  }


  @override
  Widget build(BuildContext context) {
    final requestArguments = Get.arguments;
    double size = MediaQuery.of(context).size.width;

     String getArgument(String key) {
      return requestArguments[key] ?? ' ';
    }

    Widget buildRow(String label, String value) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Color(0xFF000000),
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Color(0xFF474A56),
            ),
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: bodyColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Image(
              image: AssetImage('assets/images/overlapping_circles.png'),
            ),
            const Center(
              child: Image(
                image: AssetImage('assets/images/verify.png'),
              ),
            ),
            SizedBox(
              height: size * 0.05,
            ),
            Center(
              child: SizedBox(
                height: 50,
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size * 0.05),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(80.0),
                    child: const Card(
                      color: Colors.white,
                      child: Center(
                        child: Text(
                          'Service Request Summary',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF000000),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  buildRow('Name:', getArgument('name').toString()),
                  SizedBox(
                    height: size * 0.05,
                  ),
                  buildRow('Location:', getArgument('location').toString()),
                  SizedBox(
                    height: size * 0.05,
                  ),
                  buildRow('Landmark:', getArgument('landmark').toString()),
                  SizedBox(
                    height: size * 0.05,
                  ),
                  buildRow('Date:', getArgument('date').toString()),
                  SizedBox(
                    height: size * 0.05,
                  ),
                  buildRow('Telephone:', getArgument('telephone').toString()),
                  SizedBox(
                    height: size * 0.05,
                  ),
                  buildRow('Number of Bins:', getArgument('numberOfBins').toString()),
                  SizedBox(
                    height: size * 0.05,
                  ),
                  buildRow('Service Option:', getArgument('service-option').toString().toString()),
                  SizedBox(
                    height: size * 0.05,
                  ),
                  buildRow('Waste Type:', getArgument('waste-type').toString()),
                  SizedBox(
                    height: size * 0.05,
                  ),
                  MyBTN(btn: 'Next', onTap: () async{
                    //progressIndicatorBuilder(context);
                    performWasteRequest();
                    //Navigator.pop(context);
                    Get.to(ConfirmationPage(),
                        duration: const Duration(seconds: 1),transition: Transition.native);



                  },),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
