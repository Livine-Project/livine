import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../translations/locale_keys.g.dart';

class Languages extends StatelessWidget {
  const Languages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.Language.tr()),
        backgroundColor: Colors.black,
      ),
      body: Column(children: [
        LanguageCode(name: "English", langCode: "en"),
        LanguageCode(name: "العربية", langCode: "ar"),

      ]),
    );
  }
}

class LanguageCode extends StatelessWidget {
  const LanguageCode({
    Key? key,
    required this.name,
    required this.langCode,
  }) : super(key: key);
  final String name, langCode;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await context.setLocale(Locale(langCode));
      },
      child: Padding(
          padding: EdgeInsets.all(25.0),
          child: Text(
            name,
            style: TextStyle(fontSize: 18.0),
          )),
    );
  }
}
