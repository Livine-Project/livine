import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

Widget authButton({
  required void Function() onPressed,
  required bool isLoading,
  required String text,
  Color? color,
  Color? textColor,
  required BuildContext context,
}) {
  final theme = Theme.of(context).colorScheme;
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    child: MaterialButton(
      onPressed: onPressed,
      color: color ?? theme.primaryContainer,
      elevation: 0,
      minWidth: 350,
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
                  fontFamily: context.locale.languageCode == "en"
                    ? 'Kine'
                    : GoogleFonts.notoKufiArabic().fontFamily,
                  color: textColor ?? theme.onPrimaryContainer),
            ),
    ),
  );
}

Widget authFormField({
  required BuildContext context,
  required TextEditingController controller,
  required String text,
  required void Function(void Function()) setState,
  required String? Function(String?) validator,
  bool isPassword = false,
  required bool obscureText,
}) =>
    TextFormField(
      validator: validator,
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(
                  obscureText ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    obscureText = false;
                  });
                },
              )
            : null,
        labelText: text,
        labelStyle: const TextStyle(fontSize: 15),
      ),
    );

class AuthSecondaryButton extends StatelessWidget {
  const AuthSecondaryButton(
      {Key? key,
      required this.text,
      required this.goTo,
      this.color,
      this.textAlign})
      : super(key: key);
  final String text;
  final String goTo;
  final Color? color;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: () => context.push(goTo),
      child: Text(
        text,
        textAlign: textAlign ?? TextAlign.left,
        style: TextStyle(
          fontSize: 15.0,
          color: color ?? theme.primary,
          fontFamily: 'Kine',
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class TextwithTextButton extends StatelessWidget {
  const TextwithTextButton({
    Key? key,
    required this.firstText,
    required this.goTo,
    required this.secondText,
  }) : super(key: key);
  final String firstText, secondText, goTo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              firstText,
              style: const TextStyle(
                  fontFamily: 'Kine', fontWeight: FontWeight.w100),
            ),
            AuthSecondaryButton(
              goTo: goTo,
              text: secondText,
            ),
          ],
        ),
      ),
    );
  }
}

Widget authForm({
  required Key? formKey,
  required BuildContext context,
  required TextEditingController username,
  required TextEditingController password,
  required void Function(void Function()) setState,
  required String? Function(String?) userValidator,
  required String? Function(String?) passwordValidator,
  required String usernameText,
  required String passwordText,
  required bool obscureText,
  bool isLogin = true,
}) =>
    Form(
      key: formKey,
      child: Column(
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: authFormField(
                context: context,
                controller: username,
                text: usernameText,
                setState: setState,
                validator: userValidator,
                obscureText: false,
              )),
          authFormField(
              context: context,
              obscureText: obscureText,
              isPassword: true,
              controller: password,
              validator: passwordValidator,
              setState: setState,
              text: passwordText),
        ],
      ),
    );
