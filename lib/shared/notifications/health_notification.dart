// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import '../constants/constants.dart';


tz.TZDateTime _nextInstanceOfTenAM() {
  final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
  tz.TZDateTime scheduledDate =
      tz.TZDateTime(tz.local, now.year, now.month, now.day, 10);
  if (scheduledDate.isBefore(now)) {
    scheduledDate = scheduledDate.add(const Duration(days: 1));
  }
  return scheduledDate;
}

Future<void> showNotification() async {
  tz.initializeTimeZones();
  final String dtz = await FlutterNativeTimezone.getLocalTimezone();
  final localTimeZone = tz.getLocation(dtz);
  tz.setLocalLocation(localTimeZone);

  const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      'channelId', 'Livine ',
      channelDescription: 'Description of the notification ',
      importance: Importance.high);
  const NotificationDetails generalNotDetails =
      NotificationDetails(android: androidDetails);

  await notificationControl.flutterLocalNotificationsPlugin.zonedSchedule(
    0,
    'How are you feeling today ? 😊',
    'Your health is our top priority ',
    _nextInstanceOfTenAM(),
    generalNotDetails,
    androidAllowWhileIdle: true,
    uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime,
    matchDateTimeComponents: DateTimeComponents.time,
  );
}
