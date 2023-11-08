import 'package:get/get.dart';

class AuthController extends GetxController {
  RxBool isLoggedIn = false.obs;

  void login() {
    // Perform your login logic here.
    // Set isLoggedIn to true when the user successfully logs in.
    isLoggedIn.value = true;
  }

  void logout() {
    // Perform your logout logic here.
    // Set isLoggedIn to false when the user logs out.
    isLoggedIn.value = false;
  }
}
