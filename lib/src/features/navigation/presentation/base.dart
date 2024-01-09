// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:flutter/scheduler.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:livine/src/constants/constants.dart';
import 'package:livine/src/features/navigation/presentation/tablet_navigation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../shared/children/children.dart';
import '../../../translations/domain/translation_provider.dart';
import '../../settings/presentation/check_update/check_update.dart';
import '../data/navigation_notifier.dart';

class Navigation extends StatefulHookConsumerWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  ConsumerState<Navigation> createState() => _NavigationState();
}

class _NavigationState extends ConsumerState<Navigation> {
  Future<void> checkUpdate() async {
    if (dotenv.env["UPDATE"] == "false") return;
    final status = await ref.read(checkUpdateProvider).checkIfUpdateAvailable();
    if (status == UpdateAvailableState.updateAvailable) {
      showDialog(
          context: context,
          builder: (context) => new AlertDialog(
                title: Text('Update available'),
                content: Text('An update is available for Livine'),
                actions: [
                  TextButton(
                      onPressed: () {
                        context.pop();
                        ref.watch(checkUpdateProvider).downloadUpdates();
                      },
                      child: Text('Download')),
                  TextButton(
                      onPressed: () => context.pop(), child: Text('cancel'))
                ],
              ));
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) => checkUpdate());
  }

  @override
  Widget build(BuildContext context) {
    final index = useState(0);
    final pageController = usePageController();

    const duration = Duration(milliseconds: 300);
    const curve = Curves.easeInOut;
    final word = TranslationRepo.translate(context);
    return rh.isDesktop(context)
        ? TabletNavigation()
        : Scaffold(
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
                    icon: const Icon(Icons.calendar_month),
                    label: word!.planner),
                NavigationDestination(
                    icon: const Icon(Icons.person_rounded),
                    label: word.profile),
              ],
              labelBehavior:
                  NavigationDestinationLabelBehavior.onlyShowSelected,
            ),
          );
  }
}
