import 'dart:io';

class AdHelper {
  static String get nativeadunit {
    if (Platform.isAndroid) {
      return "ca-app-pub-6594474809526163/6049258242";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

}
