import 'package:flutter/material.dart';

class Settings {
  String title;
  String subtitle;
  IconData icon;
  Function() onTap;

  Settings({
    required this.title,
    required this.icon,
    required this.subtitle,
    required this.onTap,
  });
}
