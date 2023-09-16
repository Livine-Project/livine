import 'package:flutter/material.dart';
import 'package:livine/src/constants/constants.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

class ResponsiveHelper {
  double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;

  double deviceHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  bool largerThanMobile(BuildContext context) =>
      ResponsiveBreakpoints.of(context).largerThan(MOBILE);

  bool isMobile(BuildContext context) =>
      ResponsiveBreakpoints.of(context).isMobile;

  // is not mobile
  bool isTablet(BuildContext context) =>
      ResponsiveBreakpoints.of(context).isTablet;

  bool deviceLandScape(BuildContext context) =>
      ResponsiveBreakpoints.of(context).orientation == Orientation.landscape;

  bool devicePortrait(BuildContext context) =>
      ResponsiveBreakpoints.of(context).orientation == Orientation.portrait;

  int responsiveRecipes(BuildContext context) {
    if (ResponsiveBreakpoints.of(context).isTablet &&
        ResponsiveBreakpoints.of(context).orientation == Orientation.portrait) {
      return 4;
    } else if (ResponsiveBreakpoints.of(context).orientation ==
            Orientation.landscape &&
        ResponsiveBreakpoints.of(context).isTablet) {
      return 6;
    } else if (ResponsiveBreakpoints.of(context).isMobile &&
        ResponsiveBreakpoints.of(context).orientation == Orientation.portrait) {
      return 2;
    } else if (ResponsiveBreakpoints.of(context).isDesktop) {
      return 5;
    } else if (ResponsiveBreakpoints.of(context).orientation ==
        Orientation.landscape) {
      return 4;
    }

    return 2;
  }

  int responsiveCatogeries(BuildContext context) {
    if (rh.deviceLandScape(context)) {
      return 3;
    }
    if (ResponsiveBreakpoints.of(context).equals(TABLET) ||
        rh.deviceWidth(context) > 500) {
      return 3;
    }
    return 1;
  }

  int responsiveMeals(BuildContext context) {
    if (ResponsiveBreakpoints.of(context).isTablet &&
        ResponsiveBreakpoints.of(context).orientation == Orientation.portrait) {
      return 2;
    } else if (ResponsiveBreakpoints.of(context).orientation ==
            Orientation.landscape &&
        ResponsiveBreakpoints.of(context).isDesktop) {
      return 6;
    }

    if (ResponsiveBreakpoints.of(context).isMobile) {
      if (ResponsiveBreakpoints.of(context).orientation ==
          Orientation.portrait) {
        return 2;
      } else {
        return 1;
      }
    }
    return 4;
  }
}
