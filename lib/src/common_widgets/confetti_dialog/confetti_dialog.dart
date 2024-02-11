import 'dart:math';

import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:livine/src/utils/hooks/confetti_controller.dart';

Future<T?> showConfettiDialog<T>({
  required BuildContext context,
  WidgetBuilder? builder,
  bool barrierDismissible = true,
  Color? barrierColor,
  bool useSafeArea = true,
  bool useRootNavigator = true,
  RouteSettings? routeSettings,
  Alignment confettiAlignment = Alignment.topCenter,
}) {
  final pageBuilder = Builder(
    builder: builder!,
  );
  print("MW");
  final _confettiController =
      ConfettiController(duration: Duration(seconds: 5));
  _confettiController.play();
  return showDialog(
    context: context,
    builder: (BuildContext buildContext) {
      return Stack(
        children: [
          pageBuilder,
          Align(
            alignment: confettiAlignment,
            child: ConfettiWidget(
                confettiController: _confettiController,
                emissionFrequency: 0.1,
                blastDirection: pi / 2),
          ),
        ],
      );
    },
    barrierDismissible: barrierDismissible,
    barrierColor: barrierColor,
    useSafeArea: useSafeArea,
    useRootNavigator: useRootNavigator,
    routeSettings: routeSettings,
  );
}
