import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:livine/src/constants/constants.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../shared/connectivity/check_network.dart';

class NoConnection extends ConsumerWidget {
  const NoConnection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: ResponsiveRowColumn(
        layout: rh.largerThanMobile(context)
            ? ResponsiveRowColumnType.ROW
            : ResponsiveRowColumnType.COLUMN,
        columnMainAxisAlignment: MainAxisAlignment.center,
        rowMainAxisAlignment: MainAxisAlignment.center,
        children: [
          ResponsiveRowColumnItem(
            child: SvgPicture.asset(
              "assets/images/network/network_error.svg",
              width: rh.deviceWidth(context) * 0.4,
            ),
          ),
          ResponsiveRowColumnItem(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: rh.deviceHeight(context) * 0.08),
              ResponsiveRowColumnItem(
                child: Text(
                  "No internet connection",
                  style: TextStyle(fontFamily: 'Kine', fontSize: 24.0),
                ),
              ),
              ResponsiveRowColumnItem(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    "Please check your internet connection and try again",
                    style: TextStyle(fontFamily: 'Kine', fontSize: 15.0),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              ResponsiveRowColumnItem(
                  child: SizedBox(height: rh.deviceHeight(context) * 0.2)),
              ResponsiveRowColumnItem(
                child: Consumer(
                  builder: (context, watch, child) {
                    final theme = Theme.of(context).colorScheme;
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: MaterialButton(
                        onPressed: () => ref.refresh(checkNetworkProvider),
                        color: (null) ?? theme.primaryContainer,
                        elevation: 0,
                        minWidth: 350,
                        height: 60,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          "Try again",
                          style: TextStyle(
                              fontSize: 15,
                              // fontFamily: context.locale.languageCode == "en"
                              //     ? 'Kine'
                              //     : GoogleFonts.notoKufiArabic().fontFamily,
                              color: (null) ?? theme.onPrimaryContainer),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }
}
