import 'package:flutter/material.dart';

import '../components/custom_button.dart';
import '../constants.dart';
import 'thanks.dart';

class SubmitInformation extends StatelessWidget {
  final Map<String,String> arguments;
  const SubmitInformation({Key? key, required this.arguments}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    //print(arguments['selectedServiceOption']);
    //final requestArguments = Get.arguments;
    double size = MediaQuery.of(context).size.width;

    //  String getArgument(String key) {
    //   return requestArguments[key] ?? ' ';
    // }

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
                    buildRow('Name:', arguments['name'].toString()),
                    SizedBox(
                      height: size * 0.05,
                    ),
                    buildRow('Location:', arguments['location'].toString()),
                    SizedBox(
                      height: size * 0.05,
                    ),
                    buildRow('Landmark:', arguments['landMark'].toString()),
                    SizedBox(
                      height: size * 0.05,
                    ),
                    buildRow('Date:', arguments['date'].toString()),
                    SizedBox(
                      height: size * 0.05,
                    ),
                    buildRow('Telephone:', arguments['phone'].toString()),
                    SizedBox(
                      height: size * 0.05,
                    ),
                    buildRow('Number of Bins:', arguments['selectedWasteType'].toString()),
                    SizedBox(
                      height: size * 0.05,
                    ),
                    buildRow('Service Option:', arguments['selectednumberOfBins'].toString()),
                    SizedBox(
                      height: size * 0.05,
                    ),
                    buildRow('Waste Type:', arguments['selectedServiceOption'].toString()),
                    SizedBox(
                      height: size * 0.05,
                    ),
                    const CustomButton(
                      buttonName: 'NEXT',
                      widget: ConfirmationPage(),
                    ),
                  ],
                ),
              ),
            
          ],
        ),
      ),
    );
  }
}
