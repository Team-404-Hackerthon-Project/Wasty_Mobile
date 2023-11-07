// import 'package:flutter/material.dart';

// class FormTextField extends StatelessWidget {
//   final String cardName;
//   FormTextField(this.cardName, {super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Padding(
//       padding: EdgeInsets.all(10.0),
//       child: Card(
//         child: Column(
//           children: [
//             Text('Name'),
//             TextField(
//               decoration: InputDecoration(
//                 border: InputBorder.none,
//                 hintText: 'Name',
//                 contentPadding: EdgeInsets.all(10),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

class FormTextField extends StatelessWidget {
  final String cardName;
  

  FormTextField({required this.cardName});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(cardName,style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF000000),
                  ),),
          const Card(
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
