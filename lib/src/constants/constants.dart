import 'package:flutter/material.dart';
import 'package:livine/src/shared/notification_control/notifications_control.dart';

import '../shared/ads/ads_help.dart';
import '../features/scan_food/presentation/controllers/image_controller.dart';
import '../features/scan_food/presentation/controllers/model_controller.dart';
import '../shared/responsive/responsive_controller.dart';

ResponsiveHelper rh = ResponsiveHelper();

final adHelper = AdHelper();

final modelTF = ModelTFLite();

final imageController = ImageController();

final notificationControl = NotificationControl();

const restAPIURL = "https://livine2.pythonanywhere.com/api";

const restAPIMedia = "https://livine2.pythonanywhere.com";

ColorScheme getColorScheme(BuildContext context) {
  return Theme.of(context).colorScheme;
}

