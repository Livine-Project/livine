// ignore_for_file: prefer_typing_uninitialized_variables, type_annotate_public_apis

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Others/colors.dart';
import '../translations/locale_keys.g.dart';

class BreakFast extends StatelessWidget {
  BreakFast({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.Breakfast.tr()),
        centerTitle: true,
        elevation: 1.2,
        // ignore: use_full_hex_values_for_flutter_colors
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? Colors.grey[800]
            : secondaryColor,
      ),
      body: OrientationBuilder(
        builder: (context, orientation) => GridView.count(
          crossAxisCount: orientation == Orientation.portrait ? 1 : 2,
          physics: BouncingScrollPhysics(),
          children: [
            Category(
              url: 'https://www.youtube.com/watch?v=618QsMaVXp8',
              image: 'assets/images/calories/breakfast/shakshuka.jpg',
              name: LocaleKeys.Shakshuka.tr(),
            ),
            Category(
              url: 'https://www.youtube.com/watch?v=bXntiogB8rA',
              image: 'assets/images/calories/breakfast/crustless.jpg',
              name: LocaleKeys.Crustless_Quiche.tr(),
            ),
            Category(
              url: 'https://www.youtube.com/watch?v=n76noIAaAuY',
              image: 'assets/images/calories/breakfast/burrito.jpg',
              name: LocaleKeys.Burrito.tr(),
            ),
            Category(
              url: 'https://www.youtube.com/watch?v=4STUMnTxcsA',
              image: 'assets/images/calories/breakfast/blueberry.jpg',
              name: LocaleKeys.Baked_Oatmeal.tr(),
            ),
            Category(
              url: 'https://www.youtube.com/watch?v=Sncq3NLw_PY',
              image: 'assets/images/calories/breakfast/apple.jpg',
              name: LocaleKeys.Apple_Cinnamon_Oat.tr(),
            ),
            Category(
              url: 'https://www.youtube.com/watch?v=0W9lXaHcXL4',
              image: 'assets/images/calories/breakfast/banana.jpg',
              name: LocaleKeys.Banana_Bread.tr(),
            ),
            Category(
              url: 'https://www.youtube.com/watch?v=iR64hfkGQeU',
              image: 'assets/images/calories/breakfast/waffles.jpg',
              name: LocaleKeys.Waffles.tr(),
            ),
          ],
        ),
      ),
    );
  }
}

class Category extends StatelessWidget {
  const Category({
    Key? key,
    required this.image,
    required this.name,
    required this.url,
  }) : super(key: key);

  final image;
  final name;
  final url;

  _launchCategoryURL() async {
    try {
      await launch(url);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(25.0),
      child: GestureDetector(
        onTap: _launchCategoryURL,
        child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: 10.0,
          child: Column(
            children: [
              Image.asset(
                '$image',
                height: 260.0,
                width: 400.0,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 10.0),
              Text(
                name,
                style: TextStyle(fontSize: 17.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
