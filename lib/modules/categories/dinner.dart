import '../../translations/locale_keys.g.dart';
import 'breakfast.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class Dinner extends StatelessWidget {
  const Dinner({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.Dinner.tr()),
        centerTitle: true,
        elevation: 1.2,
        // ignore: use_full_hex_values_for_flutter_colors
      ),
        body: OrientationBuilder(
          builder: ((context, orientation) => 
          GridView.count(crossAxisCount: orientation == Orientation.portrait ? 1 : 2, 
          children: [
              Category(
                url: 'https://www.youtube.com/watch?v=-oxjhgVp4y4',
                image: 'assets/images/calories/dinner/mush.jpg',
                name: LocaleKeys.Wild_Mushroom_Risotto.tr(),
              ),
            Category(
              url: 'https://www.youtube.com/watch?v=vUcP8tYFvio',
              image: 'assets/images/calories/dinner/salad.jpg',
                name: LocaleKeys.Grilled_Steak_Tortilla_Salad.tr(),
            ),
            Category(
              url: 'https://www.youtube.com/watch?v=CbzOZVC-la0',
              image: 'assets/images/calories/dinner/shrimp.jpg',
                name: LocaleKeys.Feta_Shrimp_and_Polenta.tr(),
            ),
            Category(
              url: 'https://www.youtube.com/watch?v=mTwBK39EWok',
              image: 'assets/images/calories/dinner/mike.jpg',
                name: LocaleKeys.Black_Bean_Soup.tr(),
            ),
            Category(
              url: 'https://www.youtube.com/watch?v=_v8uQPFp2ZA',
              image: 'assets/images/calories/dinner/bass.jpg',
                name: LocaleKeys.Bass_With_Radish_Salsa.tr(),
            ),
            Category(
              url: 'https://www.youtube.com/watch?v=6JfeZL14L48',
              image: 'assets/images/calories/dinner/eggplant.jpg',
                name: LocaleKeys.Eggplant_Parmesan.tr(),
            ),
          ],)),
        ),);
  }
}
