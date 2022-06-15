import '../../models/ads/ads_help.dart';
import '../components/model_tflite/image_controller.dart';
import '../components/model_tflite/model_controller.dart';
import '../controllers/responsive/responsive_controller.dart';

ResponsiveHelper rh = new ResponsiveHelper();

final adHelper = AdHelper();

final modelTF = ModelTFLite();

final imageController = ImageController();

final restAPIURL = "https://livine.pythonanywhere.com/api";

final restAPIMedia = "https://livine.pythonanywhere.com";
