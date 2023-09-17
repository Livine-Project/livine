// ignore_for_file: use_full_hex_values_for_flutter_colors, prefer_typing_uninitialized_variables, type_annotate_public_apis

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:livine/src/translations/domain/translation_provider.dart';
import 'package:shorebird_code_push/shorebird_code_push.dart';
import 'package:url_launcher/url_launcher.dart';

import 'settings_model.dart';

class SettingsWidget extends ConsumerStatefulWidget {
  const SettingsWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<SettingsWidget> createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends ConsumerState<SettingsWidget> {
  late BuildContext context;
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
    final word = TranslationRepo.translate(context);
    List<Settings> menus = [
      Settings(
        title: word?.languages ?? '',
        icon: Icons.language_outlined,
        route: "/languages",
        subtitle: word?.change_language ?? '',
      ),
      Settings(
        title: word!.accessibility,
        icon: Icons.accessibility_outlined,
        route: "/accessibility",
        subtitle: word.change_use,
      ),
      Settings(
        title: word.notfications,
        icon: Icons.notifications_outlined,
        route: "/notifications_settings",
        subtitle: word.change_notification,
      ),
      Settings(
        title: word.theme,
        icon: Icons.palette_outlined,
        route: "/themeSettings",
        subtitle: word.change_theme,
      ),
      Settings(
        title: word.report_a_bug,
        icon: Icons.bug_report_outlined,
        route: "/bug_report",
        subtitle: word.help_us,
      ),
      Settings(
        title: word.terms_and_conditions,
        icon: Icons.sticky_note_2_outlined,
        route: "/terms",
        subtitle: "",
      ),
      Settings(
        title: word.privacy_Policy,
        icon: Icons.policy_outlined,
        route: "/privacy",
        subtitle: "",
      ),
      Settings(
          title: word.version,
          icon: Icons.info_outline,
          route: "",
          subtitle: "9.0.0"),
    ];

    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar.large(
          title: Text(word.settings),
          pinned: true,
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
          (context, index) {
            return InkWell(
              onTap: () {
                if (menus[index].route != '/bug_report') {
                  context.push(menus[index].route);
                } else {
                  sendReport();
                }
              },
              child: ListTile(
                leading: Icon(menus[index].icon),
                title: Text(
                  menus[index].title,
                  style: TextStyle(fontFamily: ''),
                ),
                subtitle: menus[index].subtitle != ''
                    ? Text(menus[index].subtitle,
                        style: TextStyle(fontFamily: ''))
                    : null,
              ),
            );
          },
          childCount: menus.length,
        ))
      ],
    ));
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
              style: const TextStyle(
                fontSize: 15.0,
              ),
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
