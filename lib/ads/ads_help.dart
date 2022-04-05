import 'dart:io';

class AdHelper {
  static String get nativeadunit {
    if (Platform.isAndroid) {
      return "ca-app-pub-1056698201610872/1548122447";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

}
