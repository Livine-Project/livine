import 'package:flutter/material.dart';
import 'package:livine/src/common_widgets/text_with_font.dart';

// class CustomButton extends StatelessWidget {
//   const CustomButton({super.key});
//
//   final void Function() onPressed;
//   final bool isLoading;
//   final String text;
//   final Color? color,textColor;
//   final double width = 350;
//   final Widget? icon;
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

Widget CustomButton({
  required void Function() onPressed,
  required String text,
  Color? color,
  Color? textColor,
  double width = 350,
  Widget? icon,
  bool isLoading = false,
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
      child: icon != null
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  text,
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Kine',
                      color: textColor ?? theme.onPrimaryContainer),
                ),
                icon
              ],
            )
          : isLoading
              ? CircularProgressIndicator()
              : TextWithFont(text: text),
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
