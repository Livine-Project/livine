// ignore_for_file: depend_on_referenced_packages, prefer_typing_uninitialized_variables, type_annotate_public_apis, dead_code

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../../models/user/user.dart';
import '../../shared/components/misc/loading.dart';
import '../../shared/components/misc/notification.dart';
import '../../main.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/recipe/recipe.dart';

import '../../shared/components/widgets/recipe/recipe_card_widget.dart';
import '../../shared/constants/constants.dart';
import '../../translations/locale_keys.g.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void dispose() async {
    adHelper.nativeAdBanner.dispose();
    adHelper.inlineBannerAd.dispose();
    super.dispose();
  }

  @override
  void initState() {
    showNotification();
    adHelper.nativeBannerFunction(setState);
    adHelper.inlineAdBanner(setState);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? Colors.grey[900]
          : Colors.white,
      body: SafeArea(
        child: Consumer(builder: (context, ref, child) {
          // print("UserType " + userType);
          final recipesTypeData = ref.watch(userTypeProvider);
          print("RecipesType" + recipesTypeData);

          final recipesData = ref.watch(recieveRecipesType(
              recipesTypeData.isEmpty ? userType : recipesTypeData));
          return LiquidPullToRefresh(
            animSpeedFactor: 2,
            onRefresh: () {
              return Future.delayed(Duration(seconds: 2)).then((_) =>
                  ref.refresh(recieveRecipesType(
                      recipesTypeData.isEmpty ? userType : recipesTypeData)));
            },
            height: 250,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 15.0),
                child: Text("${LocaleKeys.Welcome.tr()},",
                    style: TextStyle(fontSize: 40.0, fontFamily: 'Kine')),
              ),
              if (adHelper.isnativeBannerAdLoaded &&
                  testID != 10 &&
                  kReleaseMode) ...[
                Center(
                  child: Container(
                    height: adHelper.nativeAdBanner.size.height.toDouble(),
                    width: adHelper.nativeAdBanner.size.width.toDouble(),
                    child: AdWidget(ad: adHelper.nativeAdBanner),
                  ),
                ),
              ],
              SizedBox(height: 20.0),
              recipesData.when(
                data: (data) {
                  return Expanded(
                    flex: 2,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: rh.responsiveRecipes(context),
                        childAspectRatio: 5 / 7,
                      ),
                      itemCount: data.length +
                          (adHelper.isInlineBannerAdLoaded &&
                                  testID != 10 &&
                                  kReleaseMode
                              ? 1
                              : 0),
                      itemBuilder: (context, index) {
                        if (adHelper.isInlineBannerAdLoaded &&
                            index == adHelper.inlineAdIndex &&
                            testID != 10 &&
                            kReleaseMode) {
                          return Container(
                            width:
                                adHelper.inlineBannerAd.size.width.toDouble(),
                            height:
                                adHelper.inlineBannerAd.size.height.toDouble(),
                            child: AdWidget(ad: adHelper.inlineBannerAd),
                          );
                        } else {
                          final recipe =
                              data[adHelper.getListViewItemIndex(index)];
                          return RecipeCardNormal(
                            id: recipe.id,
                            name: context.locale.languageCode == "en"
                                ? recipe.name
                                : recipe.name_in_arabic,
                            foodImage: '$restAPIMedia/${recipe.coverURL}',
                            type: context.locale.languageCode == "en"
                                ? recipe.type
                                : recipe.type_in_arabic,
                            difficulty:
                                changeDiffName(recipe.difficulty, context),
                            time: context.locale.languageCode == "en"
                                ? recipe.time_taken.toString() + " min"
                                : recipe.time_taken.toString() + " دقيقة",
                            dImage:
                                changeDiffImage(difficulty: recipe.difficulty),
                          );
                        }
                      },
                    ),
                  );
                },
                loading: () {
                  return Expanded(
                    flex: 2,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: rh.responsiveRecipes(context),
                        mainAxisSpacing: 20,
                        childAspectRatio: 5 / 7,
                      ),
                      itemCount: 5,
                      itemBuilder: (context, index) => RecipeLoading(),
                    ),
                  );
                },
                error: (e, s) {
                  print('$e\n$s');
                  return Center(child: Text("An Error Occured"));
                },
              )
            ]),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "btn1",
        onPressed: () => context.push("/scan"),
        child: Image.asset(
          "assets/images/icons/scan.png",
          width: 40,
          color: theme.tertiary,
        ),
      ),
    );
  }
}
