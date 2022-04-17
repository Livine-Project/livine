// ignore_for_file: use_full_hex_values_for_flutter_colors, prefer_typing_uninitialized_variables, type_annotate_public_apis

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../main.dart';
import '../translations/locale_keys.g.dart';

class SettingsWidget extends StatefulWidget {
  @override
  _SettingsWidgetState createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  Future<void> sendReport() async {
    

    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'wildlifemain1@gmail.com',
    query: 'subject=Bug Report|Livine&body=write your issues here', //add subject and body here
    );
    try {
      await launch(emailLaunchUri.toString());
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.Settings.tr()),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SettingsGroup(
                    text: LocaleKeys.General.tr(),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  InkWell(
                    onTap: () => context.push('/languages'),
                    child: SettingsTile(
                      text: LocaleKeys.Language.tr(),
                      subtitle: context.locale.languageCode == "en" ? "English " : "العربية",
                      icon: Icons.language,
                      iconColor: Colors.white,
                      backgroundColor: Color(0xfff3f37c9),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Divider(),
                  SettingsGroup(text: LocaleKeys.Theme.tr()),
                  SizedBox(
                    height: 10.0,
                  ),
                  InkWell(
                    onTap: () => context.push('/themeSettings'),
                    child: SettingsTile(
                      text: LocaleKeys.Theme.tr(),
                      subtitle: '',
                      icon: Icons.dark_mode,
                      iconColor: Colors.white,
                      backgroundColor: (Colors.deepPurple[900])!,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Divider(),
                  SettingsGroup(text: LocaleKeys.Feedback.tr()),
                  SizedBox(
                    height: 10.0,
                  ),
                  InkWell(
                    onTap: sendReport,
                    child: SettingsTile(
                      text: LocaleKeys.Report_a_bug.tr(),
                      subtitle: '',
                      icon: Icons.bug_report,
                      iconColor: Colors.white,
                      backgroundColor: (Colors.deepPurple[500])!,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Divider(),
                  SettingsGroup(text: LocaleKeys.Misc.tr()),
                  SizedBox(
                    height: 10.0,
                  ),
                  InkWell(
                    onTap: () => context.push('/terms'),
                    child: SettingsTile(
                      text: LocaleKeys.Terms_and_conditions.tr(),
                      subtitle: '',
                      icon: FontAwesomeIcons.fileAlt,
                      iconColor: Colors.white,
                      backgroundColor: (Colors.deepPurple[900])!,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  InkWell(
                    onTap: () => context.push('/privacy'),
                    child: SettingsTile(
                      text: LocaleKeys.Privacy_Policy.tr(),
                      subtitle: '',
                      icon: Icons.privacy_tip,
                      iconColor: Colors.white,
                      backgroundColor: (Colors.deepPurple[900])!,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Divider(),
                  SettingsGroup(text: LocaleKeys.Info.tr()),
                  SizedBox(
                    height: 10.0,
                  ),
                  SettingsTile(
                    text: LocaleKeys.Version.tr(),
                    subtitle: '3.5.5',
                    icon: Icons.info,
                    iconColor: Colors.white,
                    backgroundColor: Colors.black,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsTile extends StatelessWidget {
  const SettingsTile({
    Key? key,
    required this.text,
    required this.icon,
    required this.backgroundColor,
    required this.iconColor,
    required this.subtitle,
  }) : super(key: key);

  final IconData icon;
  final text;
  final Color backgroundColor;
  final Color iconColor;
  final subtitle;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: backgroundColor,
          radius: 20.0,
          child: Icon(
            icon,
            color: iconColor,
          ),
        ),
        SizedBox(
          width: 10.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$text',
              style: TextStyle(fontSize: 15.0),
            ),
            Text(
              '$subtitle',
              style: TextStyle(fontSize: 13.0, color: Colors.grey[500]),
            ),
          ],
        ),
      ],
    );
  }
}

class SettingsGroup extends StatelessWidget {
  const SettingsGroup({
    Key? key,
    required this.text,
  }) : super(key: key);

  final text;
  @override
  Widget build(BuildContext context) {
    return Text(
      '$text'.toUpperCase(),
      // style: GoogleFonts.bebasNeue(
      //   fontSize: 15.0,
      //   color: Colors.blueAccent,
      //   letterSpacing: 3,
      // ),
      style: TextStyle(fontSize: 15.0),
    );
  }
}
