import '../../../constants/constants.dart';
import '../../../translations/domain/translation_provider.dart';
import 'breakfast.dart';
import 'package:flutter/material.dart';

class Snacks extends StatelessWidget {
  const Snacks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final word = TranslationRepo.translate(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(word?.snacks ?? ''),
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
                    url: 'https://www.youtube.com/watch?v=DeeBmd7OaX0',
                    image:
                        'https://www.unlockfood.ca/EatRightOntario/media/Website-images-resized/All-about-Nuts-resized.jpg',
                    name: word?.mixed_Nuts,
                  ),
                  Category(
                    url:
                        'https://www.youtube.com/results?search_query=Red+pepper+guacamole',
                    image:
                        'https://www.thefullhelping.com/wp-content/uploads/2013/02/IMG_3904.jpg',
                    name: word?.red_pepper_guacamole,
                  ),
                  Category(
                    url: 'https://www.youtube.com/watch?v=z0uTL_ZOOoY',
                    image:
                        'https://recipeforperfection.com/wp-content/uploads/2019/01/Very-Berry-Yogurt-Bowl.jpg',
                    name: word?.yogurt_with_mixed_berries,
                  ),
                  Category(
                    url: 'https://www.youtube.com/watch?v=iD2HVkiE_us',
                    image:
                        'https://www.checkyourfood.com/content/blob/Meals/Apple-and-peanut-butter-recipe-calories-nutrition-facts.jpg',
                    name: word?.apple_slices_with_peanut,
                  ),
                  Category(
                    url: 'https://www.youtube.com/watch?v=SW0UkfgrQNg',
                    image:
                        'https://cdn.shopify.com/s/files/1/2836/2982/products/cottage-cheese-1_large.jpg?v=1529434175',
                    name: word?.cottage_cheese,
                  ),
                  Category(
                    url: 'https://www.youtube.com/watch?v=PztY4NAyqoI',
                    image:
                        'https://lh3.googleusercontent.com/DrzBVaJUqxL6ze1_xMZ6etzPZiePc8gJiXvi6L0npLhn7aXpq-gH7LbQxe6UzwmleXxuqkEV2-PztSXCshtyl3p5ovEYA2IALzk=w1280-h960-c-rj-v1-e365',
                    name: word?.celery_sticks_with_Cheese,
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
