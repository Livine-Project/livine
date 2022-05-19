// ignore_for_file: type_annotate_public_apis

import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../shared/styles/colors.dart';
import '../../models/auth/auth_classes.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../shared/styles/lib_color_schemes.g.dart';


final userIDProvider = StateProvider<int>((ref) => 0);

class Login extends ConsumerStatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {
  Client client = http.Client();
  final _username = TextEditingController();
  final _password = TextEditingController();

  bool _obscureText = true;
  bool isLoading = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<LoginResponse?> logintoDjango() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    const url = 'https://livine.pythonanywhere.com/api/login/';
    final response = await client.post(
      Uri.parse(url),
      body: {
        'username': _username.text,
        'password': _password.text,
      },
    );
    final responseJson = await json.decode(response.body);
    print(responseJson);
    final errorinLogin = responseJson['non_field_errors'];
    if (response.statusCode == 200) {
      final loginJson = LoginResponse.fromJson(
          Map<String, dynamic>.from(responseJson as Map<dynamic, dynamic>));
      if (loginJson.token!.isNotEmpty) {
        await prefs.setBool('username', true);
        int userloginID = responseJson['data']['user_id'];
        await prefs.setInt("userID", userloginID);
        // final userID = prefs.getInt("userID");
        ref.read(userIDProvider.state).state = userloginID;

        GoRouter.of(context).goNamed('OnBoarding');
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(errorinLogin is List ? errorinLogin.first : errorinLogin),
      ));
      setState(() {
        isLoading = false;
      });
    }
    return null;
  }

  validateForm() async {
    final form = _formKey.currentState!;
    if (form.validate()) {
      setState(() {
        isLoading = true;
      });
      logintoDjango();
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
                              borderSide: BorderSide(),
                            ),
                            labelText: 'Username',
                            labelStyle:
                                TextStyle(fontSize: 15, color: Colors.black),
                          ),
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
                                    : secondaryColor),
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                          labelText: 'Password',
                          labelStyle:
                              TextStyle(fontSize: 15, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, bottom: 5),
                //TODO: FORGOT YOUR PASSWORD
                child: Text(
                  'Forgot your password?',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Kine',
                    color: lightColorScheme.primary,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: MaterialButton(
                  onPressed: validateForm,
                  color: lightColorScheme.onTertiaryContainer,
                  elevation: 0,
                  minWidth: 350,
                  height: 60,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: isLoading
                      ? CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : Text(
                          'SIGN IN',
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Kine',
                              color: Colors.white),
                        ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an Account ?",
                        style: TextStyle(
                            fontFamily: 'Kine', fontWeight: FontWeight.w100),
                      ),
                      GestureDetector(
                        onTap: () => context.go('/register'),
                        child: Text(
                          'Sign Up'.toUpperCase(),
                          style: TextStyle(
                            fontSize: 15.0,
                            color: lightColorScheme.primary,
                            fontFamily: 'Kine',
                            fontWeight: FontWeight.bold,
                          ),
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
