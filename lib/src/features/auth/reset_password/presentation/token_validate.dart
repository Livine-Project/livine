import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:livine/src/common_widgets/auth/auth_widget.dart';

import '../../../../constants/constants.dart';
import '../../../../translations/domain/translation_provider.dart';

class TokenValidate extends StatefulWidget {
  const TokenValidate({Key? key}) : super(key: key);

  @override
  State<TokenValidate> createState() => _TokenValidateState();
}

class _TokenValidateState extends State<TokenValidate> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _token = TextEditingController();
  Client client = http.Client();
  bool isLoading = false;

  void validateToken() async {
    const url = '$restAPIURL/password_reset/validate_token/';
    final response =
        await http.post(Uri.parse(url), body: {'token': _token.text});

    if (response.statusCode == 200) {
      setState(() {
        isLoading = false;
      });
      if (!mounted) return;
      context.go("/confirm_pass", extra: _token.text);
    } else {
      log("Error");
    }
  }

  void validateTokenForm() {
    final form = _formKey.currentState!;
    if (form.validate()) {
      validateToken();
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
        title: Text(word?.validate_token ?? "Validate Token"),
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
                        helperText: word?.enter_token_has_sent,
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        labelText: word?.code,
                        labelStyle: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    CustomButton(
                      onPressed: validateTokenForm,
                      text: word!.validate_token,
                      context: context,
                      isLoading: isLoading,
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
