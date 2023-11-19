// ignore_for_file: always_declare_return_types, type_annotate_public_apis, prefer_typing_uninitialized_variables

import 'dart:convert';
import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import '../../../../constants/constants.dart';
import '../../../../translations/domain/translation_provider.dart';
import '../../application/auth_service.dart';

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

  var emailError;
  var usernameError;

  getErrors() {}

  bool isLoading = false;
  validateForm() async {
    final form = _formKey.currentState!;
    if (form.validate()) {
      setState(() {
        isLoading = true;
      });
      await ref
          .watch(authHelperProvider)
          .registertoDjango(context, _username, _email, _password, isLoading,
              mounted, setState)
          .then((value) {
        var decodedResponse = json.decode(value.toString());
        setState(() {
          emailError = decodedResponse['email'];
          usernameError = decodedResponse['username'];
          isLoading = false;
        });
      });
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  bool _obscureText = true;
  bool containsWhiteSpace(String username) {
    RegExp regex = RegExp(r'\s');
    return regex.hasMatch(username);
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final word = TranslationRepo.translate(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: rh.isDesktop(context)
              ? EdgeInsets.zero
              : EdgeInsets.only(top: rh.deviceHeight(context) * 0.1),
          child: Row(
            children: [
              Visibility(
                visible: Platform.isWindows,
                child: Expanded(
                    flex: 2,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      child: Image.asset(
                        'assets/images/windows/register.jpg',
                        fit: BoxFit.cover,
                      ),
                    )),
              ),
              Expanded(
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextFormField(
                            textInputAction: TextInputAction.next,
                            maxLength: 20,
                            validator: (u) {
                              if (u!.isEmpty) {
                                return "Please enter your username";
                              } else if (u.length >= 20) {
                                return "Username shouldn't be more than 20 characters";
                              } else if (containsWhiteSpace(u)) {
                                return "Username shouldn't contain spaces, use underscore instead";
                              }
                              return null;
                            },
                            controller: _username,
                            decoration: InputDecoration(
                              errorText: usernameError is List
                                  ? usernameError.first
                                  : usernameError,
                              errorMaxLines: 2,
                              border: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0))),
                              labelText: word?.username,
                              labelStyle: const TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextFormField(
                            textInputAction: TextInputAction.next,
                            validator: (e) {
                              if (e!.isEmpty) {
                                return "Please enter your email";
                              }

                              return null;
                            },
                            controller: _email,
                            decoration: InputDecoration(
                              errorText: emailError,
                              border: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0))),
                              labelText: word?.email_address,
                              labelStyle: const TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextFormField(
                            validator: (passwordValue) {
                              if (passwordValue!.length < 9 &&
                                  passwordValue.isNotEmpty) {
                                return "Password needs to be atleast 9 characters ";
                              } else if (passwordValue.isEmpty) {
                                return "Please enter your password ";
                              }
                              return null;
                            },
                            controller: _password,
                            obscureText: _obscureText,
                            onFieldSubmitted: (_) => validateForm(),
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscureText
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                              ),
                              border: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0))),
                              labelText: word?.password,
                              labelStyle: const TextStyle(fontSize: 15),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ({
                          required void Function() onPressed,
                          required bool isLoading,
                          required String text,
                          Color? color,
                          Color? textColor,
                          double width = 350,
                          required BuildContext context,
                        }) {
                          final theme = Theme.of(context).colorScheme;
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: MaterialButton(
                              onPressed: onPressed,
                              color: color ?? theme.primaryContainer,
                              elevation: 0,
                              minWidth: width,
                              height: 60,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: isLoading
                                  ? const CircularProgressIndicator(
                                      color: Colors.white,
                                    )
                                  : Text(
                                      text,
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: textColor ??
                                              theme.onPrimaryContainer),
                                    ),
                            ),
                          );
                        }(
                            onPressed: validateForm,
                            isLoading: isLoading,
                            text: word?.sign_up ?? 'Sign Up',
                            context: context),
                        const SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                word?.have_an_account ?? 'Have an account?',
                                style: const TextStyle(fontFamily: 'Kine'),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                onTap: () => context.push('/login'),
                                child: Text(
                                  word?.sign_in ?? 'Sign In',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: theme.tertiary,
                                      fontFamily: 'Kine'),
                                ),
                              ),
                            ],
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
                                  text: word?.terms1,
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      color: theme.inverseSurface)),
                              const WidgetSpan(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10.0),
                                ),
                              ),
                              TextSpan(
                                  text: word?.terms2,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
