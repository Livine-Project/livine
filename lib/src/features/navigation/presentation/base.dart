import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconsax/iconsax.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../shared/children/children.dart';
import 'tablet_navigation.dart';

class Navigation extends HookWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final index = useState(0);
    final pageController = usePageController();

    const duration = Duration(milliseconds: 300);
    const curve = Curves.easeInOut;
    return ResponsiveWrapper.of(context).isTablet ||
            ResponsiveWrapper.of(context).isDesktop
        ? const TabletNavigation()
        : Scaffold(
            body: PageView(
              controller: pageController,
              onPageChanged: (page) => index.value = page,
              children: children,
            ),
            bottomNavigationBar: NavigationBar(
              selectedIndex: index.value,
              onDestinationSelected: (int index) {
                pageController.animateToPage(index,
                    duration: duration, curve: curve);
              },
              destinations: [
                NavigationDestination(
                  icon: const Icon(Iconsax.home_11),
                  label:
                      context.locale.languageCode == "en" ? "Home" : "الرئيسية",
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
