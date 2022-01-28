import 'devices.dart';
import 'package:flutter/widgets.dart';

DeviceScreenType getDeviceType(MediaQueryData mediaQuery) {
  final double deviceWidth = mediaQuery.size.shortestSide;

  if (deviceWidth > 600) {
    return DeviceScreenType.tablet;
  }

  return DeviceScreenType.mobile;
}
