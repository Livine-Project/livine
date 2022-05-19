import 'package:easy_localization/easy_localization.dart';

import '../../translations/locale_keys.g.dart';
import 'breakfast.dart';
import 'package:flutter/material.dart';

class Snacks extends StatelessWidget {
  const Snacks({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
          return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.Snacks.tr()),
        centerTitle: true,
        elevation: 1.2,
        // ignore: use_full_hex_values_for_flutter_colors
      ),
        body: OrientationBuilder(
          builder: ((context, orientation) => 
          GridView.count(crossAxisCount: orientation == Orientation.portrait ? 1 : 2, 

        children: [
            Category(
              url: 'https://www.youtube.com/watch?v=DeeBmd7OaX0',
              image: 'assets/images/calories/snacks/nuts.jpg',
              name: LocaleKeys.Mixed_Nuts.tr(),
            ),
          Category(
            url: 'https://www.youtube.com/results?search_query=Red+pepper+guacamole',
            image: 'assets/images/calories/snacks/red.jpg',
              name: LocaleKeys.Red_pepper_guacamole.tr(),
          ),
          Category(
            url: 'https://www.youtube.com/watch?v=z0uTL_ZOOoY',
            image: 'assets/images/calories/snacks/yogurt.jpg',
              name: LocaleKeys.Yogurt_with_mixed_berries.tr(),
          ),
          Category(
            url: 'https://www.youtube.com/watch?v=iD2HVkiE_us',
            image: 'assets/images/calories/snacks/apple.jpg',
              name: LocaleKeys.Apple_slices_with_peanut.tr(),
          ),
          Category(
            url: 'https://www.youtube.com/watch?v=SW0UkfgrQNg',
            image: 'assets/images/calories/snacks/cottage.jpg',
              name: LocaleKeys.Cottage_cheese.tr(),
          ),
          Category(
            url: 'https://www.youtube.com/watch?v=PztY4NAyqoI',
            image: 'assets/images/calories/snacks/cheese.jfif',
              name: LocaleKeys.Celery_sticks_with_Cheese.tr(),
          ),
        ],)),
        ),
          
        );
  }
}
