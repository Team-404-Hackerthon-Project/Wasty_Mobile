import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/Buttons/BTN.dart';
import '../../utils/constants.dart';
import '../../components/Textfields/request_textfields.dart';
import 'verify.dart';

class RequestPage extends StatefulWidget {
  const RequestPage({Key? key}) : super(key: key);

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

  List<String> numberOfBins = ['Select bins', '1', '2', '3', '4', '5', 'more'];
  String? selectednumberOfBins = 'Select bins';

  List<String> wasteType = [
    'Select wast type',
    'Household Waste',
    'Recyclables',
    'Hazardous',
    'Organic Waste'
  ];
  String? selectedWasteType = 'Select wast type';

  List<String> serviceOption = ['Select service option', 'One-time-picker', 'Regular Pickup'];
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
                            backgroundImage: AssetImage('assets/images/person.png'),
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
                      validator: (value) => value?.isEmpty ?? true ? 'Enter your Name' : null,
                      cardName: 'Name', hint: 'Please enter your name',
                    ),
                    RequestTextField(
                      controller: _location,
                      keyboardType: TextInputType.text,
                      validator: (value) => value?.isEmpty ?? true ? 'Enter your Location' : null,
                      cardName: 'Location', hint: 'Enter location',
                    ),
                    RequestTextField(
                      controller: _landmark,
                      keyboardType: TextInputType.text,
                      validator: (value) => value?.isEmpty ?? true ? 'Enter your landmark' : null,
                      cardName: 'Landmark', hint: 'Please enter your landmark',
                    ),
                    RequestTextField(
                      controller: _date,
                      keyboardType: TextInputType.datetime,
                      iconData: Icons.calendar_today,
                      validator: (value) => value?.isEmpty ?? true ? 'Select a date' : null,
                      cardName: 'Date', hint: 'Please select a date',
                    ),
                    RequestTextField(
                      controller: _phone,
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Enter your contact';
                        } else if (value!.length != 10) {
                          return 'Number must be up to 10 digits';
                        }
                        return null;
                      },
                      cardName: 'Telephone', hint: 'Please enter your contact',
                    ),
                    _buildDropdown('Waste Type', wasteType, selectedWasteType),
                    _buildDropdown('Number of Bins', numberOfBins, selectednumberOfBins),
                    _buildDropdown('Service Option', serviceOption, selectedServiceOption),
                    MyBTN(
                      btn: 'Next',
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          Get.to(
                            const SubmitInformation(),
                            arguments: {
                              'name': _nameController.text,
                              'location': _location.text,
                              'landmark': _landmark.text,
                              'date': _date.text,
                              'telephone': _phone.text,
                              'waste-type': selectedWasteType,
                              'numberOfBins': selectednumberOfBins,
                              'service-option': selectedServiceOption,
                            },
                            duration: const Duration(seconds: 1),
                            transition: Transition.native,
                          );
                        }
                      },
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

  Widget _buildDropdown(String label, List<String> items, String? selectedValue) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label),
          Card(
            elevation: 3,
            child: DropdownButtonFormField<String>(
              decoration:  InputDecoration(
                border: InputBorder.none,
                hintText: 'Select $label',
                contentPadding: EdgeInsets.zero,
              ),
              items: items.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  switch (label) {
                    case 'Waste Type':
                      selectedWasteType = newValue;
                      break;
                    case 'Number of Bins':
                      selectednumberOfBins = newValue;
                      break;
                    case 'Service Option':
                      selectedServiceOption = newValue;
                      break;
                  }
                });
              },
              value: selectedValue,
            ),
          ),
        ],
      ),
    );
  }
}
