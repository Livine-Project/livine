import 'info_devices.dart';
import 'ui_utils.dart';
import 'package:flutter/material.dart';

class ResponsiveBuilder extends StatelessWidget {
  final Widget? Function(
    BuildContext context,
    SizingInformation sizingInformation,
  )? builder;
  const ResponsiveBuilder({Key? key, this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, boxConstraints) {
      final mediaQuery = MediaQuery.of(context);
      final sizingInformation = SizingInformation(
        deviceScreenType: getDeviceType(mediaQuery),
        screenSize: mediaQuery.size,
        localWidgetSize:
            Size(boxConstraints.maxWidth, boxConstraints.maxHeight),
      );
      return builder!(context, sizingInformation)!;
    },);
  }
}
