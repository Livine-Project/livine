import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import '../../shared/components/widgets/auth/auth_widget.dart';
import '../../shared/constants/constants.dart';
import '../../translations/locale_keys.g.dart';

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
    final url = '$restAPIURL/password_reset/validate_token/';
    final response =
        await http.post(Uri.parse(url), body: {'token': _token.text});

    if (response.statusCode == 200) {
      print(response);

      setState(() {
        isLoading = false;
      });
      context.go("/confirm_pass", extra: _token.text);
    } else {
      print("Error");
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
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.enter_token.tr()),
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
                          return context.locale.languageCode == "en"
                              ? "Please enter your token"
                              : "من فضلك ادخل الرمز الخاص بك";
                        }

                        return null;
                      },
                      controller: _token,
                      
                      decoration: InputDecoration(
                        helperText: context.locale.languageCode == " en "
                            ? "Enter the token that has been sent to your email"
                            : " أدخل الرمز المميز الذي تم إرساله إلى بريدك الإلكتروني الخاص بك",
                       border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        labelText: context.locale.languageCode == "en"
                            ? 'Token'
                            : "الرمز",
                        labelStyle: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                    AuthButton(
                        validateForm: validateTokenForm,
                        isLoading: isLoading,
                        text: LocaleKeys.validate_token.tr(),
                        context: context)
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
