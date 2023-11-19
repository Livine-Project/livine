// ignore_for_file: type_annotate_public_apis

import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import '../../../../constants/constants.dart';
import '../../../../shared/cache/cache_helper.dart';
import '../../../../translations/domain/translation_provider.dart';
import '../../application/auth_service.dart';
import '../../data/user.dart';

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

  Future<void> validateGuest() async {
    CacheHelper.setBool('isGuest', true);
    CacheHelper.setBool('username', true);
    CacheHelper.remove("userID");
    ref.read(guestProvider.notifier).update((state) => true);
    if (!mounted) return;

    if (Platform.isAndroid || Platform.isIOS) {
      GoRouter.of(context).goNamed('OnBoarding');
    } else {
      GoRouter.of(context).go('/choose_content');
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
                : EdgeInsets.only(top: rh.deviceHeight(context) * 0.1),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
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
                                fontFamily: 'Kine',
                                color: theme.tertiary,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
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
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                            isLoading: isLoading,
                            text: word?.sign_in ?? "Sign In",
                            onPressed: validateLoginForm,
                            context: context),
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  word?.no_account ?? "No account yet?",
                                  style: const TextStyle(
                                      fontFamily: 'Kine',
                                      fontWeight: FontWeight.w100),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                GestureDetector(
                                  onTap: () => context.push('/register'),
                                  child: Text(
                                    word?.sign_up ?? "Sign Up",
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
