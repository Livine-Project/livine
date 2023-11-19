import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter/material.dart';
import 'package:livine/src/shared/styles/svg_color.dart';

import '../../../constants/constants.dart';
import '../data/boarding.dart';

class OnBoarding extends HookWidget {
  OnBoarding({Key? key}) : super(key: key);
  // final List<String> images = [
  //   'livine',
  //   'healthyoptions',
  //   'stability',
  //   'content'
  // ];
  // final List<String> heading = [
  //   'Welcome to Livine',
  //   "We've plenty of healthy options",
  //   "We assure that you gonna have a Flexible Lifestyle",
  //   "You can change your content for your health situation "
  // ];
  // final List<String> headingInArabic = [
  //   'مرحبا بكم في كالازا',
  //   "لدينا الكثير من الخيارات الصحية",
  //   "نؤكد أنه سيكون لديك أسلوب حياة مرن",
  //   "يمكنك تغيير المحتوى الخاص بك لوضعك الصحي "
  // ];

  // final List<Color
  @override
  Widget build(BuildContext context) {
    final _pageController = usePageController();
    final _currentIndex = useState<int>(0);
    final _percentage = useState<double>(0.25);
    final List<BoardingItem> items = [
      BoardingItem(
        title: "Welcome",
        description:
            "Let's get started on a flavorful and nutritious adventure together",
        image: "welcome",
        color: colorScheme(context).primary,
        imageColor: colorScheme(context).onPrimaryContainer,
        imageChangeColor: '#75e883',
      ),
      BoardingItem(
        title: "Explore Nutrient Recipes",
        description:
            "Discover a world of vibrant and nutrient-packed recipes tailored just for you",
        image: "explore",
        color: colorScheme(context).secondary,
        imageColor: colorScheme(context).onSecondaryContainer,
        imageChangeColor: '#75e883',
      ),
      BoardingItem(
        title: "Personalize Your Wellness Journey",
        description:
            "Customize your Nourishify experience to match your unique health goals and preferences",
        image: "personalize",
        color: colorScheme(context).tertiaryContainer,
        imageColor: colorScheme(context).onTertiaryContainer,
        imageChangeColor: '#75e883',
      ),
      BoardingItem(
        title: "Cook, Share, and Thrive",
        description:
            "Cook up delicious meals, share with your friends, and thrive on the positive energy of a healthy lifestyle.",
        image: "cooking",
        color: colorScheme(context).surface,
        imageColor: colorScheme(context).onSurface,
        imageChangeColor: '#75e883',
      ),
    ];

    return Scaffold(
      backgroundColor: items[_currentIndex.value].color,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                flex: 5,
                child: PageView.builder(
                    controller: _pageController,
                    itemCount: items.length,
                    onPageChanged: (index) {
                      if (index >= _currentIndex.value) {
                        _currentIndex.value = index;
                        _percentage.value += 0.25;
                      } else {
                        _currentIndex.value = index;
                        _percentage.value -= 0.25;
                      }
                    },
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment:
                            _currentIndex.value == 0 || _currentIndex.value == 3
                                ? CrossAxisAlignment.end
                                : CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(items[index].title,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 28.0,
                                        letterSpacing: 0.24,
                                        color: items[index].imageColor)),
                                const SizedBox(height: 12),
                                Text(items[index].description,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18.0,
                                        color: items[index]
                                            .imageColor
                                            .withOpacity(0.8))),
                              ],
                            ),
                          ),
                          Expanded(
                            child: SvgAssetImage(
                              alignment: Alignment.center,
                              assetName:
                                  'assets/images/onboarding/${items[index].image}.svg',
                              color: items[index].imageColor,
                              colorChange: items[index].imageChangeColor,
                            ),
                          ),
                        ],
                      );
                    })),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: List.generate(
                          items.length,
                          (index) => buildDot(index, context,
                              _currentIndex.value, items[index].imageColor),
                        ),
                      ),
                      const SizedBox(height: 10),
                      CupertinoButton(
                        onPressed: () {
                          context.push('/choose_content');
                        },
                        child: Text(
                          "Skip",
                          style: TextStyle(
                            color: colorScheme(context).onBackground,
                          ),
                        ),
                      ),
                    ],
                  ),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      if (_currentIndex.value == items.length - 1) {
                        context.push('/choose_content');
                      }
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          height: 55,
                          width: 55,
                          child: CircularProgressIndicator(
                            value: _percentage.value,
                            backgroundColor: items[_currentIndex.value]
                                .imageColor
                                .withOpacity(0.5),
                            valueColor: AlwaysStoppedAnimation<Color>(
                                items[_currentIndex.value].imageColor),
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: colorScheme(context).onBackground,
                          child: Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: items[_currentIndex.value].color,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}

AnimatedContainer buildDot(
    int index, BuildContext context, int currentIndex, Color color) {
  return AnimatedContainer(
    duration: const Duration(milliseconds: 500),
    curve: Curves.easeInOut,
    height: 8,
    width: currentIndex == index ? 24 : 8,
    margin: const EdgeInsets.only(right: 8),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: currentIndex == index ? color : color.withOpacity(0.6),
    ),
  );
}
