import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class RequestTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? Function(dynamic value)? validator;
  final TextInputType keyboardType;
  final String cardName;
  final IconData? iconData;
  final String hint;

  const RequestTextField({
    Key? key,
    required this.controller,
    required this.cardName,
    required this.hint,
    required this.keyboardType,
    this.validator,
    this.iconData,
  }) : super(key: key);

  @override
  _RequestTextFieldState createState() => _RequestTextFieldState();
}

class _RequestTextFieldState extends State<RequestTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.cardName),
          Card(
            color: Colors.white,
            elevation: 3,
            child: TextFormField(
              scrollPadding: const EdgeInsets.all(5),
              keyboardType: widget.keyboardType,
              controller: widget.controller,
              validator: widget.validator,
              cursorColor: const Color(0xFF00BD15),
              decoration: InputDecoration(
                hintText: widget.hint,
                fillColor: Colors.white,
                filled: true,
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF00BD15)),
                ),
                border: InputBorder.none,
                suffixIcon: widget.iconData != null
                    ? IconButton(
                  icon: Icon(widget.iconData, color: const Color(0xFF00BD15)),
                  onPressed: () => _selectDate(context),
                )
                    : null,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      setState(() {
        widget.controller.text = picked.toLocal().toString().split(' ')[0];
      });
    }
  }
}