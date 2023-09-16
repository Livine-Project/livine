import '../../../constants/constants.dart';
import '../../../translations/domain/translation_provider.dart';
import 'breakfast.dart';
import 'package:flutter/material.dart';

class Dinner extends StatelessWidget {
  const Dinner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final word = TranslationRepo.translate(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(word?.dinner ?? ''),
        centerTitle: true,
        elevation: 1.2,
        // ignore: use_full_hex_values_for_flutter_colors
      ),
      body: OrientationBuilder(
        builder: ((context, orientation) => RawScrollbar(
              thumbColor: colorScheme(context).tertiary,
              thickness: 5,
              radius: const Radius.circular(10),
              child: GridView.count(
                crossAxisCount: rh.responsiveMeals(context),
                childAspectRatio: 0.6,
                children: [
                  Category(
                    url: 'https://www.youtube.com/watch?v=-oxjhgVp4y4',
                    image:
                        'https://cupfulofkale.com/wp-content/uploads/2020/05/Creamy-Vegan-Wild-Mushroom-Risotto-720x720.jpg',
                    name: word?.wild_Mushroom_Risotto,
                  ),
                  Category(
                    url: 'https://www.youtube.com/watch?v=vUcP8tYFvio',
                    image:
                        'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/grilled-steak-tortilla-salad-ghk-0528-1524087142.jpg',
                    name: word?.grilled_Steak_Tortilla_Salad,
                  ),
                  Category(
                    url: 'https://www.youtube.com/watch?v=CbzOZVC-la0',
                    image:
                        'https://lh3.googleusercontent.com/KVT4ysmiAxfi-Bc-AvHPiVSznpfa7vsTF_lJzuJSnaY_uG0HOFnf4_GPbIsHfzkvWMdgr-Eih2UNptvMAD91gg=w1280-h1280-c-rj-v1-e365',
                    name: word?.feta_Shrimp_and_Polenta,
                  ),
                  Category(
                    url: 'https://www.youtube.com/watch?v=mTwBK39EWok',
                    image:
                        'https://hips.hearstapps.com/delish/assets/17/37/1505337479-black-bean-soup-delish-1.jpg',
                    name: word?.black_Bean_Soup,
                  ),
                  Category(
                    url: 'https://www.youtube.com/watch?v=_v8uQPFp2ZA',
                    image:
                        'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/striped-bass-radish-salsa-verde-ghk-0519-1556659527.jpg',
                    name: word?.bass_With_Radish_Salsa,
                  ),
                  Category(
                    url: 'https://www.youtube.com/watch?v=6JfeZL14L48',
                    image:
                        'https://assets.bonappetit.com/photos/57d9d24d5a14a530086ef7bf/8:5/w_2311,h_1444,c_limit/bas-best-eggplant-parmesan.jpg',
                    name: word?.eggplant_Parmesan,
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
