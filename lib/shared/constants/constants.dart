import 'package:livine/shared/controllers/notification_control/notifications_control.dart';

import '../../models/ads/ads_help.dart';
import '../controllers/auth/auth_helper.dart';
import '../controllers/hydration_control/hydration_control.dart';
import '../controllers/model_tflite/image_controller.dart';
import '../controllers/model_tflite/model_controller.dart';
import '../controllers/responsive/responsive_controller.dart';

ResponsiveHelper rh = ResponsiveHelper();

final adHelper = AdHelper();

final modelTF = ModelTFLite();

final imageController = ImageController();

final authHelper = AuthHelper();

final notificationControl = NotificationControl();

final hydrationControl = HydrationControl();

const restAPIURL = "https://livine.pythonanywhere.com/api";

const restAPIMedia = "https://livine.pythonanywhere.com";




