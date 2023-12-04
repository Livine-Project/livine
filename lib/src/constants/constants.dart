import 'package:flutter/material.dart';
import '../shared/notification_control/notifications_control.dart';
import '../shared/responsive/responsive_controller.dart';

ResponsiveHelper rh = ResponsiveHelper();

// final modelTF = ModelTFLite();

// final imageController = ImageController();

final notificationControl = NotificationControl();


const restAPIURL = "https://livine2.pythonanywhere.com/api";

const restAPIMedia = "https://livine2.pythonanywhere.com";

ColorScheme colorScheme(BuildContext context) {
  return Theme.of(context).colorScheme;
}
