import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter/material.dart';
import 'package:new_version/new_version.dart';

import '../../../main.dart';
import '../../../modules/categories/categories.dart';
import '../../../modules/content/content.dart';
import '../../../modules/home.dart';
import '../../../modules/pristine/pristine.dart';
import '../../../modules/profile/profile.dart';

class Navigation extends ConsumerStatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends ConsumerState<Navigation> {
  PageController pageController = PageController();
  final newVersion = NewVersion(androidId: "com.mazen.livine");

  void checkNewVersion() async {
    final status = await newVersion.getVersionStatus();
    if (status!.canUpdate && kReleaseMode) {
      newVersion.showUpdateDialog(
        context: context,
        versionStatus: status,
        dialogText: 'Please update the app to the latest version',
      );
    }
  }

  @override
  void initState() {
    super.initState();
    checkNewVersion();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  final List<Widget> _children = [
    Home(),
    Patient(),
    // Pristine(),
    Profile(),
  ];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(userTypeProvider);
    const duration = Duration(milliseconds: 300);
    const curve = Curves.easeInOut;
    if (userType.toString().isEmpty && data.isNotEmpty) {
      return ChooseContent();
    } else {
      return Scaffold(
        body: PageView(
          controller: pageController,
          onPageChanged: (page) {
            setState(() {
              index = page;
            });
          },
          children: _children,
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
              label: context.locale.languageCode == "en" ? "Home" : "الرئيسية",
            ),
            NavigationDestination(
                icon: Icon(Icons.fastfood_rounded, size: 30),
                label:
                    context.locale.languageCode == "en" ? "Meals" : "الوجبات"),
            // NavigationDestination(
            //     icon: Icon(Icons.star_rate_rounded, size: 30),
            //     label: "Pristine"),
            NavigationDestination(
                icon: Icon(Icons.person, size: 30),
                label: context.locale.languageCode == "en"
                    ? "Profile"
                    : "الحساب الشخصي")
          ],
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        ),
      );
    }
  }
}
