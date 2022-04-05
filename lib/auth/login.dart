// ignore_for_file: type_annotate_public_apis

import 'dart:convert';

import 'package:go_router/go_router.dart';

import 'auth_classes.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _username = TextEditingController();
  final _password = TextEditingController();
  Client client = http.Client();

  Future<LoginResponse?> logintoDjango() async {
    const url = 'https://livine.pythonanywhere.com/api/login/';
    final response = await client.post(Uri.parse(url), body: {
      'username': _username.text,
      'password': _password.text,
    },
    );
    final responseJson = json.decode(response.body);

    if (response.statusCode == 200) {
      final loginJson = LoginResponse.fromJson(Map<String,dynamic>.from(responseJson as Map<dynamic,dynamic>));
      if (loginJson.token!.isNotEmpty) {
        // ignore: use_build_context_synchronously
        // Navigator.pushReplacement(context,
        //     MaterialPageRoute(builder: (BuildContext ctx) => const OnBoarding()),);
        context.goNamed("OnBoarding");
      }
    }
    return null;
  }

  bool _obscureText = true;
  bool isLoading = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  validateForm() async {

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final form = _formKey.currentState!;
    if (form.validate()) {
      setState(() {
        isLoading = true;
      });
      logintoDjango();
      prefs.setBool('username', true);
    } else {
      debugPrint('form is invalid');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/icon/logo.png'),
            alignment: Alignment.topCenter,
          ),
          borderRadius: BorderRadius.circular(20),
          color: Colors.transparent,
        ),
        child: Padding(
          padding: EdgeInsets.all(23),
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 200,
              ),
              SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                        child: TextFormField(
                          textInputAction: TextInputAction.next,
                          validator: (u) {
                            if (u!.isEmpty) {
                              return "Please enter your username";
                            }
                            return null;
                          },
                          controller: _username,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(),),
                              labelText: 'Username',
                              labelStyle:
                                  TextStyle(fontSize: 15, color: Colors.black),),
                        ),
                      ),
                      TextFormField(
                        validator: (p) {
                          if (p!.length < 6 && p.isNotEmpty) {
                            return "Password needs to be atleast 6 characters ";
                          } else if (p.isEmpty) {
                            return "Please enter your password ";
                          }
                          return null;
                        },
                        controller: _password,
                        obscureText: _obscureText,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Icon(
                                  _obscureText
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: _obscureText
                                      ? Colors.grey
                                      : Colors.blueAccent[400],),
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                            ),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(),),
                            labelText: 'Password',
                            labelStyle:
                                TextStyle(fontSize: 15, color: Colors.black),),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, bottom: 5),
                child: Text(
                  'Forgot your password?',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent[400],),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: MaterialButton(
                  onPressed: validateForm,
                  color: Colors.blueAccent[400],
                  elevation: 0,
                  minWidth: 350,
                  height: 60,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),),
                  child: isLoading ? CircularProgressIndicator(
                    color: Colors.white,
                  )
                  : Text(
                    'SIGN IN',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an Account ?"),
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(context, '/register'),
                        child: Text(
                          'Sign Up'.toUpperCase(),
                          style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.blueAccent[400],
                              fontWeight: FontWeight.bold,),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
