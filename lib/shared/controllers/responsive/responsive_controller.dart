import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

class ResponsiveHelper {
  double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;

  double deviceHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;


  int responsiveRecipes(BuildContext context) {
    if (ResponsiveWrapper.of(context).isTablet &&
        ResponsiveWrapper.of(context).orientation == Orientation.portrait) {
      return 4;
    } else if (ResponsiveWrapper.of(context).orientation ==
            Orientation.landscape &&
        ResponsiveWrapper.of(context).isTablet) {
      return 6;
    } else if (ResponsiveWrapper.of(context).isMobile &&
        ResponsiveWrapper.of(context).orientation == Orientation.portrait) {
      return 2;
    } else if (ResponsiveWrapper.of(context).orientation ==
        Orientation.landscape) {
      return 4;
    }

    return 2;
  }

  int responsiveCatogeries(BuildContext context) {
    if (ResponsiveWrapper.of(context).isTablet &&
        ResponsiveWrapper.of(context).orientation == Orientation.portrait) {
      return 2;
    } else if (ResponsiveWrapper.of(context).orientation ==
            Orientation.landscape &&
        ResponsiveWrapper.of(context).isDesktop) {
      return 4;
    }

    if (ResponsiveWrapper.of(context).isMobile) {
      if (ResponsiveWrapper.of(context).orientation == Orientation.portrait) {
        return 1;
      } else {
        return 2;
      }
    }
    return 1;
  }

  int responsiveMeals(BuildContext context) {
    if (ResponsiveWrapper.of(context).isTablet &&
        ResponsiveWrapper.of(context).orientation == Orientation.portrait) {
      return 2;
    } else if (ResponsiveWrapper.of(context).orientation ==
            Orientation.landscape &&
        ResponsiveWrapper.of(context).isDesktop) {
      return 3;
    }

    if (ResponsiveWrapper.of(context).isMobile) {
      if (ResponsiveWrapper.of(context).orientation == Orientation.portrait) {
        return 1;
      } else {
        return 2;
      }
    }
    return 1;
  }
}
