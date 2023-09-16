import 'package:flutter/material.dart';

import '../../../translations/domain/translation_provider.dart';

class Ingridents extends StatelessWidget {
  const Ingridents({Key? key, required this.ingridentsRecipe})
      : super(key: key);

  // ignore: type_annotate_public_apis
  final dynamic ingridentsRecipe;

  @override
  Widget build(BuildContext context) {
    final word = TranslationRepo.translate(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.west),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          word?.ingridents ?? "",
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            ingridentsRecipe,
            style: const TextStyle(fontSize: 20.0),
          ),
        ),
      ),
    );
  }
}
