import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../shared/cache/cache_helper.dart';
import '../../../../../shared/device_info/device_info.dart';

final themeSeedProvider = StateNotifierProvider((ref) => ThemeSeedNotifier());

final dynamicThemeProvider =
    StateNotifierProvider((ref) => DynamicThemeNotifier());

class ThemeSeedNotifier extends StateNotifier<Color> {
  ThemeSeedNotifier() : super(_getInitialColor());

  static Color _getInitialColor() {
    int userColor = CacheHelper.getInt('userColor') ?? Colors.green.value;
    return Color(userColor);
  }

  void setTheme(Color color) {
    state = color;
    CacheHelper.setInt("userColor", color.value);
  }
}

class DynamicThemeNotifier extends StateNotifier<bool> {
  DynamicThemeNotifier() : super(_initialCheckDynamic());

  static bool _initialCheckDynamic() {
    if (!GetDeviceInfo.isAndroid12Above()) {
      return false;
    }
    bool isDynamic = CacheHelper.getBool('isDynamic') ?? true;
    return isDynamic;
  }

  void toggleDynamic(bool isDynamic) {
    state = isDynamic;
    CacheHelper.setBool("isDynamic", isDynamic);
  }
}
