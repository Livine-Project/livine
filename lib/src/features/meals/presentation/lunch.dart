import '../../../constants/constants.dart';
import '../../../translations/domain/translation_provider.dart';
import 'breakfast.dart';
import 'package:flutter/material.dart';

class Lunch extends StatelessWidget {
  const Lunch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final word = TranslationRepo.translate(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(word?.lunch ?? "Lunch"),
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
                    url: 'https://www.youtube.com/watch?v=PAELd9i4yWY',
                    image:
                        'https://www.acouplecooks.com/wp-content/uploads/2019/01/Crispy-Cauliflower-Tacos-036.jpg',
                    name: word?.roasted_Cauliflower_Tacos,
                  ),
                  Category(
                    url: 'https://www.youtube.com/watch?v=179z0T5SnbQ',
                    image:
                        'https://tmbidigitalassetsazure.blob.core.windows.net/rms3-prod/attachments/37/1200x1200/exps63027_TH163620C11_10_3b.jpg',
                    name: word?.carrot_with_Radish_Salad,
                  ),
                  Category(
                    url: 'https://www.youtube.com/watch?v=vbV1h68Mnms',
                    image:
                        'https://www.primaverakitchen.com/wp-content/uploads/2020/01/Easy-Chopped-Salmon-Salad-Primavera-Kitchen-1.jpg',
                    name: word?.salmon_Salad,
                  ),
                  Category(
                    url: 'https://www.youtube.com/watch?v=J-Rn9DN3IjU',
                    image:
                        'https://static01.nyt.com/images/2015/07/08/dining/08APPE2/08APPE2-articleLarge.jpg',
                    name: word?.panzanella,
                  ),
                  Category(
                    url: 'https://www.youtube.com/watch?v=a4Z2x0sPq3A',
                    image:
                        'https://www.simplyrecipes.com/thmb/j1WtO-KNzo7D7e3j5skU2CIQGk4=/1800x1200/filters:fill(auto,1)/__opt__aboutcom__coeus__resources__content_migration__simply_recipes__uploads__2009__09__caesar-salad-horiz-a-1800-4a465eb53456465091e34138675259c2.jpg',
                    name: word?.caesar_Salad,
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
