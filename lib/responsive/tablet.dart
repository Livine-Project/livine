import 'package:app/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Scaffold tabletHome(
    List<dynamic> icons, List<dynamic> names, BuildContext context) {
  return Scaffold(
    backgroundColor: Theme.of(context).brightness == Brightness.dark
        ? Colors.grey[900]
        : Color(0xfff4895EF),
    body: Stack(
      fit: StackFit.expand,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 120.0),
              child: Center(
                child: Container(
                  height: 100.0,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Categories(
                          icon: icons[index],
                          text: names[index],
                          size: 15.0,
                        );
                      }),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 3 / 4,
                      crossAxisCount: 4,
                      crossAxisSpacing: 0),
                  shrinkWrap: true,
                  children: <Widget>[
                    RecipeCardNormal(
                      name: AppLocalizations.of(context).salad,
                      foodImage: AssetImage('images/recipes/salad.png'),
                      rating: '2.8',
                      type: 'Starter',
                    ),
                    RecipeCardNormal(
                      name: 'Spaghetti',
                      foodImage: AssetImage('images/recipes/spaghetti.png'),
                      rating: '4.6',
                      type: 'Starter',
                    ),
                    RecipeCardNormal(
                      name: 'Rice',
                      foodImage: AssetImage('images/recipes/rice.png'),
                      rating: '5',
                      type: 'Starter',
                    ),
                    RecipeCardNormal(
                      name: 'Beans',
                      foodImage: AssetImage('images/recipes/beans.png'),
                      rating: '1.5',
                      type: 'Starter',
                    ),
                  ]),
            ),
          ],
        ),

      ],
    ),
  );
}
