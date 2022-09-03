import 'dart:io';

import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

class TitleBar extends StatelessWidget {
  const TitleBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).brightness;
    if (!Platform.isWindows) {
      return const SizedBox.shrink();
    }
    return SizedBox(
      height: 56,
      child: WindowCaption(
          brightness:
              theme == Brightness.dark ? Brightness.dark : Brightness.light,
          backgroundColor: Colors.transparent),
    );
  }
}
