import 'package:flutter/material.dart';

import '../components/custom_button.dart';
import '../constants.dart';
import '../widgets/textfields_widgets.dart';
import 'verify.dart';

class RequestPage extends StatefulWidget {
  const RequestPage({super.key});

  @override
  State<RequestPage> createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _location = TextEditingController();
  final _landmark = TextEditingController();
  final _date = TextEditingController();
  final _phone = TextEditingController();
  //final _bins = TextEditingController();

  List<String> numberOfBins = [
    ' ',
    '1',
    '2',
    '3',
    '4',
    '5',
    'more',
  ];
  String? selectednumberOfBins = ' ';

  List<String> WasteType = [
    ' ',
    'Household Waste',
    'Recyclables',
    'Hazardous',
    'Organic Waste'
  ];
  String? selectedWasteType = ' ';

  List<String> serviceOption = [
    ' ',
    'One-time-picker',
    'Regular Pickup',
  ];
  String? selectedServiceOption = ' ';
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: bodyColor,
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
          Form(
            key: _formKey,
            child: Flexible(
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
                    

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Number of bins'),
                          Card(
                            elevation: 3,
                            child: DropdownButtonFormField<String>(
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: ' ',
                                contentPadding: EdgeInsets.zero,
                              ),
                              items:
                                  numberOfBins.map<DropdownMenuItem<String>>(
                                      (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                // Handle dropdown value changes here

                                selectednumberOfBins = newValue;
                              },
                              // Set an initial value if needed
                              value: selectednumberOfBins,
                            ),
                          ),
                        ],
                      ),
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
                              items:
                                  serviceOption.map<DropdownMenuItem<String>>(
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
                    CustomButton(
                      buttonName: 'NEXT',
                      widget: SubmitInformation(
                        arguments:
                        {
                         'name': _nameController.text.toString(),
                         'location': _location.text.toString(),
                         'landMark': _landmark.text.toString(),
                         'date': _date.text.toString(),
                         'phone': _phone.text.toString(),
                         'selectedWasteType': selectedWasteType.toString(),
                         'selectednumberOfBins': selectednumberOfBins.toString(),
                         'selectedServiceOption': selectedServiceOption.toString()
                      },
                      ), 
                      
                      
                    //   () {
                    // if (_formKey.currentState!.validate()) {


                    //   // Navigate to the next screen
                    //   Get.to(const SubmitInformation(),
                   
                      
                    //       duration: const Duration(seconds: 1),
                    //       transition: Transition.native);
                    // }
                    //   },
                    ),
                    SizedBox(
                      height: size * 0.03,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
