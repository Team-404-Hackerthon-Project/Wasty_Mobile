import 'package:dio/dio.dart';


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
        print(response.data);
        return response.data;
      }
    } catch (e) {
      print('function failed');
      print('Error: $e');
    }
  }

  postLogIn(String email, String password) async {
    try {
      print(email);
      print(password);
      final response = await dio.post(
        'https://hackathon-waste-api.onrender.com/api/v1/auth/login',
        data: {'email': email, 'password': password, 'appType': 'app2'},
      );

      if (response.statusCode == 200) {
        print(response.data);
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}