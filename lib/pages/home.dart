// ignore_for_file: depend_on_referenced_packages, prefer_typing_uninitialized_variables, type_annotate_public_apis

import '../ads/ads_help.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../Others/loading.dart';
import '../Others/notification.dart';
import '../Others/search.dart';
import '../recipe/recipe.dart';
import '../responsive/orientation_layout.dart';
import '../responsive/screen_type_layout.dart';
import '../responsive/tablet.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:like_button/like_button.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    showNotification();
    nativeBannerFunction();
    super.initState();
  }

  late NativeAd _nativeAdBanner;

  bool _isnativeBannerAdLoaded = false;

  void nativeBannerFunction() {
    _nativeAdBanner = NativeAd(
      adUnitId: AdHelper.nativeadunit,
      factoryId: "livineAdUnit",
      listener: NativeAdListener(onAdLoaded: (_) {
        setState(() {
          _isnativeBannerAdLoaded = true;
        });
      }, onAdFailedToLoad: (ad, error) {
        ad.dispose();
        print(error);
      }),
      request: AdRequest(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List icons = [
      FontAwesomeIcons.hamburger,
      FontAwesomeIcons.pizzaSlice,
      FontAwesomeIcons.birthdayCake
    ];
    final List names = [
      'Covid',
      'Anemia',
      'Diabetes',
      'Flu',
      'Malaria',
      'Dengue',
      'Stroke',

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
    List<dynamic> icons,
    List<dynamic> names,
    BuildContext context,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? Colors.grey[900]
          // ignore: use_full_hex_values_for_flutter_colors
          : Color(0xfff4895ef),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, left: 20.0),
                  child: Text(
                    "Welcome,",
                    style: TextStyle(fontSize: 24.0, color: Colors.white),
                  ),
                ),
                Consumer(
                  builder: (context, ref, child) {
                    //TODO: Fix That
                    final recipesData = ref.watch(recipesProvider);
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: 40.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          iconSize: 25.0,
                          color: Colors.black,
                          icon: Icon(Icons.search),
                          onPressed: () {
                            showSearch(
                              context: context,
                              delegate:
                                  DataSearch(recipesSearch: recipesData.value),
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            _isnativeBannerAdLoaded
                ? Container(
                    child: AdWidget(ad: _nativeAdBanner),
                  )
                : LoadingAdWidget(),
            Consumer(
              builder: (context, ref, child) {
                final recipesData = ref.watch(recipesProvider);
                return recipesData.when(
                 
                  data: (data) => Expanded(
                    flex: 2,
                    child: RefreshIndicator(
                      onRefresh: () async{
                        return await ref.refresh(recipesProvider);
                      },
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 5 / 7,
                        ),
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return RecipeCardNormal(
                            id: data[index].id,
                            name: data[index].name,
                            foodImage: CachedNetworkImageProvider(
                              
                              'https://livine.pythonanywhere.com/${data[index].imageURL}',
                              maxWidth: 650,
                            ),
                            type: data[index].type,
                            rating: data[index].rating,
                          );
                        },
                      ),
                    ),
                  ),
                  loading: () => Loading(),
                  error: (e, s) {
                    // ignore: avoid_print
                    print('$e\n$s');
                    return Text(e.toString());
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class LoadingAdWidget extends StatelessWidget {
  const LoadingAdWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.grey[400]
              : Colors.blue[900],
          borderRadius: BorderRadius.circular(10.0),
        ),
        width: 350,
        height: 120,
        child: Center(
            child: Text(
          "Ad is Loading...",
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        )),
      ),
    );
  }
}

Stack wideHome(List<dynamic> icons, List<dynamic> names, BuildContext context) {
  return Stack(
    fit: StackFit.expand,
    children: [
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 120.0),
            child: Center(
              child: SizedBox(
                height: 100.0,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Categories(
                      text: '${names[index]}',
                    );
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 3 / 4,
                crossAxisCount: 2,
              ),
              shrinkWrap: true,
              children: <Widget>[
                RecipeCardNormal(
                  id: 1,
                  name: AppLocalizations.of(context)!.salad,
                  foodImage: AssetImage('images/recipes/salad.png'),
                  rating: '2.8',
                  type: 'Starter',
                ),
                RecipeCardNormal(
                  id: 1,
                  name: 'Spaghetti',
                  foodImage: AssetImage('images/recipes/spaghetti.png'),
                  rating: '4.6',
                  type: 'Starter',
                ),
                RecipeCardNormal(
                  id: 1,
                  name: 'Rice',
                  foodImage: AssetImage('images/recipes/rice.png'),
                  rating: '5',
                  type: 'Starter',
                ),
                RecipeCardNormal(
                  id: 1,
                  name: 'Beans',
                  foodImage: AssetImage('images/recipes/beans.png'),
                  rating: '1.5',
                  type: 'Starter',
                ),
              ],
            ),
          ),
        ],
      ),
    ],
  );
}

class RecipeCardNormal extends StatefulWidget {
  const RecipeCardNormal({
    Key? key,
    required this.id,
    required this.name,
    required this.foodImage,
    required this.type,
    required this.rating,
  }) : super(key: key);

  final id;
  final name;
  final foodImage;
  final type;
  final rating;

  @override
  State<RecipeCardNormal> createState() => _RecipeCardNormalState();
}

class _RecipeCardNormalState extends State<RecipeCardNormal> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Material(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.grey[800]
                // ignore: use_full_hex_values_for_flutter_colors
                : Color(0xfff4cc9f0),
            borderRadius: BorderRadius.circular(15.0),
            child: InkWell(
              splashColor: Colors.orange[600],
              onTap: () => Navigator.pushNamed(
                context,
                '/details',
                arguments: widget.id,
              ),
              borderRadius: BorderRadius.circular(15.0),
              child: Container(
                padding: EdgeInsets.only(top: 5.0),
                height: 230.0,
                width: 150.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  image: DecorationImage(
                    image: widget.foodImage,
                    scale: 5.0,
                  ),
                ),
                child: Column(
                  children: [
                    Expanded(
                      flex: 0,
                      child: FittedBox(
                        child: Text(
                          '${widget.name}',
                          style: TextStyle(
                            fontSize: 17.0,
                            color: Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Text(
                        '${widget.type}',
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
                              child: LikeButton(
                                likeBuilder: (isLiked) {
                                  return Icon(
                                    FontAwesomeIcons.solidHeart,
                                    color: isLiked
                                        ? Colors.blueAccent[700]
                                        : Colors.grey[350],
                                  );
                                },
                              ),
                            ),
                          ),
                          Text(
                            '${widget.rating}',
                            style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                            ),
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
  const Categories({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        // ignore: avoid_print
        onTap: () => print("Hello"),
        child: Container(
          width: 50.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.grey[400]
                : Colors.orange[100],
          ),
          child: FittedBox(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                text,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({
    Key? key,
    required this.text,
    required this.size,
  }) : super(key: key);

  final String text;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Text(
        AppLocalizations.of(context)!.heyIwant,
        style: TextStyle(
          fontSize: size,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
