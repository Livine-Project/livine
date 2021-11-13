import 'dart:convert';

import 'package:app/auth/auth_classes.dart';
import 'package:app/intro/boarding.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _username = TextEditingController();
  final _password = TextEditingController();
  Client client = http.Client();

  Future<LoginResponse> logintoDjango() async {
    final url = 'https://livine.pythonanywhere.com/api/login/';
    var response = await client.post(Uri.parse(url), body: {
      'username': '${_username.text}',
      'password': '${_password.text}',
    });

    if (response.statusCode == 200) {
      var loginJson = LoginResponse.fromJson(json.decode(response.body));
      if (loginJson.token.isNotEmpty) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext ctx) => OnBoarding()));
      } else {
        print("Sorry");
      }
    }
    return null;
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  validateForm() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final form = _formKey.currentState;
    if (form.validate()) {
      logintoDjango();
      prefs.setBool('username', true);

    } else {
      debugPrint('form is invalid');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('images/login/login-min.jpg'),
        fit: BoxFit.cover,
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
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
                              if (u.isEmpty) {
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
                                    borderSide:
                                        BorderSide(color: Color(0xfff3F37C9))),
                                labelText: 'Username',
                                labelStyle: TextStyle(
                                    fontSize: 15, color: Color(0xfff3F37C9))),
                          ),
                        ),
                        TextFormField(
                          textInputAction: TextInputAction.go,
                          validator: (p) {
                            if (p.length < 6 && p.isNotEmpty) {
                              return "Password needs to be atleast 6 characters ";
                            } else if (p.isEmpty) {
                              return "Please enter your password ";
                            }
                            return null;
                          },
                          controller: _password,
                          obscureText: true,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xfff3F37C9))),
                              labelText: 'Password',
                              labelStyle: TextStyle(
                                  fontSize: 15, color: Color(0xfff3F37C9))),
                        )
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
                        color: Color(0xfff3F37C9)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: MaterialButton(
                    onPressed: validateForm,
                    child: Text(
                      'SIGN IN',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    color: Color(0xfff3F37C9),
                    elevation: 0,
                    minWidth: 350,
                    height: 60,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
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
                          onTap: () =>
                              Navigator.pushNamed(context, '/register'),
                          child: Text(
                            'Sign Up'.toUpperCase(),
                            style: TextStyle(
                                fontSize: 15.0,
                                color: Color(0xfff3F37C9),
                                fontWeight: FontWeight.bold),
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
      ),
    );
  }
}
