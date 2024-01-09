// ignore_for_file: use_full_hex_values_for_flutter_colors, prefer_typing_uninitialized_variables, type_annotate_public_apis

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../translations/domain/translation_provider.dart';
import 'check_update/check_update.dart';
import 'settings_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class SettingsWidget extends ConsumerWidget {
  const SettingsWidget({Key? key}) : super(key: key);

  Future<void> sendReport() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'onlybailemos123@gmail.com',
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
  Widget build(BuildContext context, WidgetRef ref) {
    final word = TranslationRepo.translate(context);
    List<Settings> menus = [
      Settings(
        title: word?.languages ?? '',
        icon: Icons.language_outlined,
        subtitle: word?.change_language ?? '',
        onTap: () => context.push("/languages"),
      ),
      Settings(
        onTap: () => context.push("/notifications_settings"),
        title: word!.notfications,
        icon: Icons.notifications_outlined,
        subtitle: word.change_notification,
      ),
      Settings(
        onTap: () => context.push("/themeSettings"),
        title: word.theme,
        icon: Icons.palette_outlined,
        subtitle: word.change_theme,
      ),
      Settings(
        onTap: () async => sendReport(),
        title: word.report_a_bug,
        icon: Icons.bug_report_outlined,
        subtitle: word.help_us,
      ),
      Settings(
        onTap: () => context.push('/terms'),
        title: word.terms_and_conditions,
        icon: Icons.sticky_note_2_outlined,
        subtitle: "",
      ),
      Settings(
        onTap: () => context.push('/privacy'),
        title: word.privacy_Policy,
        icon: Icons.policy_outlined,
        subtitle: "",
      ),
      Settings(
        onTap: () async {
          final app = await PackageInfo.fromPlatform();

          showAdaptiveDialog(
              context: context,
              builder: (context) => AboutDialog(
                    applicationName: "Livine",
                    applicationVersion: app.version,
                    applicationLegalese: "© 2023 Livine",
                    applicationIcon: Image.asset(
                      'assets/images/icon/logo_12.png',
                      width: 70,
                      height: 70,
                    ),
                  ));
        },
        title: word.about_livine,
        icon: Icons.info_outline,
        subtitle: "",
      ),
      Settings(
        onTap: () async {
          final status =
              await ref.watch(checkUpdateProvider).checkIfUpdateAvailable();
          if (status == UpdateAvailableState.updateNotAvailable) {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: Text('No update available'),
                      content: Row(
                        children: [
                          Expanded(
                              child: Text(
                                  'You are using the latest version of Livine')),
                          Icon(Icons.check_circle_outline)
                        ],
                      ),
                      actions: [
                        TextButton(
                            onPressed: () => context.pop(), child: Text('OK'))
                      ],
                    ));
          } else {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: Text('Update available'),
                      content: Text('An update is available for Livine'),
                      actions: [
                        TextButton(
                            onPressed: () {
                              context.pop();
                              ref.watch(checkUpdateProvider).downloadUpdates();
                            },
                            child: Text('Download')),
                        TextButton(
                            onPressed: () => context.pop(),
                            child: Text('cancel'))
                      ],
                    ));
          }
        },
        title: word.check_for_update,
        icon: Icons.update_outlined,
        subtitle: "",
      ),
    ];
    if (dotenv.env["UPDATE"] == "false") {
      menus.removeLast();
    }
    // if (Platform.isWindows) {
    //   menus.removeWhere((element) => element.title == word.accessibility);
    // }
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
            return ListTile(
              onTap: menus[index].onTap,
              leading: Icon(menus[index].icon),
              title: Text(
                menus[index].title,
                style: TextStyle(fontFamily: ''),
              ),
              subtitle: menus[index].subtitle != ''
                  ? Text(menus[index].subtitle,
                      style: TextStyle(fontFamily: ''))
                  : null,
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
