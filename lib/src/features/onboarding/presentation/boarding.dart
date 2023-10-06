// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:go_router/go_router.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../../../constants/constants.dart';
import '../../../shared/cache/cache_helper.dart';

class OnBoarding extends StatelessWidget {
  OnBoarding({Key? key}) : super(key: key);
  final List<String> images = [
    'livine',
    'healthyoptions',
    'stability',
    'content'
  ];
  final List<String> heading = [
    'Welcome to Livine',
    "We've plenty of healthy options",
    "We assure that you gonna have a Flexible Lifestyle",
    "You can change your content for your health situation "
  ];
  final List<String> headingInArabic = [
    'مرحبا بكم في كالازا',
    "لدينا الكثير من الخيارات الصحية",
    "نؤكد أنه سيكون لديك أسلوب حياة مرن",
    "يمكنك تغيير المحتوى الخاص بك لوضعك الصحي "
  ];
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
        globalBackgroundColor: Theme.of(context).colorScheme.background,
        done: Text("Done"),
        dotsDecorator: DotsDecorator(
          color: Theme.of(context).colorScheme.onSurface,
          activeColor: Theme.of(context).colorScheme.primary,
        ),
        animationDuration: 350,
        onDone: () {
          context.go('/choose_content');
          CacheHelper.setBool("isBoarded", true);
        },
        skip: Text("Skip"),
        next: Text("Next"),
        onSkip: () {
          context.go('/choose_content');
          CacheHelper.setBool("isBoarded", true);
        },
        showSkipButton: true,
        
        pages: [
          for (int i = 0; i < images.length; i++)
            PageViewModel(
              decoration: PageDecoration(),
              title: images[i].toUpperCase(),
              body: heading[i],
              image: Center(
                  child: SvgPicture.asset(
                      'assets/images/onboarding/${images[i]}.svg')),
            ),
        ]);
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
            Flexible(
              flex: 2,
              child: SvgPicture.asset(
                url,
                height: 250.0,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                color: textColor,
              ),
            ),
            Spacer(flex: 1)
          ],
        ),
      ),
    );
  }
}
