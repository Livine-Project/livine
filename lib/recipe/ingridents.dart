import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Ingridents extends StatelessWidget {
  const Ingridents({Key? key, required this.ingridentsRecipe}) : super(key: key);

  // ignore: type_annotate_public_apis
  final ingridentsRecipe;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).brightness == Brightness.dark ?Colors.grey[800] :Colors.blueAccent[700],
        leading: IconButton(icon: Icon(FontAwesomeIcons.arrowLeft),onPressed: () => Navigator.pop(context),),
        title: Text(
          "Ingridents"
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            ingridentsRecipe,
            style: TextStyle(fontSize: 20.0),
          ),
        ),
      ),
    );
  }
}
