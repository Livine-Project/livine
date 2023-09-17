
import 'package:flutter/material.dart';

import '../../../translations/domain/translation_provider.dart';

class CheckUpdate extends StatelessWidget {
  const CheckUpdate({super.key});

  @override
  Widget build(BuildContext context) {
    final word = TranslationRepo.translate(context);
    return  Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            title: Text(word!.check_for_update ),
          ),
        ],
      ),
    );
  }
}