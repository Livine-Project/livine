import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconsax/iconsax.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import '../../auth/data/user.dart';
import '../../content/presentation/content.dart';

import '../../../shared/children/children.dart';
import '../../../constants/shared_constants.dart';
import 'tablet_navigation.dart';

class Navigation extends ConsumerStatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  ConsumerState<Navigation> createState() => _NavigationState();
}

class _NavigationState extends ConsumerState<Navigation> {
  PageController pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  int index = 0;

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(userTypeProvider);
    const duration = Duration(milliseconds: 300);
    const curve = Curves.easeInOut;
    if (patientID.toString().isEmpty && data.toString().isNotEmpty) {
      return const ChooseContent();
    } else {
      return ResponsiveWrapper.of(context).isTablet ||
              ResponsiveWrapper.of(context).isDesktop
          ? const TabletNavigation()
          : Scaffold(
              body: PageView(
                controller: pageController,
                onPageChanged: (page) {
                  setState(() {
                    index = page;
                  });
                },
                children: children,
              ),
              bottomNavigationBar: NavigationBar(
                selectedIndex: index,
                onDestinationSelected: (int index) {
                  pageController.animateToPage(index,
                      duration: duration, curve: curve);
                },
                destinations: [
                  NavigationDestination(
                    icon: const Icon(Iconsax.home_11),
                    label: context.locale.languageCode == "en"
                        ? "Home"
                        : "الرئيسية",
                  ),
                  NavigationDestination(
                      icon: const Icon(FontAwesomeIcons.bowlFood),
                      label: context.locale.languageCode == "en"
                          ? "Meals"
                          : "الوجبات"),
                  NavigationDestination(
                      icon: const Icon(Iconsax.user_square),
                      label: context.locale.languageCode == "en"
                          ? "Profile"
                          : "الحساب الشخصي"),
                  NavigationDestination(
                      icon: const Icon(Iconsax.setting_2),
                      label: context.locale.languageCode == "en"
                          ? "Settings"
                          : "الاعدادات"),
                ],
                labelBehavior:
                    NavigationDestinationLabelBehavior.onlyShowSelected,
              ),
            );
    }
  }
}
