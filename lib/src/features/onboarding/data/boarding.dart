import 'package:flutter/material.dart';

class BoardingItem {
  final String title;
  final String description;
  final String image;
  final Color color;
  final Color imageColor;
  final String imageChangeColor;

  BoardingItem(
      {required this.title,
      required this.description,
      required this.image,
      required this.imageColor,
      required this.imageChangeColor,
      required this.color});
}
