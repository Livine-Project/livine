import '../../../constants/constants.dart';
import '../../../translations/locale_keys.g.dart';
import 'breakfast.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class Dinner extends StatelessWidget {
  const Dinner({Key? key}) : super(key: key);

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
        builder: ((context, orientation) => GridView.count(
              crossAxisCount: rh.responsiveMeals(context),
              children: [
                Category(
                  url: 'https://www.youtube.com/watch?v=-oxjhgVp4y4',
                  image:
                      'https://cupfulofkale.com/wp-content/uploads/2020/05/Creamy-Vegan-Wild-Mushroom-Risotto-720x720.jpg',
                  name: LocaleKeys.Wild_Mushroom_Risotto.tr(),
                ),
                Category(
                  url: 'https://www.youtube.com/watch?v=vUcP8tYFvio',
                  image:
                      'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/grilled-steak-tortilla-salad-ghk-0528-1524087142.jpg',
                  name: LocaleKeys.Grilled_Steak_Tortilla_Salad.tr(),
                ),
                Category(
                  url: 'https://www.youtube.com/watch?v=CbzOZVC-la0',
                  image:
                      'https://363gtx1a8mj92o5fk42j3vm6-wpengine.netdna-ssl.com/wp-content/uploads/2020/01/Lemon-Feta-Polenta-with-Asparagus-and-Shrimp-2.jpg',
                  name: LocaleKeys.Feta_Shrimp_and_Polenta.tr(),
                ),
                Category(
                  url: 'https://www.youtube.com/watch?v=mTwBK39EWok',
                  image:
                      'https://hips.hearstapps.com/delish/assets/17/37/1505337479-black-bean-soup-delish-1.jpg',
                  name: LocaleKeys.Black_Bean_Soup.tr(),
                ),
                Category(
                  url: 'https://www.youtube.com/watch?v=_v8uQPFp2ZA',
                  image:
                      'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/striped-bass-radish-salsa-verde-ghk-0519-1556659527.jpg',
                  name: LocaleKeys.Bass_With_Radish_Salsa.tr(),
                ),
                Category(
                  url: 'https://www.youtube.com/watch?v=6JfeZL14L48',
                  image:
                      'https://assets.bonappetit.com/photos/57d9d24d5a14a530086ef7bf/8:5/w_2311,h_1444,c_limit/bas-best-eggplant-parmesan.jpg',
                  name: LocaleKeys.Eggplant_Parmesan.tr(),
                ),
              ],
            )),
      ),
    );
  }
}
