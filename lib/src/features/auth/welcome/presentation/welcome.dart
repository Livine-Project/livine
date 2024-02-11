import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:livine/src/common_widgets/auth/auth_widget.dart';
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
                                word!.live_naturally,
                                style: TextStyle(
                                    fontSize: 20.0,
                                    color: colorScheme(context)
                                        .onBackground
                                        .withOpacity(0.3)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.0),
                      CustomButton(
                          onPressed: () => context.push("/register"),
                          text: word!.get_started,
                          context: context),
                      SizedBox(height: 20.0),
                      GestureDetector(
                        onTap: () => context.push("/login"),
                        child: Text(
                          word.have_an_account,
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
