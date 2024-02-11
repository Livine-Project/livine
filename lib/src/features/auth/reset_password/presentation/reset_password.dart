import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:livine/src/common_widgets/auth/auth_widget.dart';

import '../../../../constants/constants.dart';
import '../../../../translations/domain/translation_provider.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  Client client = http.Client();
  bool isLoading = false;

  void resetPassword() async {
    const url = '$restAPIURL/password_reset/';
    final response =
        await http.post(Uri.parse(url), body: {'email': _email.text});

    if (response.statusCode == 200) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Please check your email"),
      ));
      setState(() {
        isLoading = false;
      });
      context.go("/token_validate");
    } else {
      log("Error");
    }
  }

  void validateRPForm() {
    final form = _formKey.currentState!;
    if (form.validate()) {
      setState(() {
        isLoading = true;
      });
      resetPassword();
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
        title: Text(word?.reset_pass ?? "Reset Password"),
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
                          return "Please enter your email";
                        }

                        return null;
                      },
                      controller: _email,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        labelText: word?.email_address,
                        labelStyle: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    CustomButton(onPressed: validateRPForm, text: word!.reset_pass, context: context,isLoading: isLoading)

                  ],
                ),
              )),
        ],
      ),
    );
  }
}
