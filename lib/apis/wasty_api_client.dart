import 'package:flutter/material.dart';
import 'package:async/async.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


 // Uri.parse('https://hackathon-waste-api.onrender.com/api/v1/auth/register');
  //final response = await http.post();


class AuthAPI {
  String Url = 'https://hackathon-waste-api.onrender.com/api/v1';
  var result;


  register(String name, String email, String password)
    async{

      var body = jsonEncode({
        "username": "Baffour",
        "email":"baffourthe3rd@gmail.com",
        "password":'happyIs@88',
        "appType":"app2"
      });

      // var body = jsonEncode({
      //   "username": name,
      //   "email":email,
      //   "password":password,
      //   "appType":"app2"
      // });


      final response =  await http.post(
        Uri.parse('$Url/auth/register'),
        headers: <String,String>{'Content-Type': 'application/json; charset=UTF-8'},
        body: body
      );

      if(response.statusCode == 200 ){
        print('it completed');
        return result = jsonDecode(response.body);
      }


    }

  Future login(String email, String password)
  async{

    var body = jsonEncode({
      "email": email,
      "password":password,
      "appType": "app2"
    });


    final response =  await http.post(
        Uri.parse('$Url/auth/register'),
        headers: <String,String>{'Content-Type': 'application/json; charset=UTF-8'},
        body: body
    );

    if(response.statusCode == 200 ){
      result = jsonDecode(response.body);
    }

    else{
      return result = 'please try again';
    }

  }
}
