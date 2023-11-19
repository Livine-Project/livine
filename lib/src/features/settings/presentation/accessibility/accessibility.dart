import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:livine/src/features/contextmenu/domain/contextmenu.dart';

import '../../../../translations/domain/translation_provider.dart';
import '../../../navigation/data/navigation_notifier.dart';

class Accessibility extends ConsumerWidget {
  const Accessibility({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final swipeNavigation = ref.watch(navigationNotifierProvider);
    bool isSwipeNavigation = swipeNavigation == null ? true : false;
    bool checkCommand = ref.watch(contextMenuProvider).checkCommand();
    final word = TranslationRepo.translate(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            title: Text(word!.accessibility),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Visibility(
                  visible: Platform.isAndroid,
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
                Visibility(
                  visible: Platform.isWindows,
                  child: ListTile(
                    title: Text("Add \"Scan with Livine\""),
                    subtitle: Text(
                        "Adds \"Scan with Livine\" in context menu when right clicking an image , try right clicking an image, this will only work on Windows, you can delete it by turning off this option, you need to run Livine as administrator to add this option"),
                    trailing: Switch.adaptive(
                        value: checkCommand,
                        onChanged: (value) {
                          if (checkCommand) {
                            try {
                              ref.read(contextMenuProvider).deleteCommand();
                            } catch (e) {}
                          } else {
                            ref.read(contextMenuProvider).createCommand();
                          }
                        }),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
