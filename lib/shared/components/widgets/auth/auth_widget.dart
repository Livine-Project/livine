import 'package:flutter/material.dart';


Widget AuthButton({
  required void Function() validateForm,
  required bool isLoading,
  required String text,
  Color? color,
  Color? textColor,
  required BuildContext context,
}) {
  final theme = Theme.of(context).colorScheme;
  return Padding(
    padding: EdgeInsets.only(top: 20),
    child: MaterialButton(
      onPressed: validateForm,
      color: color ?? theme.onTertiaryContainer,
      elevation: 0,
      minWidth: 350,
      height: 60,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: isLoading
          ? CircularProgressIndicator(
              color: Colors.white,
            )
          : Text(
              text,
              style: TextStyle(
                  fontSize: 15, fontFamily: 'Kine', color: textColor ?? Colors.white),
            ),
    ),
  );
}
