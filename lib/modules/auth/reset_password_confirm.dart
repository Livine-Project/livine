import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import '../../shared/components/widgets/auth/auth_widget.dart';
import '../../shared/constants/constants.dart';
import '../../shared/styles/colors.dart';
import '../../translations/locale_keys.g.dart';

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
    final url = '$restAPIURL/password_reset/confirm/';
    final response = await http.post(Uri.parse(url),
        body: {'token': widget.token, 'password': _password.text});

    if (response.statusCode == 200) {
      print(response);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(context.locale.languageCode == "en"
            ? "Your password have succesfully changed"
            : "تم تغيير كلمة السر بنجاح"),
      ));
      setState(() {
        isLoading = false;
      });
      context.go("/login");
    } else {
      print("Error");
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
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.pass_confirm.tr()),
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
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        helperText: context.locale.languageCode == " en "
                            ? "Enter the token that has been sent to your email"
                            : " أدخل الرمز المميز الذي تم إرساله إلى بريدك الإلكتروني الخاص بك",
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                        labelText: context.locale.languageCode == "en"
                            ? 'Token'
                            : "الرمز",
                        labelStyle: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      validator: (e) {
                        if (e!.isEmpty) {
                          return context.locale.languageCode == "en"
                              ? "Please enter your new password"
                              : "من فضلك ادخل كلمة السر الجديدة";
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
                              color:
                                  _obscureText ? Colors.grey : secondaryColor),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                        labelText: context.locale.languageCode == "en"
                            ? 'New Password'
                            : "كلمة المرور الجديدة",
                        labelStyle: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    AuthButton(
                        validateForm: validatePasswordForm,
                        isLoading: isLoading,
                        text: LocaleKeys.change_password.tr(),
                        context: context)
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
