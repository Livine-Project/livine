import 'package:flutter/material.dart';
import '../../../shared/children/children.dart';
import '../../../translations/domain/translation_provider.dart';

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
    final word = TranslationRepo.translate(context);
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
                icon: const Icon(Icons.filter_list),
              ),
              minExtendedWidth: 200,
              destinations: <NavigationRailDestination>[
                NavigationRailDestination(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  icon: Icon(Icons.filter_list,
                      size: MediaQuery.of(context).size.width / 70),
                  label: Text(word?.home ?? ""),
                ),
                NavigationRailDestination(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  icon: Icon(Icons.filter_list,
                      size: MediaQuery.of(context).size.width / 70),
                  label: Text(word?.meals ?? ""),
                ),
                NavigationRailDestination(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  icon: Icon(Icons.filter_list,
                      size: MediaQuery.of(context).size.width / 70),
                  label: Text(word?.profile ?? ""),
                ),
                NavigationRailDestination(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  icon: Icon(Icons.filter_list,
                      size: MediaQuery.of(context).size.width / 70),
                  label: Text(word?.settings ?? ""),
                ),
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
