
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

class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  final PageController pageController = PageController();

  bool isLoaded = false;
  

  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      setState(() {
        isLoaded = true;

      });

    });
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

  @override
  Widget build(BuildContext context) {
   
    const duration = Duration(milliseconds: 500);
    const curve = Curves.easeInOut;
    return Scaffold(
      body: PageView.builder(
        controller: pageController,
        itemCount: _children.length,
        itemBuilder: (context, index) => _children[index],
      ),
      bottomNavigationBar: AnimatedBuilder(
        animation: pageController,
        builder: (context, snapshot) {
          if (!isLoaded || !pageController.hasClients) {
            return const SizedBox.shrink();
          }
          final _index = pageController.page!.round();
          return CurvedNavigationBar(
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
            index: _index,
            onTap: (index) {
              pageController.animateToPage(
                index,
                duration: duration,
                curve: curve,
              );
            },
          );
        },
      ),
    );
  }
}
