// ignore_for_file: use_full_hex_values_for_flutter_colors, prefer_typing_uninitialized_variables, type_annotate_public_apis

import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../translations/locale_keys.g.dart';

class SettingsWidget extends StatefulWidget {
  const SettingsWidget({Key? key}) : super(key: key);

  @override
  State<SettingsWidget> createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  Future<void> sendReport() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'wildlifemain1@gmail.com',
      query:
          'subject=Bug Report|Livine&body=write your issues here', //add subject and body here
    );
    try {
      await launchUrl(Uri.parse(emailLaunchUri.toString()));
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.Settings.tr()),
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
                  const SizedBox(
                    height: 10.0,
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: () => context.push('/languages'),
                        child: SettingsTile(
                          text: LocaleKeys.Language.tr(),
                          subtitle: context.locale.languageCode == "en"
                              ? "English "
                              : "العربية",
                          icon: Icons.language,
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      InkWell(
                        onTap: () => context.push("/notifications_settings"),
                        child: SettingsTile(
                          text: LocaleKeys.notfications.tr(),
                          subtitle: '',
                          icon: Icons.notifications,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Divider(),
                  SettingsGroup(text: LocaleKeys.Theme.tr()),
                  const SizedBox(
                    height: 10.0,
                  ),
                  InkWell(
                    onTap: () => context.push('/themeSettings'),
                    child: SettingsTile(
                      text: LocaleKeys.Theme.tr(),
                      subtitle: '',
                      icon: Icons.dark_mode,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Divider(),
                  SettingsGroup(text: LocaleKeys.Feedback.tr()),
                  const SizedBox(
                    height: 10.0,
                  ),
                  InkWell(
                    onTap: sendReport,
                    child: SettingsTile(
                      text: LocaleKeys.Report_a_bug.tr(),
                      subtitle: '',
                      icon: Icons.bug_report,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Divider(),
                  SettingsGroup(text: LocaleKeys.Misc.tr()),
                  const SizedBox(
                    height: 10.0,
                  ),
                  InkWell(
                    onTap: () => context.push('/terms'),
                    child: SettingsTile(
                      text: LocaleKeys.Terms_and_conditions.tr(),
                      subtitle: '',
                      icon: FontAwesomeIcons.fileLines,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  InkWell(
                    onTap: () => context.push('/privacy'),
                    child: SettingsTile(
                      text: LocaleKeys.Privacy_Policy.tr(),
                      subtitle: '',
                      icon: Icons.privacy_tip,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Divider(),
                  SettingsGroup(text: LocaleKeys.Info.tr()),
                  const SizedBox(
                    height: 10.0,
                  ),
                  SettingsTile(
                    text: LocaleKeys.Version.tr(),
                    subtitle: '7.0.0',
                    icon: Icons.info,
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
    this.backgroundColor,
    this.iconColor,
    required this.subtitle,
  }) : super(key: key);

  final IconData icon;
  final text;
  final Color? backgroundColor;
  final Color? iconColor;
  final subtitle;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 25,
          color: iconColor,
        ),
        const SizedBox(
          width: 10.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$text',
              style: const TextStyle(fontSize: 15.0),
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
      '$text',
      // style: GoogleFonts.bebasNeue(
      //   fontSize: 15.0,
      //   color: Colors.blueAccent,
      //   letterSpacing: 3,
      // ),
      style: const TextStyle(fontSize: 17.0),
    );
  }
}
