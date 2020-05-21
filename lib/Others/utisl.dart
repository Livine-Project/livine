import 'package:flutter/material.dart';

const mainBgColor = Colors.white;
const darkColor = Colors.blueAccent;
const midColor = Colors.cyan;
const lightColor = Colors.greenAccent;
const darkRedColor = Colors.cyan;
const lightRedColor = Color(0xFFFD685A);

const purpleGradient = LinearGradient(
  colors: <Color>[darkColor, midColor, lightColor],
  stops: [0.0, 0.5, 1.0],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);

const redGradient = LinearGradient(
  colors: <Color>[darkRedColor, lightRedColor],
  stops: [0.0, 1.0],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);

