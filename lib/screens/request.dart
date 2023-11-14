import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/BTN.dart';
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
    'Select bins',
    '1',
    '2',
    '3',
    '4',
    '5',
    'more',
  ];
  String? selectednumberOfBins = 'Select bins';

  List<String> WasteType = [
    'Select wast type',
    'Household Waste',
    'Recyclables',
    'Hazardous',
    'Organic Waste'
  ];
  String? selectedWasteType = 'Select wast type';

  List<String> serviceOption = [
    'Select service option',
    'One-time-picker',
    'Regular Pickup',
  ];
  String? selectedServiceOption = 'Select service option';
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: bodyColor,
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: SingleChildScrollView(
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
                                'assets/images/person.png'), 
                          ),
                        ),
                        SizedBox(height: size * 0.02,),
                        const Text(
                          'Meet your vendor Bob',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                        SizedBox(height: size * 0.01,),
                        const Text(
                          'LOC: Takoradi',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                        SizedBox(height: size * 0.05),
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
                    RequestTextField(
                      controller: _nameController,
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter your Name';
                        }

                        return null;
                      },
                      cardName: 'Name', hint: 'Please enter your name',
                    ),
                    RequestTextField(
                      controller: _location,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter your Location';
                        }

                        return null;
                      },
                      cardName: 'Location', hint: 'Enter location',
                    ),
                    RequestTextField(
                      controller: _landmark,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter your landmark';
                        }

                        return null;
                      },
                      cardName: 'Landmark', hint: 'Please enter your landmark',
                    ),
                    RequestTextField(
                      controller: _date,
                      keyboardType: TextInputType.text,
                      iconData: Icons.calendar_today,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Select a date';
                        }

                        return null;
                      },
                      cardName: 'Date', hint: 'Please select a date',
                    ),
                    RequestTextField(
                      controller: _phone,
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter your contact';
                        }

                        return null;
                      },
                      cardName: 'Telephone', hint: 'Please enter your contact',
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
                                hintText: 'Select wast type',
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
                                hintText: 'Select bins',
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
                                hintText: 'Select service option',
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
                                
                                selectedServiceOption = newValue;
                              },
                              
                              value: selectedServiceOption,
                            ),
                          ),
                        ],
                      ),
                    ),

                    MyBTN(btn: 'Next', onTap: () {

                      if (_formKey.currentState!.validate()){
                        Get.to(const SubmitInformation(),
                            arguments: {
                              'name': _nameController.text.toString(),
                              'location': _location.text.toString(),
                              'landmark': _landmark.text.toString(),
                              'date': _date.text.toString(),
                              'telephone': _phone.text.toString(),
                              'waste-type': selectedWasteType.toString(),
                              'numberOfBins': selectednumberOfBins.toString(),
                              'service-option': selectedServiceOption.toString(),


                            },
                            duration: const Duration(seconds: 1),transition: Transition.native);
                      }

                    },),
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
