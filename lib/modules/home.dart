// ignore_for_file: depend_on_referenced_packages, prefer_typing_uninitialized_variables, type_annotate_public_apis, dead_code

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import '../models/ads/ads_help.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../shared/components/misc/loading.dart';
import '../shared/components/misc/notification.dart';
import '../main.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/recipe/recipe.dart';
import '../shared/components/recipe/recipe_card_widget.dart';

import '../shared/constants/constants.dart';
import '../translations/locale_keys.g.dart';
import 'content/content.dart';

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
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? Colors.grey[900]
          : Colors.white,
      body: SafeArea(
        child: Consumer(builder: (context, ref, child) {
          final recipesTypeData = ref.watch(userTypeProvider);
          final recipesData = ref.watch(recieveRecipesType(
              recipesTypeData.isEmpty ? userType : recipesTypeData));
          return LiquidPullToRefresh(
            onRefresh: () async {
              await Future.delayed(Duration(seconds: 2));
              return await ref.refresh(recieveRecipesType(
                  recipesTypeData.isEmpty ? userType : recipesTypeData));
            },
            height: 250,
            
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 15.0),
                child: Text("${LocaleKeys.Welcome.tr()},",
                    style: TextStyle(fontSize: 45.0, fontFamily: 'Kine')),
              ),
              if (_isnativeBannerAdLoaded && testID != 10 && kReleaseMode) ...[
                Container(
                  height: _nativeAdBanner.size.height.toDouble(),
                  width: _nativeAdBanner.size.width.toDouble(),
                  child: AdWidget(ad: _nativeAdBanner),
                ),
              ],
              SizedBox(height: 20.0),
              recipesData.when(
                data: (data) => Expanded(
                  flex: 2,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: rh.responsiveRecipes(context),
                      childAspectRatio: 5 / 7,
                    ),
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return RecipeCardNormal(
                        id: data[index].id,
                        name: context.locale.languageCode == "en"
                            ? data[index].name
                            : data[index].name_in_arabic,
                        foodImage:
                            'https://livine.pythonanywhere.com${data[index].coverURL}',
                        type: context.locale.languageCode == "en"
                            ? data[index].type
                            : data[index].type_in_arabic,
                        difficulty:
                            changeDiffName(data[index].difficulty, context),
                        time: context.locale.languageCode == "en"
                            ? data[index].time_taken.toString() + " min"
                            : data[index].time_taken.toString() + " دقيقة",
                        dImage:
                            changeDiffImage(difficulty: data[index].difficulty),
                      );
                    },
                  ),
                ),
                loading: () => Expanded(
                  flex: 2,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: rh.responsiveRecipes(context),
                      mainAxisSpacing: 20,
                      childAspectRatio: 5 / 7,
                    ),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return RecipeLoading();
                    },
                  ),
                ),
                error: (e, s) {
                  print('$e\n$s');
                  return Center(child: Text("An error occured"));
                },
              )
            ]),
          );
        }),
      ),
    );
  }
}