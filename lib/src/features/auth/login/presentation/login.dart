// ignore_for_file: type_annotate_public_apis

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:livine/src/common_widgets/auth/auth_widget.dart';
import 'package:livine/src/common_widgets/text_with_font.dart';

import '../../../../constants/constants.dart';
import '../../../../translations/domain/translation_provider.dart';
import '../../application/auth_service.dart';

class Login extends ConsumerStatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  ConsumerState<Login> createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {
  Client client = http.Client();
  final _username = TextEditingController();
  final _password = TextEditingController();

  bool _obscureText = true;
  bool isLoading = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void validateLoginForm() {
    final form = _formKey.currentState!;
    if (form.validate()) {
      setState(() {
        isLoading = true;
      });
      ref
          .read(authHelperProvider)
          .logintoDjango(
              context, _username, _password, mounted, isLoading, setState)
          .then((value) => setState(() {
                isLoading = false;
              }));
    } else {
      debugPrint('form is invalid');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final word = TranslationRepo.translate(context);
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: rh.isDesktop(context)
            ? EdgeInsets.zero
            : EdgeInsets.only(top: rh.deviceHeight(context) * 0.005),
        child: Row(
          children: [
            Expanded(
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 50),
                    child: Column(
                      children: <Widget>[
                        TextWithFont(
                          text: "Login",
                          fontSize: 40.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: TextFormField(
                            textInputAction: TextInputAction.next,
                            validator: (u) {
                              if (u!.isEmpty) {
                                return "Please enter your username";
                              }
                              if (u.contains(" ")) {
                                return "No space allowed in username";
                              }
                              return null;
                            },
                            controller: _username,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0))),
                              labelText: word?.username ?? "Username",
                              labelStyle: const TextStyle(fontSize: 15),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: TextFormField(
                            validator: (p) {
                              if (p!.length < 6 && p.isNotEmpty) {
                                return "Password needs to be atleast 9 characters ";
                              } else if (p.isEmpty) {
                                return "Please enter your password ";
                              }
                              return null;
                            },
                            controller: _password,
                            obscureText: _obscureText,
                            onFieldSubmitted: (_) => validateLoginForm(),
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0))),
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
                              labelText: word?.password ?? "Password",
                              labelStyle: const TextStyle(fontSize: 15),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 5),
                          child: GestureDetector(
                            onTap: () => context.push('/reset_password'),
                            child: Text(
                              word?.forget_your_password ?? "Forgot Password?",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 15,
                                color: theme.tertiary,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomButton(
                            onPressed: validateLoginForm,
                            text: word!.sign_in,
                            context: context,
                            isLoading: isLoading),
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  word?.no_account ?? "No account yet?",
                                  style:
                                      const TextStyle(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                GestureDetector(
                                  onTap: () => context.push('/register'),
                                  child: Text(
                                    word.sign_up,
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      color: theme.tertiary,
                                      fontFamily: 'Kine',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: Platform.isWindows,
              child: Expanded(
                  flex: 2,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20)),
                    child: Image.asset(
                      'assets/images/windows/login.jpg',
                      fit: BoxFit.cover,
                    ),
                  )),
            ),
          ],
        ),
      ),
    ));
  }
}
