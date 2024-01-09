import '../../../../main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeProvider = ChangeNotifierProvider((ref) => ThemeNotifer(ref));

class ThemeNotifer extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;
  final Ref ref;
  ThemeNotifer(this.ref) {
    final theme = ref.read(sharedPrefProvider).getString('theme');
    if (theme == ThemeMode.dark.name) {
      _themeMode = ThemeMode.dark;
    }
    if (theme == ThemeMode.light.name) {
      _themeMode = ThemeMode.light;
    }
    if (theme == ThemeMode.system.name) {
      _themeMode = ThemeMode.system;
    }
  }
  ThemeMode get themeMode => _themeMode;
  set themeMode(ThemeMode themeMode) {
    if (themeMode != _themeMode) {
      _themeMode = themeMode;
      notifyListeners();
      ref.read(sharedPrefProvider).setString('theme', themeMode.name);
    }
  }

  void setDark() => themeMode = ThemeMode.dark;
  void setLight() => themeMode = ThemeMode.light;
  void setSystem() => themeMode = ThemeMode.system;
}
