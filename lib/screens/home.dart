import 'package:flutter/material.dart';

import '../widgets/textfields_widgets.dart';

class DashBord extends StatefulWidget {
  @override
  State<DashBord> createState() => _DashBordState();
}

class _DashBordState extends State<DashBord> {
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0xFF00BD15),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(15.0),
                      bottomLeft: Radius.circular(15.0),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: size * 0.2),
                      const Center(
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage(
                              'assets/images/person.png'), // Replace with your image asset
                        ),
                      ),
                      const Text(
                        'Meet your vendor Bob',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF474A56),
                        ),
                      ),
                      const Text(
                        'LOC: Takoradi',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF474A56),
                        ),
                      ),
                    ],
                  ),
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
          ),
           Flexible(
            flex: 2,
            child: Column(
              children: [
                const Text(
                  'INFORMATION',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF474A56),
                  ),
                ),
                Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FormTextField(cardName: 'Name',),
                        FormTextField(cardName: 'Location',),
                        FormTextField(cardName: 'Landmark',),
                        // FormTextField(cardName: 'Date',),
                        // FormTextField(cardName: 'TelePhone',),
                        // FormTextField(cardName: 'Waste Type',),
                        // FormTextField(cardName: 'Number of Bins',),
                        // FormTextField(cardName: 'Service Option',),
                        ],
                    )
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 15.0),
        ],
      ),
    );
  }
}
