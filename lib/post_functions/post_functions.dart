import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wasty/screens/pages/landingPage.dart';
import '../screens/auth/sign_in_screen.dart';
import '../screens/pages/thanks.dart';
import '../utils/constants.dart';



Dio dio = Dio();

class AuthPostRequest {
  static registerUser(Map userInputs) async {
    EasyLoading.show(status: "Singing up...");
    try {
      //hitting endpoints and setting time out
      final response = await dio.post(PostURLs().postRegisterURL, data: userInputs);

      //---conditional statement
      if (response.statusCode == 201) {
        var data = response.data;

        // ... redirecting the user to the success page
        EasyLoading.showSuccess(data['message']);
        Get.to(const SignInScreen());
        EasyLoading.dismiss();
        return data;
      } else {
        EasyLoading.showError("Sorry something happened");
        EasyLoading.dismiss();
      }
    } catch (error) {
      EasyLoading.showError('$error');
    }
  }

  static loginUser(Map userLoginData) async {
    EasyLoading.show(status: "logging in");
    try {
      final response = await dio.post(PostURLs().loginPostURL, data: userLoginData);

      if (response.statusCode == 200) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('accessToken', response.data['accessToken']);
        prefs.setBool('isLoggedIn', true);
        Get.to(LandingPage());
        EasyLoading.dismiss();
        return response.data;
      }
    } on DioException catch (e) {
      if (e.response!.statusCode == 401) {
        EasyLoading.showError("wrong email or password");
      }
    } catch (error) {
      EasyLoading.showError('Please Check your internet Question');
    }
  }


  // User Post request function
  static request(Map<String, dynamic> requestData) async {
    // easy loading indicator
    EasyLoading.show();
    try {
      // getting shared preferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('accessToken');
      final header = 'Bearer $token';

      final requestResponse = await dio.post(
        PostURLs().requestPost,
        data: requestData,
        options: Options(
          headers: {'token': header, 'Content-Type': 'application/json'},
        ),
      );



      // Handle the response
      if (requestResponse.statusCode == 201) {

        EasyLoading.showSuccess(requestResponse.data['message']);

        Get.to(const ConfirmationPage(),
          duration: const Duration(seconds: 1),
          transition: Transition.native,
        );
        EasyLoading.dismiss();
        return requestResponse.data;
      } else {
        EasyLoading.showError('Request failed with status ${requestResponse.statusCode}');

      }
    } catch (error) {
      EasyLoading.showError('Error: $error');
    }
  }


  static Future<void> logout() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove('accessToken'); // Remove the access token

      // Navigate to the login page
      Get.offAll(const SignInScreen()); // Replace '/login' with your login page route
    } catch (error) {
      EasyLoading.showError('Error during logout: $error');
    }
  }

}
