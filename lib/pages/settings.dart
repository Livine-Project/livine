import 'package:app/Others/theme.dart';
import 'package:app/main.dart';
import 'package:app/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool value = false;

  String _version = '5.0';

  bool check;
  checkNight() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    check = prefs.getBool('dark');
    if (check == true) {
      setState(() {
        value = true;
      });
    } else {
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
    // ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);
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
                  leading: value
                      ? Icon(
                          Icons.light_mode,
                          color: Colors.yellow[50],
                        )
                      : Icon(
                          Icons.dark_mode,
                          color: Color(0xFF642ef3),
                        ),
                  switchValue: Theme.of(context).brightness == Brightness.dark
                      ? true
                      : false,
                  onToggle: (val) async {
                    setState(() {
                      value = !value;
                    });
                    if (!value) {
                      context.read(themeProvider).setLight();
                    } else {
                      context.read(themeProvider).setDark();
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
