// ignore_for_file: always_declare_return_types, type_annotate_public_apis, prefer_typing_uninitialized_variables

import 'dart:convert';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:iconsax/iconsax.dart';
import 'package:livine/src/features/auth/application/auth_service.dart';

import '../../../../common_widgets/auth/auth_widget.dart';
import '../../../../translations/locale_keys.g.dart';

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

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Scaffold(
      body: Row(
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
                    'assets/images/windows/register.webp',
                    fit: BoxFit.cover,
                  ),
                )),
          ),
          Expanded(
            child: Form(
              key: _formKey,
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
                        labelText: LocaleKeys.username.tr(),
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
                          return context.locale.languageCode == "en"
                              ? "Please enter your email"
                              : "من فضلك ادخل البريد الاكتروني";
                        }

                        return null;
                      },
                      controller: _email,
                      decoration: InputDecoration(
                        errorText: emailError,
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
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      validator: (passwordValue) {
                        if (passwordValue!.length < 9 &&
                            passwordValue.isNotEmpty) {
                          return context.locale.languageCode == "en"
                              ? "Password needs to be atleast 9 characters "
                              : "يجب أن تتكون كلمة المرور من 9 أحرف على الأقل";
                        } else if (passwordValue.isEmpty) {
                          return context.locale.languageCode == "en"
                              ? "Please enter your password "
                              : "من فضلك أدخل كلمة السر";
                        }
                        return null;
                      },
                      controller: _password,
                      obscureText: _obscureText,
                      onFieldSubmitted: (_) => validateForm(),
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureText ? Iconsax.eye_slash5 : Iconsax.eye,
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
                        labelText: LocaleKeys.password.tr(),
                        labelStyle: const TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  authButton(
                      onPressed: validateForm,
                      isLoading: isLoading,
                      text: LocaleKeys.Sign_up.tr(),
                      context: context),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
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
        ],
      ),
    );
  }
}
