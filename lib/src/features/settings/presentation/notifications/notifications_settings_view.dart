import 'package:flutter/material.dart';

import '../../../../constants/constants.dart';
import '../../../../shared/notifications/health_notification.dart';
import '../../../../translations/domain/translation_provider.dart';

class NotificationsSettings extends StatefulWidget {
  const NotificationsSettings({Key? key}) : super(key: key);

  @override
  State<NotificationsSettings> createState() => _NotificationsSettingsState();
}

class _NotificationsSettingsState extends State<NotificationsSettings> {
  bool isNotified = true;

  @override
  Widget build(BuildContext context) {
    final word = TranslationRepo.translate(context);
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar.large(
          title: Text(word?.notfications ?? "Notifications"),
        ),
        SliverToBoxAdapter(
          child: //   Padding(
              Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                  width: 200,
                  child: Text(word?.ask_me_how_i_feel ?? "Ask me how I feel",
                      style: const TextStyle(fontSize: 18.0))),
              Switch(
                  value: isNotified,
                  onChanged: (value) {
                    setState(() {
                      isNotified = value;
                    });

                    if (!value) {
                      notificationControl.flutterLocalNotificationsPlugin
                          .cancel(0);
                    } else {
                      showNotification();
                    }
                  })
            ],
          ),
        )
      ],
    ));
  }
}
