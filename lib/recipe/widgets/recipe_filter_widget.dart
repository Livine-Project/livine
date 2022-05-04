import 'package:flutter/material.dart';

class CategoryFilter extends StatelessWidget {
  const CategoryFilter({
    Key? key,
    required this.name,
  }) : super(key: key);
  final name;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
        color: Color(0xFFF38A3A5),
      ),
      width: 100,
      height: 50,
      child: Center(
          child: Text(
        name,
        style:
            TextStyle(fontFamily: 'Kine', color: Colors.white, fontSize: 15.0),
      )),
    );
  }
}



