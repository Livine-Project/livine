import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_row_column.dart';

import '../../../../constants/constants.dart';
import '../../../../translations/domain/translation_provider.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    final word = TranslationRepo.translate(context);
    log(rh.deviceWidth(context).toString());
    return Scaffold(
      body: SafeArea(
        child: ResponsiveRowColumn(
            layout: rh.largerThanMobile(context) || rh.deviceLandScape(context)
                ? ResponsiveRowColumnType.ROW
                : ResponsiveRowColumnType.COLUMN,
            columnMainAxisAlignment: MainAxisAlignment.spaceEvenly,
            rowMainAxisAlignment: MainAxisAlignment.center,
            rowCrossAxisAlignment: CrossAxisAlignment.center,
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
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              word?.welcome ?? "Welcome",
                              style: TextStyle(
                                fontFamily: 'Kine',
                                fontSize: 50.0,
                              ),
                            ),
                            Container(
                              width: rh.deviceLandScape(context)
                                  ? rh.deviceWidth(context) * 0.4
                                  : null,
                              child: Text(
                                word?.live_naturally ??
                                    "Live naturally, eat healthy, and be happy",
                                style: TextStyle(
                                    fontFamily: 'Kine',
                                    fontSize: 20.0,
                                    color: colorScheme(context)
                                        .onBackground
                                        .withOpacity(0.3)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: ({
                          required void Function() onPressed,
                          required bool isLoading,
                          required String text,
                          Color? color,
                          Color? textColor,
                          double width = 350,
                          required BuildContext context,
                        }) {
                          final theme = Theme.of(context).colorScheme;
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: MaterialButton(
                              onPressed: onPressed,
                              color: color ?? theme.primaryContainer,
                              elevation: 0,
                              minWidth: width,
                              height: 60,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: isLoading
                                  ? const CircularProgressIndicator(
                                      color: Colors.white,
                                    )
                                  : Text(
                                      text,
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: textColor ??
                                              theme.onPrimaryContainer),
                                    ),
                            ),
                          );
                        }(
                            onPressed: () {
                              context.push("/register");
                            },
                            isLoading: isLoading,
                            width: rh.deviceLandScape(context)
                                ? rh.deviceWidth(context) / 2.4
                                : 360,
                            text: word?.get_started ?? "Get Started",
                            context: context),
                      ),
                      SizedBox(height: 20.0),
                      GestureDetector(
                        onTap: () {
                          context.push("/login");
                        },
                        child: Center(
                          child: Text(
                            word?.have_an_account ?? "Have an account?",
                            style:
                                TextStyle(fontFamily: 'Kine', fontSize: 18.0),
                          ),
                        ),
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
