// ignore_for_file: always_declare_return_types, type_annotate_public_apis

import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import '../../shared/styles/colors.dart';
import '../../shared/styles/lib_color_schemes.g.dart';
import '../../translations/locale_keys.g.dart';

class Register extends ConsumerStatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends ConsumerState<Register> {
  Client client = http.Client();
  final _username = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  var errorinEmail;
  var errorinUser;
  Future<void> registertoDjango() async {
    final url = 'https://livine.pythonanywhere.com/api/register/';
    final response = await client.post(
      Uri.parse(url),
      body: {
        'username': _username.text,
        'email': _email.text,
        'password': _password.text,
      },
    );

    final responseJson = json.decode(response.body);

    errorinEmail = responseJson['email'];

    errorinUser = responseJson['username'];

    if (response.statusCode == 200) {
      GoRouter.of(context).go('/Login');
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  bool isLoading = false;
  validateForm() {
    final form = _formKey.currentState!;
    if (form.validate()) {
      setState(() {
        isLoading = true;
      });
      registertoDjango();
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  bool _obscureText = true;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: ()=>context.go("/login"),
          
        ),
      ),
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
                height: 50,
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
                          maxLength: 20,
                          validator: (u) {
                            if (u!.isEmpty) {
                              return "Please enter your username";
                            } else if (u.length >= 20) {
                              return "Username shouldn't be more than 20 characters";
                            }
                            return null;
                          },
                          controller: _username,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            // errorText: errorinUser is List
                            //     ? errorinUser.first
                            //     : errorinUser,
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(),
                            ),
                            labelText: LocaleKeys.username.tr(),
                            labelStyle: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        validator: (e) {
                          if (e!.isEmpty) {
                            return context.locale.languageCode =="en" ? 
                             "Please enter your email" : "من فضلك ادخل البريد الاكتروني";
                          }

                          return null;
                        },
                        controller: _email,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                         
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                          labelText: context.locale.languageCode =="en" ?'Email' : "البريد الاكتروني",
                          labelStyle: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      TextFormField(
                        validator: (passwordValue) {
                          if (passwordValue!.length < 6 &&
                              passwordValue.isNotEmpty) {
                            return context.locale.languageCode == "en" ? 
                            "Password needs to be atleast 6 characters " : "يجب أن تتكون كلمة المرور من 6 أحرف على الأقل";

                          } else if (passwordValue.isEmpty) {
                            return context.locale.languageCode == "en" ? 
                            "Please enter your password " : "من فضلك أدخل كلمة السر";
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
                          labelText: LocaleKeys.password.tr(),
                          labelStyle:
                              TextStyle(fontSize: 15, color: Colors.black),
                        ),
                      ),
                      
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: MaterialButton(
                  onPressed: validateForm,
                  color: lightColorScheme.onPrimaryContainer,
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
                          LocaleKeys.Sign_up.tr(),
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
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
                        LocaleKeys.have_an_account.tr(),
                        style: TextStyle(fontFamily: 'Kine'),
                      ),
                      GestureDetector(
                        onTap: () => context.go('/login'),
                        child: Text(
                          LocaleKeys.Sign_in.tr().toUpperCase(),
                          style: TextStyle(
                              fontSize: 16.0,
                              color: lightColorScheme.primary,
                              fontFamily: 'Kine'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: LocaleKeys.terms1.tr(),
                        style: TextStyle(fontSize: 15.0, color: Colors.black)),
                    TextSpan(
                        text: LocaleKeys.terms2.tr(),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => context.push('/terms'),
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Kine',
                            color: lightColorScheme.primary)),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
