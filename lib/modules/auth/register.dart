// ignore_for_file: always_declare_return_types, type_annotate_public_apis, prefer_typing_uninitialized_variables

import 'dart:convert';
import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import '../../shared/components/widgets/auth/auth_widget.dart';
import '../../shared/constants/constants.dart';
import '../../shared/styles/colors.dart';
import '../../translations/locale_keys.g.dart';

class Register extends ConsumerStatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  ConsumerState<Register> createState() => _RegisterState();
}

class _RegisterState extends ConsumerState<Register> {
  Client client = http.Client();
  final _username = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  var errorinEmail;
  var errorinUser;
  Future<void> registertoDjango() async {
    const url = '$restAPIURL/register/';
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

    log(errorinEmail);

    if (response.statusCode == 200) {
      if (!mounted) return;
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
    final theme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go("/login"),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.transparent,
        ),
        child: Padding(
          padding: const EdgeInsets.all(23),
          child: ListView(
            children: <Widget>[
              const SizedBox(
                height: 50,
              ),
              SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
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
                          decoration: InputDecoration(
                            errorText: errorinUser is List
                                ? errorinUser.first
                                : errorinUser,
                            errorMaxLines: 2,
                            border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            labelText: LocaleKeys.username.tr(),
                            labelStyle: const TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                        child: TextFormField(
                          textInputAction: TextInputAction.next,
                          validator: (e) {
                            if (e!.isEmpty) {
                              return context.locale.languageCode == "en"
                                  ? "Please enter your email"
                                  : "من فضلك ادخل البريد الاكتروني";
                            }

                            return null;
                          },
                          controller: _email,
                          decoration: InputDecoration(
                            errorText: errorinEmail,
                            border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            labelText: context.locale.languageCode == "en"
                                ? 'Email'
                                : "البريد الاكتروني",
                            labelStyle: const TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                      TextFormField(
                        validator: (passwordValue) {
                          if (passwordValue!.length < 6 &&
                              passwordValue.isNotEmpty) {
                            return context.locale.languageCode == "en"
                                ? "Password needs to be atleast 6 characters "
                                : "يجب أن تتكون كلمة المرور من 6 أحرف على الأقل";
                          } else if (passwordValue.isEmpty) {
                            return context.locale.languageCode == "en"
                                ? "Please enter your password "
                                : "من فضلك أدخل كلمة السر";
                          }
                          return null;
                        },
                        controller: _password,
                        obscureText: _obscureText,
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
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          labelText: LocaleKeys.password.tr(),
                          labelStyle: const TextStyle(fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              authButton(
                  validateForm: validateForm,
                  isLoading: isLoading,
                  text: LocaleKeys.Sign_up.tr(),
                  context: context),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        LocaleKeys.have_an_account.tr(),
                        style: const TextStyle(fontFamily: 'Kine'),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () => context.go('/login'),
                        child: Text(
                          LocaleKeys.Sign_in.tr(),
                          style: TextStyle(
                              fontSize: 16.0,
                              color: theme.tertiary,
                              fontFamily: 'Kine'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: <InlineSpan>[
                    TextSpan(
                        text: LocaleKeys.terms1.tr(),
                        style: TextStyle(
                            fontSize: 15.0, color: theme.inverseSurface)),
                    const WidgetSpan(
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.0),
                      ),
                    ),
                    TextSpan(
                        text: LocaleKeys.terms2.tr(),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => context.push('/terms'),
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Kine',
                            color: theme.tertiary)),
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
