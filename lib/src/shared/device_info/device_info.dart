import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';

class GetDeviceInfo {
  static DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  static AndroidDeviceInfo? androidInfo;
  static WindowsDeviceInfo? winodwsInfo;
  static Future<void> init() async {
    try {
      if (Platform.isAndroid) {
        androidInfo = await deviceInfo.androidInfo;
      } else if (Platform.isWindows) {
        winodwsInfo = await deviceInfo.windowsInfo;
      }
    } on PlatformException {
      print('Failed to get platform version');
    }
  }

  static String? deviceSDK() {
    if (Platform.isAndroid) {
      return androidInfo?.version.sdkInt.toString();
    } else if (Platform.isWindows) {
      return winodwsInfo?.computerName;
    }
    return null;
  }

  static String? deviceVersion() {
    if (Platform.isAndroid) {
      return androidInfo?.version.release;
    } else if (Platform.isWindows) {
      return winodwsInfo?.displayVersion;
    }
    return null;
  }

  static List<String>? deviceABI() {
    if (Platform.isAndroid) {
      return androidInfo?.supportedAbis;
    }
    return [];
  }

  static String? deviceBrand() {
    if (Platform.isAndroid) {
      return androidInfo?.brand;
    } else if (Platform.isWindows) {
      return winodwsInfo?.productType.toString();
    }
    return null;
  }

  static bool isAndroid12Above() {
    if (Platform.isAndroid) {
      print("SDK ${deviceSDK()}");
      return deviceSDK() != null && int.parse(deviceSDK()!) >= 31;
    }
    return false;
  }
}
