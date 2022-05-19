import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../translations/locale_keys.g.dart';

class Ingridents extends StatelessWidget {
  const Ingridents({Key? key, required this.ingridentsRecipe}) : super(key: key);

  // ignore: type_annotate_public_apis
  final ingridentsRecipe;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(icon: Icon(
          context.locale.languageCode == "en"
          ?FontAwesomeIcons.arrowLeft
          : FontAwesomeIcons.arrowRight
          ),
          onPressed: () => Navigator.pop(context),),
        title: Text(
          LocaleKeys.Ingridents.tr().toString(),
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
