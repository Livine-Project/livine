import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter/material.dart';
import 'package:new_version/new_version.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import '../../../main.dart';
import '../../../models/user/user.dart';
import '../../../modules/content/content.dart';

import '../misc/children.dart';
import 'tablet_navigation.dart';

class Navigation extends ConsumerStatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends ConsumerState<Navigation> {
  PageController pageController = PageController();
  final newVersion = NewVersion();

  Future<void> checkNewVersion() async {
    final status = await newVersion.getVersionStatus();
    if (status == status?.canUpdate) {
      newVersion.showUpdateDialog(
          context: context,
          versionStatus: status!,
          allowDismissal: false,
          dialogTitle: "Update",
          dialogText:
              "Please update the app from ${status.localVersion} to ${status.storeVersion}");
    }
  }

  @override
  void initState() {
    super.initState();
    // checkNewVersion();
  }

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
    if (userType.toString().isEmpty && data.isNotEmpty) {
      return ChooseContent();
    } else {
      return ResponsiveWrapper.of(context).isTablet ||
              ResponsiveWrapper.of(context).isDesktop
          ? TabletNavigation()
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
                    icon: Icon(Icons.home, size: 30),
                    label: context.locale.languageCode == "en"
                        ? "Home"
                        : "الرئيسية",
                  ),
                  NavigationDestination(
                      icon: Icon(Icons.fastfood_rounded, size: 30),
                      label: context.locale.languageCode == "en"
                          ? "Meals"
                          : "الوجبات"),
                  //TODO:PRISTINE PREMIUM LIVINE
                  // NavigationDestination(
                  //     icon: Icon(Icons.star_rate_rounded, size: 30),
                  //     label: context.locale.languageCode == "en"
                  //         ? "Pristine"
                  //         : "الاصلي"),
                  NavigationDestination(
                      icon: Icon(Icons.person, size: 30),
                      label: context.locale.languageCode == "en"
                          ? "Profile"
                          : "الحساب الشخصي")
                ],
                labelBehavior:
                    NavigationDestinationLabelBehavior.onlyShowSelected,
              ),
            );
    }
  }
}
