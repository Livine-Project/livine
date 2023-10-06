import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import '../../../../constants/constants.dart';
import '../../../../translations/domain/translation_provider.dart';

class PasswordConfirmation extends StatefulWidget {
  const PasswordConfirmation({Key? key, required this.token}) : super(key: key);
  final dynamic token;

  @override
  State<PasswordConfirmation> createState() => _PasswordConfirmationState();
}

class _PasswordConfirmationState extends State<PasswordConfirmation> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _token = TextEditingController();
  final _password = TextEditingController();
  Client client = http.Client();
  bool isLoading = false;
  bool _obscureText = true;

  @override
  void initState() {
    _token.text = widget.token;
    super.initState();
  }

  void resetPassword() async {
    const url = '$restAPIURL/password_reset/confirm/';
    final response = await http.post(Uri.parse(url),
        body: {'token': widget.token, 'password': _password.text});

    if (response.statusCode == 200) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Your password have succesfully changed")));
      setState(() {
        isLoading = false;
      });
      context.go("/login");
    } else {
      log("Error");
    }
  }

  void validatePasswordForm() {
    final form = _formKey.currentState!;
    if (form.validate()) {
      resetPassword();
      setState(() {
        isLoading = true;
      });
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final word = TranslationRepo.translate(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(word?.pass_confirm ?? ""),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      validator: (e) {
                        if (e!.isEmpty) {
                          return "Please enter your token";
                        }

                        return null;
                      },
                      controller: _token,
                      decoration: InputDecoration(
                        helperText:
                            "Enter the token that has been sent to your email",
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                        labelText: 'Token',
                        labelStyle: const TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      validator: (e) {
                        if (e!.isEmpty) {
                          return "Please enter your new password";
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
                              color: _obscureText ? Colors.grey : Colors.green),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        labelText: 'New Password',
                        labelStyle: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
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
                        onPressed: validatePasswordForm,
                        isLoading: isLoading,
                        text: word?.change_password ?? "",
                        context: context)
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
