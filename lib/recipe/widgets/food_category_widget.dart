import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FoodCategory extends StatelessWidget {
  const FoodCategory({
    Key? key,
    required this.navigate,
    required this.image,
    required this.name,
    required this.color,
  }) : super(key: key);

  final String navigate;
  final String image;
  final String name;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(navigate),
      child: Container(
        width: 350,
        height: 120,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: CachedNetworkImageProvider(image),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(10.0),
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.grey[900]
              : color,
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaY: 0.05),
          child: Container(
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
            child: Text(
              name,
              style: TextStyle(
                  color: Color(0xfff80ed99),
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Kine'),
            ),
          ),
        ),
      ),
    );
  }
}
