// ignore_for_file: depend_on_referenced_packages, prefer_typing_uninitialized_variables, type_annotate_public_apis, dead_code

import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../ads/ads_help.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../Others/loading.dart';
import '../Others/notification.dart';
import '../recipe/recipe.dart';

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
  void dispose() {
    _nativeAdBanner.dispose();
    super.dispose();
  }
  @override
  void initState() {
    showNotification();
    nativeBannerFunction();
    super.initState();
  }
  

  late BannerAd _nativeAdBanner;

  bool _isnativeBannerAdLoaded = false;

  void nativeBannerFunction() {
    _nativeAdBanner = BannerAd(
      adUnitId: AdHelper.nativeadunit,
      size: AdSize.largeBanner,
      request: AdRequest(),
      listener: BannerAdListener(onAdLoaded: (_){
        setState(() {
          _isnativeBannerAdLoaded = true;
        });
      },
      onAdFailedToLoad: (ad,error){
        ad.dispose();
      }
      )
    );
    _nativeAdBanner.load();
  }

  @override
  Widget build(BuildContext context) {
    // final List icons = [
    //   FontAwesomeIcons.hamburger,
    //   FontAwesomeIcons.pizzaSlice,
    //   FontAwesomeIcons.birthdayCake
    // ];
    // final List names = [
    //   'Covid',
    //   'Anemia',
    //   'Diabetes',
    //   'Flu',
    //   'Malaria',
    //   'Dengue',
    //   'Stroke',

    //   // AppLocalizations.of(context).salad,
    //   // AppLocalizations.of(context).burger,
    //   // AppLocalizations.of(context).pancake
    // ];

    int screenCrossCount(){
      if (ResponsiveWrapper.of(context).isTablet && ResponsiveWrapper.of(context).orientation == Orientation.portrait) {
       return 4;
  
      }
      else if (ResponsiveWrapper.of(context).orientation == Orientation.landscape && ResponsiveWrapper.of(context).isTablet){
        return 6;
      }

      else if (ResponsiveWrapper.of(context).isMobile && ResponsiveWrapper.of(context).orientation == Orientation.portrait) {
        return 2;
      }
      else if(ResponsiveWrapper.of(context).orientation == Orientation.landscape){
        return 4;
      }

      return 2;

    }

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

              ],
            ),
            //TODO:UNCOMMENT THIS WHEN THE APP IS ON GOOGLEPLAY
            
            _isnativeBannerAdLoaded
                ? Container(
                  height: _nativeAdBanner.size.height.toDouble(),
                  width:  _nativeAdBanner.size.width.toDouble(),
                  
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
                      child: OrientationBuilder(
                        builder: (context, orientation) =>
                          

                        GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            // crossAxisCount: ResponsiveWrapper.of(context).isTablet ? 4 : 2,
                            crossAxisCount: screenCrossCount(),
                            // crossAxisCount: orientation == Orientation.portrait? 2 : 4,
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
    final size = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.grey[400]
              : Colors.blue[900],
          borderRadius: BorderRadius.circular(10.0),
        ),
        width: size,
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
              onTap: () => context.push('/details',extra: widget.id),
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
