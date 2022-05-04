import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_version/new_version.dart';

import '../Others/colors.dart';
import '../main.dart';
import '../pages/categories.dart';
import '../pages/content/content.dart';
import '../pages/home.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../user/profile.dart';
import '../pristine/pristine.dart';

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
    Pristine(),
    Profile(),
  ];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(userTypeProvider);
    const duration = Duration(milliseconds: 300);
    const curve = Curves.easeInOut;
    return userType.toString().isEmpty && data.isNotEmpty? ChooseContent(): Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: (page) {
          setState(() {
            index = page;
          });
        },
        children: _children,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        height: 60,
        color: Theme.of(context).brightness == Brightness.dark
            ? (Colors.grey[800])!
            : Color.fromRGBO(255, 255, 255, 1),
        // ignore: use_full_hex_values_for_flutter_colors
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? (Colors.grey[900])!
            : primaryColor,
        items: const [
          Icon(Icons.home, size: 30),
          Icon(FontAwesomeIcons.heartbeat, size: 30),
          Icon(Icons.star_rate_rounded, size: 30),
          Icon(Icons.person, size: 30),
        ],
        animationDuration: duration,
        animationCurve: curve,
        index: index,
        onTap: (index) {
          pageController.animateToPage(index, duration: duration, curve: curve);
        },
      ),
    );
  }
}
