import 'package:easy_localization/easy_localization.dart';


import '../../translations/locale_keys.g.dart';
import 'breakfast.dart';
import 'package:flutter/material.dart';

class Lunch extends StatelessWidget {
  const Lunch({ Key? key }) : super(key: key);

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
          builder: ((context, orientation) => 
          GridView.count(crossAxisCount: orientation == Orientation.portrait ? 1 : 2, 

        children: [
            Category(
              url: 'https://www.youtube.com/watch?v=PAELd9i4yWY',
              image: 'assets/images/calories/lunch/tacos.jpg',
              name: LocaleKeys.Roasted_Cauliflower_Tacos.tr(),
            ),
          Category(
            url: 'https://www.youtube.com/watch?v=179z0T5SnbQ',
            image: 'assets/images/calories/lunch/salad.png',
            name: LocaleKeys.Carrot_with_Radish_Salad.tr(),
          ),
          Category(
            url: 'https://www.youtube.com/watch?v=vbV1h68Mnms',
            image: 'assets/images/calories/lunch/salmon.jpg',
            name: LocaleKeys.Salmon_Salad.tr(),
          ),
          Category(
            url: 'https://www.youtube.com/watch?v=J-Rn9DN3IjU',
            image: 'assets/images/calories/lunch/panzanella.jpg',
            name: LocaleKeys.Panzanella.tr(),
          ),
          Category(
            url: 'https://www.youtube.com/watch?v=a4Z2x0sPq3A',
            image: 'assets/images/calories/lunch/caesar.jpg',
            name: LocaleKeys.Caesar_Salad.tr(),
          ),
        ],
        )),
        ),
        );
  }
}
