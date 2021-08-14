import 'package:app/main.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class Home extends ConsumerWidget {

  @override
  Widget build(BuildContext context, watch) {

    // final theme = Provider.of<ThemeChanger>(context);
      
    List icons = [
      FontAwesomeIcons.hamburger,
      FontAwesomeIcons.pizzaSlice,
      FontAwesomeIcons.birthdayCake
    ];
    List names = [
      AppLocalizations.of(context).salad,
      AppLocalizations.of(context).burger,
      AppLocalizations.of(context).pancake
    ];
    return Scaffold(
      backgroundColor: context.read(themeProvider).themeMode == ThemeMode.dark
          ? Colors.grey[900]
          : Color(0xfff4895EF),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                            icon:icons[index], 
                            text:names[index], 
                            size:15.0,);
                        }),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: GridView(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: (5 / 7), crossAxisCount: 2),
                    shrinkWrap: true,
                    children: <Widget>[
                      RecipeCard(
                        name: AppLocalizations.of(context).salad,
                        foodImage: AssetImage('images/recipes/salad.png'),
                        rating: '2.8',
                        type: 'Starter',
                      ),
                      RecipeCard(
                        name: 'Spaghetti',
                        foodImage: AssetImage('images/recipes/spaghetti.png'),
                        rating: '4.6',
                        type: 'Starter',
                      ),
                      RecipeCard(
                        name: 'Rice',
                        foodImage: AssetImage('images/recipes/rice.png'),
                        rating: '5',
                        type: 'Starter',
                      ),
                      RecipeCard(
                        name: 'Beans',
                        foodImage: AssetImage('images/recipes/beans.png'),
                        rating: '1.5',
                        type: 'Starter',
                      ),
                    ]),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Container(
              height: 100.0,
              child: FloatingSearchBar(
                openAxisAlignment: 0.0,
                scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
                borderRadius: BorderRadius.circular(15.0),
                transitionCurve: Curves.easeInOutCubic,
                transition: CircularFloatingSearchBarTransition(),
                physics: const BouncingScrollPhysics(),
                builder: (context, index) => buildBody(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBody() {
    final time = DateTime.now();
    print('BuildBody at ${time.second}:${time.millisecond}');
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Material(
        child: Column(
          children: List.generate(5, (index) => index.toString())
              .map((e) => ListTile(
                    title: Text(e),
                  ))
              .toList(),
        ),
      ),
    );
  }
}

class RecipeCard extends StatelessWidget {
  const RecipeCard({
    Key key,
    @required this.name,
    @required this.foodImage,
    @required this.type,
    @required this.rating,
  }) : super(key: key);

  final name;
  final foodImage;
  final type;
  final rating;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Container(
            padding: EdgeInsets.only(top: 5.0),
            height: 230.0,
            width: 150.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Color(0xfff4CC9F0),
              image: DecorationImage(
                image: foodImage,
                scale: 5.0,
                
                
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 0,
                  child: Text(
                    name,
                    style: TextStyle(
                      fontSize: 17.0,
                      color: Colors.black,
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Text(
                    type,
                    style: TextStyle(
                      fontSize: 13.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 5.0),
                        height: 320.0,
                        width: 70.0,
                        child: Icon(
                          FontAwesomeIcons.heart,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        rating,
                        style: TextStyle(
                            fontSize: 30.0, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
class Categories extends StatelessWidget {
  const Categories({ 
    Key key,
    @required this.icon,
    @required this.text,
    @required this.size
    }) : super(key: key);

  final IconData icon;
  final String text;
  final double size;

  @override
  Widget build(BuildContext context) {
    // final theme = Provider.of<ThemeChanger>(context);

    return Column(
    children: [
      Container(
          child: Icon(
        icon,
        size: 40.0,
        // color: theme.getTheme() == ThemeData.dark() ?
        // Colors.white : 
        // Color(0xfff3A0CA3),

      )),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          text,
          style: TextStyle(fontSize: size),
        ),
      ),
    ],
  );
}
}

class Title extends StatelessWidget {
  const Title({
    Key key,
    @required this.text,
    @required this.size,
  }) : super(key: key);

  final String text;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Text(
        AppLocalizations.of(context).heyIwant,
        style: TextStyle(
          fontSize: size,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
