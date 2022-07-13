// ignore_for_file: depend_on_referenced_packages, prefer_typing_uninitialized_variables, type_annotate_public_apis, dead_code

import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../models/user/user.dart';
import '../../shared/components/misc/loading.dart';
import '../../shared/notifications/health_notification.dart';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/recipe/recipe.dart';

import '../../shared/components/widgets/recipe/recipe_card_widget.dart';
import '../../shared/constants/constants.dart';
import '../../shared/constants/shared_constants.dart';
import '../../translations/locale_keys.g.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void dispose() async {
    disposeAndroid();
    super.dispose();
  }

  void disposeAndroid() {
    if (Platform.isAndroid) {
      adHelper.nativeAdBanner.dispose();
    }
  }

  void runOnlyOnAndriod() {
    if (Platform.isAndroid) {
      showNotification();
      adHelper.nativeBannerFunction(setState);
    }
  }

  @override
  void initState() {
    runOnlyOnAndriod();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Scaffold(
      body: SafeArea(
        //TODO:Fix Bug Empty screen , the home screen builds twice

        child: Consumer(builder: (context, ref, child) {
          final recipesTypeData = ref.watch(userTypeProvider);

          final recipesData = ref.watch(recieveRecipesType(
              recipesTypeData == '' ? userType : recipesTypeData));

          return LiquidPullToRefresh(
            animSpeedFactor: 2,
            onRefresh: () {
              return Future.delayed(const Duration(seconds: 2)).then((_) =>
                  ref.refresh(recieveRecipesType(
                      recipesTypeData.isEmpty ? userType : recipesTypeData)));
            },
            height: 250,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 15.0),
                child: Text("${LocaleKeys.Welcome.tr()} ,",
                    style: const TextStyle(fontSize: 35.0, fontFamily: 'Kine')),
              ),
              if (adHelper.isnativeBannerAdLoaded &&
                  testID != 10 &&
                  kReleaseMode) ...[
                Center(
                  child: SizedBox(
                    height: adHelper.nativeAdBanner.size.height.toDouble(),
                    width: adHelper.nativeAdBanner.size.width.toDouble(),
                    child: AdWidget(ad: adHelper.nativeAdBanner),
                  ),
                ),
              ],
              const SizedBox(height: 20.0),
              recipesData.when(
                data: (data) {
                  return Expanded(
                    flex: 2,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: rh.responsiveRecipes(context),
                        mainAxisSpacing: 20,
                        childAspectRatio: 5 / 7,
                      ),
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        final recipe = data[index];
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
                              ? "${recipe.time_taken} min"
                              : "${recipe.time_taken} دقيقة",
                          dImage:
                              changeDiffImage(difficulty: recipe.difficulty),
                        );
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
                      itemBuilder: (context, index) => const RecipeLoading(),
                    ),
                  );
                },
                error: (e, s) {
                  log('$e\n$s');
                  return const Center(child: Text("An Error Occured"));
                },
              )
            ]),
          );
        }),
      ),
      floatingActionButton: ResponsiveVisibility(
        visibleWhen: const [
          Condition.equals(name: MOBILE),
          Condition.equals(name: TABLET),
        ],
        child: FloatingActionButton(
          heroTag: "btn1",
          onPressed: () => context.push("/scan"),
          child: Image.asset(
            "assets/images/icons/scan.png",
            width: 40,
            color: theme.onPrimaryContainer,
          ),
        ),
      ),
    );
  }
}
