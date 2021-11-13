
import 'package:app/Others/loading.dart';
import 'package:app/Others/notification.dart';
import 'package:app/recipe/recipe.dart';
import 'package:app/responsive/orientation_layout.dart';
import 'package:app/responsive/screen_type_layout.dart';
import 'package:app/responsive/tablet.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';




class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  @override
  void initState() {
    
    showNotification();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final theme = Provider.of<ThemeChanger>(context);
    List icons = [
      FontAwesomeIcons.hamburger,
      FontAwesomeIcons.pizzaSlice,
      FontAwesomeIcons.birthdayCake
    ];
    List names = [
      'Humburger',
      'Pizza',
      'PanCake',
      // AppLocalizations.of(context).salad,
      // AppLocalizations.of(context).burger,
      // AppLocalizations.of(context).pancake
    ];

    return ScreenTypeLayout(
      mobile: OrientationLayout(
        portrait: normalHome(icons, names, context),
      ),
      tablet: OrientationLayout(
        portrait: tabletHome(icons, names, context),
      ),
    );
  }

  Scaffold normalHome(
      List<dynamic> icons, List<dynamic> names, BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? Colors.grey[900]
          : Color(0xfff4895EF),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                iconSize: 30.0,
                color: Colors.white,
                icon: Icon(Icons.search),
                onPressed: () {
                  // showSearch(
                  //     context: context,
                  //     delegate: DataSearch(recipesSearch: recipes));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
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
            Consumer(builder: (context, watch, child) {
              final recipesData = watch(recipesProvider);
              return recipesData.when(
                  data: (data) => Expanded(
                        flex: 2,
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, childAspectRatio: 5 / 7),
                          itemCount: data.length,
                          itemBuilder: (context, index) { 
                            return RecipeCardNormal(
                              name: data[index].name,
                              foodImage: CachedNetworkImageProvider(
                                  'https://livine.pythonanywhere.com/' +
                                      data[index].imageURL),
                              type: 'Covid',
                              rating: '4.2');},
                        ),
                      ),
                  loading: () => Loading(),
                  error: (e, s) {
                    print('$e\n$s');
                    return Text(e.toString());
                  });
            }),
          ],
        ),
      ),
    );
  }
}

Stack wideHome(List<dynamic> icons, List<dynamic> names, BuildContext context) {
  return Stack(
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
                    crossAxisCount: 2,
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
  );
}

class RecipeCardNormal extends StatelessWidget {
  const RecipeCardNormal({
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
          child: Material(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.grey[800]
                : Color(0xfff4CC9F0),
            borderRadius: BorderRadius.circular(15.0),
            child: InkWell(
              splashColor: Colors.orange[600],
              onTap: () => Navigator.pushNamed(context, '/details'),
              borderRadius: BorderRadius.circular(15.0),
              child: Container(
                padding: EdgeInsets.only(top: 5.0),
                height: 230.0,
                width: 150.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
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
                            child: GestureDetector(
                              onTap: () => debugPrint("Favorited"),
                              child: Icon(
                                FontAwesomeIcons.heart,
                                color: Colors.black,
                              ),
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
          ),
        ),
      ],
    );
  }
}

class Categories extends StatelessWidget {
  const Categories(
      {Key key, @required this.icon, @required this.text, @required this.size})
      : super(key: key);

  final IconData icon;
  final String text;
  final double size;

  @override
  Widget build(BuildContext context) {
    // final theme = Provider.of<ThemeChanger>(context);

    return Column(
      children: [
        Container(
          child: Icon(icon,
              size: 40.0,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black),
        ),
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
