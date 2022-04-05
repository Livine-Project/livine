// ignore_for_file: type_annotate_public_apis

import 'misc.dart';
import 'package:flutter/material.dart';

class RecipeDetails extends StatelessWidget {
  const RecipeDetails({ Key? key, required this.id }) : super(key: key);

  final id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DetailsBody(id: id),
      
    );
  }
}
