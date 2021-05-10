import 'package:app/Others/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';

const url = "https://flutter.io";


class Settings extends StatefulWidget {


  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool value = false;

  String _version = '5.0';

bool check;
  checkNight() async{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      check = prefs.getBool('dark');
      print(check);
      if(check){
        setState(() {
          value = true;
        });
      } else{
        setState(() {
          value = false;
        });
      }
  }
  @override
  void initState() {
      checkNight();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Settings'),
      ),
    body: Container(
      child: SettingsList(
        sections: [
          SettingsSection(
            title: 'Section',
            tiles: [
              SettingsTile(
                title: 'Permissions',
                leading: Icon(Icons.lock_open),
                onTap: () {},
              ),
            ],
          ),
          SettingsSection(
            title: 'Theme',
            tiles: [
              SettingsTile.switchTile(
                title: value ? 'Day' : 'Night',
                leading: value ? Icon(FontAwesomeIcons.solidSun) : Icon(FontAwesomeIcons.moon),
                switchValue: value,
                onToggle: (val) async{
                  setState(() {
                    value = !value;
                  });
                  if (value) {
                    _themeChanger.setTheme(ThemeData.dark());
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    prefs.setBool('dark', true);
                  } else {
                    _themeChanger.setTheme(ThemeData.light());
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    prefs.setBool('dark', false);
                  }
                },
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
    ),
    );
  }
}