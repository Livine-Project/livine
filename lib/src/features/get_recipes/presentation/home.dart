// ignore_for_file: depend_on_referenced_packages, prefer_typing_uninitialized_variables, type_annotate_public_apis, dead_code

import 'dart:developer';
import 'dart:io';

import 'package:animations/animations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:livine/src/features/get_recipes/application/vegan_service.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../auth/data/user.dart';
import '../../loading/loading.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/constants.dart';
import '../../../constants/shared_constants.dart';
import '../../../shared/notifications/health_notification.dart';
import '../../../common_widgets/recipe/recipe_card_widget.dart';
import '../../../translations/locale_keys.g.dart';
import '../data/get_user_name.dart';
import 'recipe_details.dart';
import '../data/recipes.dart';
import '../domain/recipe/recipe.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void dispose() async {
    if (Platform.isAndroid) {
      adHelper.nativeAdBanner.dispose();
    }
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    onlyAndroid();
  }

  onlyAndroid() {
    if (Platform.isAndroid) {
      showNotification();

      adHelper.nativeBannerFunction(setState);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Scaffold(
      body: SafeArea(
        child: Consumer(builder: (context, ref, child) {
          int recipesTypeData = ref.watch(userTypeProvider);

          bool isUserVegan = ref.watch(isVeganProvider);
          log(error: "is Vegan", isUserVegan.toString());
          bool guest = ref.watch(guestProvider);

          final guestRecipes = ref.watch(recieveRecipesType(
              recipesTypeData == 0 ? patientID : recipesTypeData));

          final userRecipes = guest == false && isGuest == false
              ? ref.watch(isUserVegan == true
                  ? vegeRecipesProvider(
                      recipesTypeData == 0 ? patientID : recipesTypeData)
                  : recieveRecipesType(
                      recipesTypeData == 0 ? patientID : recipesTypeData))
              : guestRecipes;

          final name = ref.watch(userNameProvider).value;

          return LiquidPullToRefresh(
            animSpeedFactor: 2,
            onRefresh: () {
              return Future.delayed(const Duration(seconds: 2)).then((_) =>
                  ref.refresh(isUserVegan == true
                      ? vegeRecipesProvider(
                          recipesTypeData == 0 ? patientID : recipesTypeData)
                      : recieveRecipesType(
                          recipesTypeData == 0 ? patientID : recipesTypeData)));
            },
            height: 250,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 15.0),
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "${LocaleKeys.Welcome.tr()} ",
                        style: TextStyle(
                            fontSize: 35.0,
                            fontFamily: context.locale.languageCode == "en"
                                ? 'Kine'
                                : GoogleFonts.notoKufiArabic().fontFamily,
                            color: theme.onSurface)),
                    TextSpan(
                        text: name,
                        style: TextStyle(
                          fontSize: 35.0,
                          fontFamily: 'Kine',
                          color: theme.onSurface,
                          overflow: TextOverflow.ellipsis,
                        ))
                  ]))),
              if (adHelper.isnativeBannerAdLoaded && kReleaseMode) ...[
                Center(
                  child: SizedBox(
                    height: adHelper.nativeAdBanner.size.height.toDouble(),
                    width: adHelper.nativeAdBanner.size.width.toDouble(),
                    child: AdWidget(ad: adHelper.nativeAdBanner),
                  ),
                ),
              ],
              const SizedBox(height: 20.0),
              userRecipes.when(
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
                        return OpenContainer(
                          openBuilder: (context, _) => RecipeDetails(
                            id: recipe.id,
                          ),
                          middleColor: Colors.transparent,
                          openColor: Colors.transparent,
                          closedColor: Colors.transparent,
                          transitionDuration: const Duration(seconds: 1),
                          closedBuilder: (context, action) => RecipeCardNormal(
                            key: Key("K"),
                            id: recipe.id,
                            name: context.locale.languageCode == "en"
                                ? recipe.name
                                : recipe.name_in_arabic,
                            foodImage: '$restAPIMedia/${recipe.imageURL}',
                            type: context.locale.languageCode == "en"
                                ? recipe.patient
                                : recipe.patient_in_arabic,
                            difficulty: changeDiffName(recipe.diff, context),
                            time: context.locale.languageCode == "en"
                                ? "${recipe.time_taken} min"
                                : "${recipe.time_taken} دقيقة",
                            dImage: changeDiffImage(difficulty: recipe.diff),
                          ),
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

                  return e.toString().contains("SocketException")
                      ? const Center(child: Text("No Network Connection"))
                      : const Center(child: Text("An Error Occured"));
                },
              )
            ]),
          );
        }),
      ),
      floatingActionButton: ResponsiveVisibility(
        visibleWhen: const [
          Condition.equals(name: MOBILE),
        ],
        child: FloatingActionButton(
            heroTag: "btn1",
            onPressed: () => context.push("/scan"),
            child: Icon(
              Iconsax.scan,
              size: 35,
            )),
      ),
    );
  }
}
