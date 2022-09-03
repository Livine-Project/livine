import 'package:easy_localization/easy_localization.dart';

import '../../../constants/constants.dart';
import '../../../translations/locale_keys.g.dart';
import 'breakfast.dart';
import 'package:flutter/material.dart';

class Lunch extends StatelessWidget {
  const Lunch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.Lunch.tr()),
        centerTitle: true,
        elevation: 1.2,
        // ignore: use_full_hex_values_for_flutter_colors
      ),
      body: OrientationBuilder(
        builder: ((context, orientation) => GridView.count(
              crossAxisCount: rh.responsiveMeals(context),
              children: [
                Category(
                  url: 'https://www.youtube.com/watch?v=PAELd9i4yWY',
                  image:
                      'https://www.acouplecooks.com/wp-content/uploads/2019/01/Crispy-Cauliflower-Tacos-036.jpg',
                  name: LocaleKeys.Roasted_Cauliflower_Tacos.tr(),
                ),
                Category(
                  url: 'https://www.youtube.com/watch?v=179z0T5SnbQ',
                  image:
                      'https://tmbidigitalassetsazure.blob.core.windows.net/rms3-prod/attachments/37/1200x1200/exps63027_TH163620C11_10_3b.jpg',
                  name: LocaleKeys.Carrot_with_Radish_Salad.tr(),
                ),
                Category(
                  url: 'https://www.youtube.com/watch?v=vbV1h68Mnms',
                  image:
                      'https://www.primaverakitchen.com/wp-content/uploads/2020/01/Easy-Chopped-Salmon-Salad-Primavera-Kitchen-1.jpg',
                  name: LocaleKeys.Salmon_Salad.tr(),
                ),
                Category(
                  url: 'https://www.youtube.com/watch?v=J-Rn9DN3IjU',
                  image:
                      'https://static01.nyt.com/images/2015/07/08/dining/08APPE2/08APPE2-articleLarge.jpg',
                  name: LocaleKeys.Panzanella.tr(),
                ),
                Category(
                  url: 'https://www.youtube.com/watch?v=a4Z2x0sPq3A',
                  image:
                      'https://www.simplyrecipes.com/thmb/j1WtO-KNzo7D7e3j5skU2CIQGk4=/1800x1200/filters:fill(auto,1)/__opt__aboutcom__coeus__resources__content_migration__simply_recipes__uploads__2009__09__caesar-salad-horiz-a-1800-4a465eb53456465091e34138675259c2.jpg',
                  name: LocaleKeys.Caesar_Salad.tr(),
                ),
              ],
            )),
      ),
    );
  }
}
