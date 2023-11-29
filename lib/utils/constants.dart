import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


// shared preference
class Constants {
  static SharedPreferences? prefs;

}


// app colors
const Color bodyColor = Color(0xFFFFFFFF);
const Color buttonColor = Color(0xFF37B943);
const Color buttonTextColor = Color(0xFFFFFFFF);
const Color formFieldColor = Color(0xFFEEEEEE);
const Color formFieldHintColor = Color(0xFF858585);
const Color formFieldTextColor = Color(0xFF000000);
const Color textColor = Color(0xFF000000);
const Color txtColor = Color(0xFF000000);
const Color emphasisTextColor = Color(0xFF00E0FF);


// post endpoints
class PostURLs{
  String postRegisterURL =
      "https://hackathon-waste-api.onrender.com/api/v1/auth/register";

  String loginPostURL =
      "https://hackathon-waste-api.onrender.com/api/v1/auth/login";

  String requestPost =
      "https://hackathon-waste-api.onrender.com/api/v1/waste-request/add";
}


 
// app styles
 class AppStyle {
  static const  headerText = TextStyle(
      fontSize: 30,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w900,
      color: textColor);

      static const  headerText2 = TextStyle(
      fontSize: 15,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w700,
      color: textColor);

      static const  bodyText = TextStyle(
      fontSize: 15,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
      color: formFieldHintColor);
 }