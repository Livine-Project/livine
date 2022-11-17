import 'package:easy_localization/easy_localization.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import '../../../shared/children/children.dart';

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
                iconSize: MediaQuery.of(context).size.width / 75,
                onPressed: () {
                  setState(() {
                    isExtended = !isExtended;
                  });
                },
                icon: const Icon(FluentSystemIcons.ic_fluent_library_filled),
              ),
              minExtendedWidth: 200,
              destinations: <NavigationRailDestination>[
                NavigationRailDestination(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  icon: Icon(FluentSystemIcons.ic_fluent_home_filled,
                      size: MediaQuery.of(context).size.width / 70),
                  label: context.locale.languageCode == "en"
                      ? const Text("Home")
                      : const Text("الرئيسية"),
                ),
                NavigationRailDestination(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  icon: Icon(FluentSystemIcons.ic_fluent_food_filled,
                      size: MediaQuery.of(context).size.width / 70),
                  label: context.locale.languageCode == "en"
                      ? const Text("Meals")
                      : const Text("الوجبات"),
                ),
                // NavigationRailDestination(
                //     padding: EdgeInsets.symmetric(vertical: 20.0),
                //     icon: Icon(Icons.star_rate_rounded, size: 30),
                //     label: context.locale.languageCode == "en"
                //         ? Text("Pristine")
                //         : Text("الاصلي")),
                NavigationRailDestination(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    icon: Icon(FluentSystemIcons.ic_fluent_person_regular,
                        size: MediaQuery.of(context).size.width / 70),
                    label: context.locale.languageCode == "en"
                        ? const Text("Profile")
                        : const Text("الحساب الشخصي")),
                NavigationRailDestination(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    icon: Icon(FluentSystemIcons.ic_fluent_settings_filled,
                        size: MediaQuery.of(context).size.width / 70),
                    label: context.locale.languageCode == "en"
                        ? const Text("Settings")
                        : const Text("الاعدادات")),
              ],
            ),
            const VerticalDivider(thickness: 1, width: 1),
            LargeScreenView(selectedIndex: _selectedIndex)
          ],
        ),
      ),
    );
  }
}

class LargeScreenView extends StatelessWidget {
  const LargeScreenView({
    Key? key,
    required int selectedIndex,
  })  : _selectedIndex = selectedIndex,
        super(key: key);

  final int _selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: tabletChildren[_selectedIndex],
    );
  }
}
