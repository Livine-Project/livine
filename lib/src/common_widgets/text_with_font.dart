import 'package:flutter/material.dart';

class TextWithFont extends StatelessWidget {
  const TextWithFont({super.key,required this.text, this.fontSize});
  final String text;
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    return  Text(text,style: TextStyle(fontSize: fontSize,fontFamily: 'Kine'),);
  }
}
