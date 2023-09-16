import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../translations/domain/translation_provider.dart';
import '../../../navigation/data/navigation_notifier.dart';

class Accessibility extends ConsumerWidget {
  const Accessibility({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final swipeNavigation = ref.watch(navigationNotifierProvider);
    bool isSwipeNavigation = swipeNavigation == null ? true : false;
    final word = TranslationRepo.translate(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            title: Text(word!.accessibility),
          ),
          SliverToBoxAdapter(
            child: ListTile(
              title: Text(word.swipe_screen),
              trailing: Switch.adaptive(
                  value: isSwipeNavigation,
                  onChanged: (value) {
                    ref
                        .read(navigationNotifierProvider.notifier)
                        .togglePhysics(value);
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
