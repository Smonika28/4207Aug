import 'dart:convert';
import 'package:http/http.dart';
import 'package:dio/dio.dart';


void login(String email, password) async {
  try {
    final response = await post(
        Uri.parse('https://excellis.co.in/420-society-world//api/v1/forgot-password'),
        body: {
          'email': 'john@yopmail.com',

        });
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      print(data['token']);
      print('Login successfully');
    } else {
      print('failed');
    }
  } catch (e) {
    print(e.toString());
  }
}
