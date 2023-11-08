import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/custom_button.dart';

import '../constants.dart';
import 'thanks.dart';

class SubmitInformation extends StatelessWidget {
  const SubmitInformation({super.key});

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    final requstArguments = Get.arguments;

    final userName = requstArguments['name'] ?? ' ';
    final location = requstArguments['location'] ?? ' ';
    final landMark = requstArguments['landMark'] ?? ' ';
    final date = requstArguments['date'] ?? ' ';
    final phone = requstArguments['phone'] ?? ' ';
    final selectednumberOfBins = requstArguments['selectednumberOfBins'] ?? ' ';
    final selectedWasteType = requstArguments['selectedWasteType'] ?? ' ';
    final selectedServiceOption =
        requstArguments['selectedServiceOption'] ?? ' ';

    return Scaffold(
        backgroundColor: bodyColor,
        body: Column(
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
                        'Service Request Summery',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF000000),
                        ),
                      )),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'name:',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF000000),
                        ),
                      ),
                      Text(
                        userName,
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF474A56),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size * 0.05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Location:',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF000000),
                        ),
                      ),
                      Text(
                        location,
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF474A56),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size * 0.05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Landmark:',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF000000),
                        ),
                      ),
                      Text(
                        landMark,
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF474A56),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size * 0.05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Date:',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF000000),
                        ),
                      ),
                      Text(
                        date,
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF474A56),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size * 0.05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Telephone:',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF000000),
                        ),
                      ),
                      Text(
                        phone,
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF474A56),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size * 0.05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Number of Bins:',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF000000),
                        ),
                      ),
                      Text(
                        selectednumberOfBins,
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF474A56),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size * 0.05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Service Option:',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF000000),
                        ),
                      ),
                      Text(
                        selectedServiceOption.toString(),
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF474A56),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size * 0.05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Waste Type:',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF000000),
                        ),
                      ),
                      Text(
                        selectedWasteType.toString(),
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF474A56),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size * 0.05,
                  ),
                  CustomButton(
                    buttonName: 'NEXT',
                    widget: ConfirmationPage()
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
