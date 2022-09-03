import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../translations/locale_keys.g.dart';

class Languages extends StatelessWidget {
  const Languages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.Language.tr()),
      ),
      body: Column(children: const [
        LanguageCode(
          name: "English",
          langCode: "en",
          textAlign: Alignment.topLeft,
        ),
        LanguageCode(
          name: "العربية",
          langCode: "ar",
          textAlign: Alignment.topRight,
        ),
      ]),
    );
  }
}

class LanguageCode extends StatelessWidget {
  const LanguageCode({
    Key? key,
    required this.name,
    required this.langCode,
    required this.textAlign,
  }) : super(key: key);
  final String name, langCode;
  final AlignmentGeometry textAlign;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await context.setLocale(Locale(langCode));
      },
      child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Align(
            alignment: textAlign,
            child: Text(
              name,
              style: const TextStyle(fontSize: 18.0),
            ),
          )),
    );
  }
}
