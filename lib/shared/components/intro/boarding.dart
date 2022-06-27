// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:go_router/go_router.dart';

import 'package:concentric_transition/concentric_transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/constants.dart';
import '../../styles/colors.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List images = ['livine', 'healthyoptions', 'stability', 'content'];
    final List heading = [
      'Welcome to Livine',
      "We've plenty of healthy options",
      "We assure that you gonna have a Flexible Lifestyle",
      "You can change your content for your health situation "
    ];
    final List<Color> textColors = [
      Colors.black,
      Colors.black,
      Colors.white,
      Colors.black
    ];
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: ConcentricPageView(
        duration: Duration(milliseconds:1200 ),
        colors: <Color>[Colors.white, primaryColor, thirdColor, primaryColor],
        radius: screenWidth * 0.1,
        onFinish: () => context.goNamed('Content'),
        nextButtonBuilder: (context) => Padding(
          padding: const EdgeInsets.only(left: 3), // visual center
          child: Icon(
            Icons.navigate_next,
            size: screenWidth * 0.08,
          ),
        ),
        itemBuilder: (int index) {
          return IntroScreens(
              text: heading[index],
              url: 'assets/images/onboarding/${images[index]}.svg',
              textColor: textColors[index]);
        },
      ),
    );
  }
}

class IntroScreens extends StatelessWidget {
  const IntroScreens({
    Key? key,
    required this.text,
    required this.url,
    required this.textColor,
  }) : super(key: key);

  final String text;
  final String url;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: rh.deviceHeight(context) / 8),
        child: Column(
          children: [
            SvgPicture.asset(
              url,
              height: 250.0,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                fontFamily: 'Kine',
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
