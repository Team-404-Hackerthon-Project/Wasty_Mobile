import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../screens/auth/sign_in_screen.dart';


class DioClient {
  Dio dio = Dio();

  postRegistration(String username, String email, String password) async {
    try {
      print('function attempting to run');
      final response = await dio.post(
        'https://hackathon-waste-api.onrender.com/api/v1/auth/register',
        data: {
          'username': username,
          'email': email,
          'password': password,
          'appType': 'app2'
        },
      );

      if (response.statusCode == 200) {
        Get.to(SignInScreen(),
            duration: const Duration(seconds: 1),transition: Transition.native);
        return response.data;
      }
    } catch (e) {
      print('function failed');
      print('Error: $e');
    }
  }

  postLogIn(String email, String password) async {
    try {
      final response = await dio.post(
        'https://hackathon-waste-api.onrender.com/api/v1/auth/login',
        data: {'email': email, 'password': password, 'appType': 'app2'},

        // options: Options(contentType: Headers.jsonContentType,
        //     headers: {'Content-Type':'application/json','Accept':'application/json'})
      );

      if (response.statusCode == 200) {
        print(response.data['accessToken']);
        return(response.data);
      }
    } catch (e) {
      // Display error message to the user using fluttertoast
      // Fluttertoast.showToast(
      //   msg: 'Registration failed. Please try again.',
      //   toastLength: Toast.LENGTH_SHORT,
      //   gravity: ToastGravity.BOTTOM,
      //   backgroundColor: Colors.red,
      //   textColor: Colors.white,
      // );
      print('Error: $e');
    }
  }
}