import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../misc/children.dart';

class TabletNavigation extends StatefulWidget {
  const TabletNavigation({Key? key}) : super(key: key);

  @override
  State<TabletNavigation> createState() => _TabletNavigationState();
}

class _TabletNavigationState extends State<TabletNavigation> {
  int _selectedIndex = 0;
  bool isExtended = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: <Widget>[
            NavigationRail(
              selectedIndex: _selectedIndex,
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              extended: isExtended,
              leading: IconButton(
                onPressed: () {
                  setState(() {
                    isExtended = !isExtended;
                  });
                },
                icon: Icon(FontAwesomeIcons.bars),
              ),
              minExtendedWidth: 200,
              destinations: <NavigationRailDestination>[
                NavigationRailDestination(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  icon: Icon(Icons.home, size: 30),
                  label: context.locale.languageCode == "en"
                      ? Text("Home")
                      : Text("الرئيسية"),
                ),
                NavigationRailDestination(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  icon: Icon(Icons.fastfood_rounded, size: 30),
                  label: context.locale.languageCode == "en"
                      ? Text("Meals")
                      : Text("الوجبات"),
                ),
                // NavigationRailDestination(
                //     padding: EdgeInsets.symmetric(vertical: 20.0),
                //     icon: Icon(Icons.star_rate_rounded, size: 30),
                //     label: context.locale.languageCode == "en"
                //         ? Text("Pristine")
                //         : Text("الاصلي")),
                NavigationRailDestination(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    icon: Icon(Icons.person, size: 30),
                    label: context.locale.languageCode == "en"
                        ? Text("Profile")
                        : Text("الحساب الشخصي")),
                NavigationRailDestination(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    icon: Icon(Icons.settings, size: 30),
                    label: context.locale.languageCode == "en"
                        ? Text("Settings")
                        : Text("الاعدادات")),
              ],
            ),
            const VerticalDivider(thickness: 1, width: 1),
            Expanded(
              child: tabletChildren[_selectedIndex],
            )
          ],
        ),
      ),
    );
  }
}
