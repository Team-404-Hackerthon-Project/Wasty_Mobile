import 'package:flutter/material.dart';

import 'widgets/textfields_widgets.dart';

class DashBord extends StatefulWidget {
  @override
  State<DashBord> createState() => _DashBordState();
}

class _DashBordState extends State<DashBord> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _location = TextEditingController();
  final _landmark = TextEditingController();
  final _date = TextEditingController();
  final _phone = TextEditingController();
  final _bins = TextEditingController();

  List<String> WasteType = [
    ' ',
    'Household Waste',
    'Recyclables(Paper, Plastics, etc)',
    'Hazardous (chemicals, batteries, etc)',
    'Organic Waste'
  ];
  String? selectedWasteType = ' ';

  List<String> ServiceOption = [
    ' ',
    'One-time-picker',
    'Regular Pickup',
  ];
  String? selectedServiceOption = ' ';
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: size * 0.05),
                  const Text(
                    'INFORMATION',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF474A56),
                    ),
                  ),
                  MyTextField(
                    controller: _nameController,
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Name';
                      }

                      return null;
                    },
                    cardName: 'Name',
                  ),
                  MyTextField(
                    controller: _location,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Location';
                      }

                      return null;
                    },
                    cardName: 'Location',
                  ),
                  MyTextField(
                    controller: _landmark,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your landmark';
                      }

                      return null;
                    },
                    cardName: 'Landmark',
                  ),
                  MyTextField(
                    controller: _date,
                    keyboardType: TextInputType.text,
                    iconData: Icons.calendar_today,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select a date';
                      }

                      return null;
                    },
                    cardName: 'Date',
                  ),
                  MyTextField(
                    controller: _phone,
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your contact';
                      }

                      return null;
                    },
                    cardName: 'Telephone',
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Waste Type'),
                        Card(
                          elevation: 3,
                          child: DropdownButtonFormField<String>(
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: ' ',
                              contentPadding: EdgeInsets.zero,
                            ),
                            items: WasteType.map<DropdownMenuItem<String>>(
                                (String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              // Handle dropdown value changes here

                              selectedWasteType = newValue;
                            },
                            // Set an initial value if needed
                            value: selectedWasteType,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MyTextField(
                    controller: _bins,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter number of Bins';
                      }
                      return null;
                    },
                    cardName: 'Number of Bins',
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Service  Option'),
                        Card(
                          elevation: 3,
                          child: DropdownButtonFormField<String>(
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: ' ',
                              contentPadding: EdgeInsets.zero,
                            ),
                            items: ServiceOption.map<DropdownMenuItem<String>>(
                                (String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              // Handle dropdown value changes here

                              selectedServiceOption = newValue;
                            },
                            // Set an initial value if needed
                            value: selectedServiceOption,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}