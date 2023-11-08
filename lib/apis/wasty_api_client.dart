import 'package:dio/dio.dart';


class DioClient {
  Dio dio = Dio();

  postRegistration(String username, String email, String password) async {
    try {
      final response = await dio.post(
        'https://documenter.getpostman.com/view/25186838/2s9YXh52wu',
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
      print('Error: $e');
    }
  }

  postLogIn(String email, String password) async {
    try {
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