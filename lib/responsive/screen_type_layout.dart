import 'package:app/responsive/baseWidget.dart';
import 'package:app/responsive/devices.dart';
import 'package:flutter/material.dart';

class ScreenTypeLayout extends StatelessWidget {
  // Mobile will be returned by default
  final Widget mobile;
  final Widget tablet;

  const ScreenTypeLayout(
      {Key key, @required this.mobile, this.tablet})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      // If sizing indicates Tablet and we have a tablet widget then return
      if (sizingInformation.deviceScreenType == DeviceScreenType.Tablet) {
        if (tablet != null) {
          return tablet;
        }
      }

      // Return mobile layout if nothing else is supplied
      return mobile;
    });
  }
}
