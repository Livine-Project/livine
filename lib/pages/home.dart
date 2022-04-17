// ignore_for_file: depend_on_referenced_packages, prefer_typing_uninitialized_variables, type_annotate_public_apis, dead_code

import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../Others/colors.dart';
import '../ads/ads_help.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../Others/loading.dart';
import '../Others/notification.dart';
import '../main.dart';
import '../recipe/recipe.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../translations/locale_keys.g.dart';
import 'content/content.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //TODO: IN APP UPDATE
  // AppUpdateInfo? _updateInfo;
  // GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  // bool _flexibleUpdateAvailable = false;

  // Future<void> checkForUpdate() async {
  //   InAppUpdate.checkForUpdate().then((info) {
  //     setState(() {
  //       _updateInfo = info;
  //     });

  //   }).catchError((e) {
  //     showSnack(e.toString());
  //   });
  //             print(_updateInfo?.updateAvailability == UpdateAvailability.updateAvailable);

  // }

  // void showSnack(String text) {
  //   if (_scaffoldKey.currentContext != null) {
  //     ScaffoldMessenger.of(_scaffoldKey.currentContext!)
  //         .showSnackBar(SnackBar(content: Text(text)));
  //   }
  // }

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
        listener: BannerAdListener(onAdLoaded: (_) {
          setState(() {
            _isnativeBannerAdLoaded = true;
          });
        }, onAdFailedToLoad: (ad, error) {
          ad.dispose();
        }));
    _nativeAdBanner.load();
  }

  @override
  Widget build(BuildContext context) {
    int screenCrossCount() {
      if (ResponsiveWrapper.of(context).isTablet &&
          ResponsiveWrapper.of(context).orientation == Orientation.portrait) {
        return 4;
      } else if (ResponsiveWrapper.of(context).orientation ==
              Orientation.landscape &&
          ResponsiveWrapper.of(context).isTablet) {
        return 6;
      } else if (ResponsiveWrapper.of(context).isMobile &&
          ResponsiveWrapper.of(context).orientation == Orientation.portrait) {
        return 2;
      } else if (ResponsiveWrapper.of(context).orientation ==
          Orientation.landscape) {
        return 4;
      }

      return 2;
    }

    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? Colors.grey[900]
          // ignore: use_full_hex_values_for_flutter_colors
          : Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 15.0),
                  child: Text("${LocaleKeys.Welcome.tr()},",
                      style: TextStyle(fontSize: 45.0, fontFamily: 'Kine')),
                ),
              ],
            ),
            _isnativeBannerAdLoaded && testID != 10
                ? Container(
                    height: _nativeAdBanner.size.height.toDouble(),
                    width: _nativeAdBanner.size.width.toDouble(),
                    child: AdWidget(ad: _nativeAdBanner),
                  )
                : Container(),
            SizedBox(height: 20.0),
            Consumer(
              builder: (context, ref, child) {
                final recipesTypeData = ref.watch(userTypeProvider);
                final recipesData = ref.watch(recieveRecipesType(
                    recipesTypeData.isEmpty ? userType : recipesTypeData));

                return recipesData.when(
                    data: (data) => Expanded(
                          flex: 2,
                          child: RefreshIndicator(
                            onRefresh: () async {
                              return await ref.refresh(recieveRecipesType(
                                  recipesTypeData.isEmpty
                                      ? userType
                                      : recipesTypeData));
                            },
                            child: OrientationBuilder(
                              builder: (context, orientation) =>
                                  GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  // crossAxisCount: ResponsiveWrapper.of(context).isTablet ? 4 : 2,
                                  crossAxisCount: screenCrossCount(),
                                  // crossAxisCount: orientation == Orientation.portrait? 2 : 4,
                                  childAspectRatio: 5 / 7,
                                ),
                                itemCount: data.length,
                                itemBuilder: (context, index) {
                                  return RecipeCardNormal(
                                    id: data[index].id,
                                    name: context.locale.languageCode == "en"
                                        ? data[index].name
                                        : data[index].name_in_arabic,
                                    foodImage: CachedNetworkImageProvider(
                                      'https://livine.pythonanywhere.com${data[index].imageURL}',
                                      maxWidth: 650,
                                    ),
                                    type: context.locale.languageCode == "en"
                                        ? data[index].type
                                        : data[index].type_in_arabic,
                                    rating: data[index].rating,
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                    loading: () => Loading(),
                    error: (e, s) {
                      print('$e\n$s');
                      return Text(e.toString());
                    });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryFilter extends StatelessWidget {
  const CategoryFilter({
    Key? key,
    required this.name,
  }) : super(key: key);
  final name;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
        color: Color(0xFFF38A3A5),
      ),
      width: 100,
      height: 50,
      child: Center(
          child: Text(
        name,
        style:
            TextStyle(fontFamily: 'Kine', color: Colors.white, fontSize: 15.0),
      )),
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
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Material(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.grey[800]
                // ignore: use_full_hex_values_for_flutter_colors
                : primaryColor,
            borderRadius: BorderRadius.circular(15.0),
            child: InkWell(
              splashColor: Colors.orange[600],
              onTap: () => context.push('/details', extra: widget.id),
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
                            fontFamily: 'Kine',
                            fontSize: 17.0,
                            color:
                                Theme.of(context).brightness == Brightness.dark
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
                          fontFamily: 'Kine',
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          //TODO: Like Button
                          // Container(
                          //   padding: EdgeInsets.only(left: 5.0),
                          //   height: 320.0,
                          //   width: 70.0,
                          //   child: GestureDetector(
                          //     child: LikeButton(
                          //       likeBuilder: (isLiked) {
                          //         return Icon(
                          //           FontAwesomeIcons.solidHeart,
                          //           color: isLiked
                          //               ? Color(0xFF22577a)
                          //               : Colors.white,
                          //         );
                          //       },
                          //     ),
                          //   ),
                          // ),
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
