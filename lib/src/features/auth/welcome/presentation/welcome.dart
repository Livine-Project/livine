import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../../constants/constants.dart';
import '../../../../common_widgets/auth/auth_widget.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    log(rh.deviceWidth(context).toString());
    return Scaffold(
      body: SafeArea(
        child: ResponsiveRowColumn(
            layout: rh.deviceWidth(context) <= 800 &&
                        rh.deviceWidth(context) > 400 ||
                    rh.largerThanMobile(context)
                ? ResponsiveRowColumnType.ROW
                : ResponsiveRowColumnType.COLUMN,
            children: [
              ResponsiveRowColumnItem(
                child: Center(
                  child: SvgPicture.asset(
                    'assets/images/welcome/welcome_light.svg',
                    height: rh.deviceLandScape(context)
                        ? rh.deviceWidth(context) * 0.4
                        : rh.deviceHeight(context) * 0.45,
                  ),
                ),
              ),
              ResponsiveRowColumnItem(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: rh.largerThanMobile(context)
                          ? rh.deviceHeight(context) * 0.25
                          : rh.deviceHeight(context) * 0.03,
                      horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Welcome",
                              style: TextStyle(
                                fontFamily: 'Kine',
                                fontSize: 50.0,
                              ),
                            ),
                            Container(
                              width: rh.deviceLandScape(context)
                                  ? rh.deviceHeight(context) * 0.9
                                  : rh.deviceHeight(context) * 0.4,
                              child: Text(
                                "Let's live naturally without any type of medications",
                                style: TextStyle(
                                    fontFamily: 'Kine',
                                    fontSize: 20.0,
                                    color: getColorScheme(context)
                                        .onBackground
                                        .withOpacity(0.3)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: rh.deviceLandScape(context)
                            ? rh.deviceWidth(context) * 0.03
                            : 80,
                      ),
                      Column(
                        children: [
                          authButton(
                              onPressed: () {
                                context.push("/register");
                              },
                              isLoading: isLoading,
                              text: "Get Started",
                              context: context),
                          SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              context.push("/login");
                            },
                            child: Text(
                              "I already have an account",
                              style:
                                  TextStyle(fontFamily: 'Kine', fontSize: 18.0),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
