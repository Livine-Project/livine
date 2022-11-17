import 'dart:io';

import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

class TitleBar extends StatelessWidget {
  const TitleBar({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Platform.isWindows) {
      return const SizedBox.shrink();
    }
    return SizedBox(
      height: 56,
      child: WindowCaption(
        title: Text(
          "Livine",
          style: TextStyle(
            fontFamily: 'Kine',
            fontSize: 24.0,
          ),
        ),
        brightness: Theme.of(context).brightness,
      ),
    );
  }
}

class AppThemeBuilder extends StatefulWidget {
  const AppThemeBuilder({
    super.key,
    required this.child,
    this.lightDynamic,
    this.darkDynamic,
    required this.themeMode,
  });

  final Widget child;
  final ColorScheme? lightDynamic;
  final ColorScheme? darkDynamic;
  final ThemeMode themeMode;

  @override
  State<AppThemeBuilder> createState() => AppThemeBuilderState();
}

class AppThemeBuilderState extends State<AppThemeBuilder>
    with WidgetsBindingObserver {
  ThemeMode themeMode = ThemeMode.light;

  WidgetsBinding get _binding => WidgetsBinding.instance;

  @override
  void initState() {
    super.initState();
    _binding.addObserver(this);
    _updateThemeMode(true);
  }

  void _updateThemeMode([bool inital = false]) {
    ThemeMode themeMode = widget.themeMode;
    if (themeMode == ThemeMode.system) {
      themeMode = _binding.window.platformBrightness == Brightness.dark //
          ? ThemeMode.dark
          : ThemeMode.light;
    }
    if (themeMode != this.themeMode) {
      if (!inital) {
        setState(() => this.themeMode = themeMode);
      } else {
        this.themeMode = themeMode;
      }
    }
  }

  @override
  void dispose() {
    _binding.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    _updateThemeMode();
    super.didChangePlatformBrightness();
  }

  @override
  void didUpdateWidget(covariant AppThemeBuilder oldWidget) {
    super.didUpdateWidget(oldWidget);
    _updateThemeMode();
  }

  @override
  Widget build(BuildContext context) {
    final darkTheme =
        ThemeData(useMaterial3: true, colorScheme: widget.darkDynamic);
    final lightTheme =
        ThemeData(useMaterial3: true, colorScheme: widget.lightDynamic);
    final theme = themeMode == ThemeMode.dark ? darkTheme : lightTheme;
    return AnimatedTheme(data: theme, child: widget.child);
  }
}
