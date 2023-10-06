// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../shared/children/children.dart';
import '../../../translations/domain/translation_provider.dart';
import '../data/navigation_notifier.dart';

class Navigation extends HookConsumerWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = useState(0);
    final pageController = usePageController();

    const duration = Duration(milliseconds: 300);
    const curve = Curves.easeInOut;
    final word = TranslationRepo.translate(context);
    return  Scaffold(
            body: PageView(
              controller: pageController,
              onPageChanged: (page) => index.value = page,
              children: children,
              physics: ref.watch(navigationNotifierProvider.notifier).state,
            ),
            bottomNavigationBar: NavigationBar(
              selectedIndex: index.value,
              onDestinationSelected: (int index) {
                pageController.animateToPage(index,
                    duration: duration, curve: curve);
              },
              destinations: [
                NavigationDestination(
                  icon: const Icon(Icons.home_rounded),
                  label: word?.home ?? '',
                ),
                NavigationDestination(
                    icon: const Icon(Icons.local_dining),
                    label: word?.meals ?? ''),
                NavigationDestination(
                    icon: const Icon(Icons.person_rounded),
                    label: word?.profile ?? ''),
              ],
              labelBehavior:
                  NavigationDestinationLabelBehavior.onlyShowSelected,
            ),
          );
  }
}
