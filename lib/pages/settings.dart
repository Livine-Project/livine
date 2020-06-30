import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

const url = "https://flutter.io";


class Settings extends StatefulWidget {


  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  // bool _value = false;

  String _version = '5.0';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Settings'),
      ),
//      bottomNavigationBar: BottomNavigationBar(
//        currentIndex: _currentindex,
//        items: [
//          BottomNavigationBarItem(icon: Icon(Icons.tag_faces), title: Text("")),
//          BottomNavigationBarItem(icon: Icon(Icons.fastfood), title: Text("")),
//          BottomNavigationBarItem(icon: Icon(Icons.add_shopping_cart), title: Text("")),
//        ],
//        onTap: (int index) {
//          setState(() {
//            _currentindex = index;
//          });
//        },
//      ),
    body: SettingsList(
      sections: [
        SettingsSection(
          title: 'Section',
          tiles: [
            SettingsTile(
              title: 'Language',
              subtitle: 'English',
              leading: Icon(Icons.language),
              onTap: () {},
            ),
            SettingsTile(
              title: 'Permissions',
              leading: Icon(Icons.lock_open),
              onTap: () {},
            ),
          ],
        ),
        SettingsSection(
          title: 'Misc',
          tiles: [
            SettingsTile(
                title: 'Terms and Conditions',
                leading: Icon(Icons.assignment),
                onTap: () => Navigator.pushNamed(context, '/terms'),
            ),
            SettingsTile(
              title: 'Privacy Policy',
              leading: Icon(Icons.description),
              onTap: () => Navigator.pushNamed(context, '/privacy'),
            ),
          ],
        ),
        SettingsSection(
          title: 'About',
          tiles: [
            SettingsTile(
              title: 'Version',
              subtitle: _version,
              leading: Icon(Icons.info),
              onTap: () {},
            ),
          ],
        ),
      ],
    ),
    );
  }
}