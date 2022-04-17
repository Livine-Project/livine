
import 'package:flutter/material.dart';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class AuthService{
  Client client = http.Client();
  final username = TextEditingController();
  final password = TextEditingController();
  
  // Future<LoginResponse?> logintoDjango() async {
  //   const url = 'https://livine.pythonanywhere.com/api/login/';
  //   final response = await client.post(Uri.parse(url), body: {
  //     'username': username.text,
  //     'password': password.text,
  //   },
  //   );
  //   final responseJson = json.decode(response.body);

  //   if (response.statusCode == 200) {
  //     final loginJson = LoginResponse.fromJson(Map<String,dynamic>.from(responseJson as Map<dynamic,dynamic>));
  //     if (loginJson.token!.isNotEmpty) {
  //       // ignore: use_build_context_synchronously
  //       GoRouter.of(context).goNamed('OnBoarding');
  //     }
  //   }
  //   return null;
  // }
  

}