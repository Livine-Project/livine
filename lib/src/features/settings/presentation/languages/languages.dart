import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../translations/domain/translation_provider.dart';

class Languages extends ConsumerWidget {
  const Languages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final word = TranslationRepo.translate(context);
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar.large(
          title: Text(word?.languages ?? ""),
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              LanguageCode(
                name: "English",
                locale: Locale("en"),
                textAlign: Alignment.topLeft,
              ),
              LanguageCode(
                name: "العربية",
                locale: Locale("ar"),
                textAlign: Alignment.topRight,
              ),
            ],
          ),
        )
      ],
    ));
  }
}

class LanguageCode extends StatelessWidget {
  const LanguageCode({
    Key? key,
    required this.name,
    required this.locale,
    required this.textAlign,
  }) : super(key: key);
  final String name;
  final Locale locale;
  final AlignmentGeometry textAlign;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return InkWell(
          onTap: () async {
            await ref.read(localeNotifierProvider.notifier).setLocale(locale);
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
      },
    );
  }
}
