// ignore_for_file: type_annotate_public_apis

import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:livine/src/shared/cache/cache_helper.dart';

import '../../auth/favorites/data/favorites.dart';
import '../../loading/loading.dart';
import '../../../constants/constants.dart';
import '../../../common_widgets/recipe/recipe_details_widgets.dart';
import '../data/recipes.dart';
import '../domain/recipe/recipe.dart';

class RecipeDetails extends StatefulWidget {
  const RecipeDetails({Key? key, required this.id}) : super(key: key);

  final dynamic id;

  @override
  State<RecipeDetails> createState() => _RecipeDetailsState();
}

class _RecipeDetailsState extends State<RecipeDetails>
    with SliverHelpers<RecipeDetails> {
  int index = 0;
  bool isFavorited = CacheHelper.getBool("isFavorited") ?? false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
      final recipesData = ref.watch(recipesProviderID(widget.id));

      return recipesData.when(
        data: (data) {
          return Stack(
            children: [
              Positioned.fill(
                child: AnimatedBuilder(
                  animation: scrollController,
                  builder: (_, child) =>
                      Opacity(opacity: opacity, child: child),
                  child: SizedBox(
                      height: 250,
                      child: CachedNetworkImage(
                        imageUrl: "$restAPIMedia/${data.imageURL}",
                        fit: BoxFit.cover,
                      )),
                ),
              ),
              Scaffold(
                backgroundColor: Colors.transparent,
                appBar: PreferredSize(
                  preferredSize: const Size.fromHeight(kToolbarHeight),
                  child: AnimatedBuilder(
                    animation: scrollController,
                    builder: (_, __) {
                      return AppBar(
                        actions: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                isFavorited = !isFavorited;
                              });
                              CacheHelper.setBool("isFavorited", isFavorited);
                              addFavorite(
                                recipeID: data.id,
                                ref: ref,
                                context: context,
                                mounted: mounted,
                              );
                            },
                            icon: isFavorited
                                ? const Icon(Iconsax.heart5)
                                : const Icon(Iconsax.heart),
                            iconSize: 30,
                            color: isFavorited
                                ? Colors.red
                                : getColorScheme(context).onBackground,
                          )
                        ],
                        centerTitle: true,
                        elevation: opacity >= 1 ? 0 : null,
                        backgroundColor: MaterialStateColor.resolveWith(
                          (states) {
                            return states.contains(MaterialState.scrolledUnder)
                                ? (theme.useMaterial3
                                    ? theme.colorScheme.surface
                                    : theme.colorScheme.primary)
                                : Colors.transparent;
                          },
                        ),
                      );
                    },
                  ),
                ),
                body: SingleChildScrollView(
                  controller: scrollController,
                  padding: EdgeInsets.only(top: top),
                  child: Card(
                    margin: EdgeInsets.zero,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            context.locale.languageCode == "en"
                                ? data.name
                                : data.name_in_arabic,
                            style: const TextStyle(
                                fontFamily: 'Kine', fontSize: 25),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconCard(
                              color: theme.colorScheme.primaryContainer,
                              image: 'assets/images/recipes/time.png',
                              name: context.locale.languageCode == "en"
                                  ? "${data.time_taken} min"
                                  : "${data.time_taken} دقيقة",
                            ),
                            const SizedBox(
                              width: 30.0,
                            ),
                            IconCard(
                              color: theme.colorScheme.secondaryContainer,
                              image: changeDiffImage(difficulty: data.diff),
                              name: changeDiffName(
                                  data.diff.toUpperCase(), context),
                            ),
                            const SizedBox(
                              width: 30.0,
                            ),
                            IconCard(
                              color: theme.colorScheme.tertiaryContainer,
                              image: 'assets/images/recipes/calories.jpg',
                              calAmount: data.calories.toString(),
                              name: context.locale.languageCode == "en"
                                  ? "cal/Serving"
                                  : "سعرات حراريه",
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                context.locale.languageCode == "en"
                                    ? "Ingridents :"
                                    : "المكونات",
                                style: const TextStyle(
                                    fontSize: 21.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: data.ingridents.length,
                                itemBuilder: ((context, index) {
                                  return IngridentsW(
                                    text: context.locale.languageCode == "en"
                                        ? data.ingridents[index]
                                        : data.ingridents_in_arabic[index],
                                  );
                                }),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                context.locale.languageCode == "en"
                                    ? "Directions :"
                                    : "الاتجاهات",
                                style: const TextStyle(
                                    fontSize: 21.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              ListView.separated(
                                separatorBuilder: (context, index) =>
                                    const SizedBox(
                                  height: 20.0,
                                ),
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: data.directions.length,
                                itemBuilder: ((context, index) {
                                  return Directions(
                                    text: context.locale.languageCode == "en"
                                        ? data.directions[index]
                                        : data.directions_in_arabic[index],
                                    num: index + 1,
                                  );
                                }),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(22.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: SizedBox(
                                  width: 200.0,
                                  height: 60.0,
                                  child: OutlinedButton(
                                      onPressed: () => context.go(
                                          "/recipe_video",
                                          extra: context.locale.languageCode ==
                                                  "en"
                                              ? data.video
                                              : data.video_in_arabic),
                                      child: Text(
                                          context.locale.languageCode == "en"
                                              ? "Video"
                                              : "الفيديو")),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
        error: (Object error, StackTrace? stackTrace) {
          log("$error \t $stackTrace");
          return const Text("An Error Occured");
        },
        loading: () => const Loading(),
      );
    });
  }
}

class Directions extends StatelessWidget {
  const Directions({
    Key? key,
    required this.num,
    required this.text,
  }) : super(key: key);
  final int num;
  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          num.toString(),
          style: const TextStyle(fontSize: 20.0),
        ),
        const SizedBox(
          width: 5.0,
        ),
        Container(
          height: 30.0,
          width: 3.0,
          decoration: BoxDecoration(
              color: theme.colorScheme.tertiary,
              borderRadius: BorderRadius.circular(20.0)),
        ),
        const SizedBox(
          width: 10.0,
        ),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontSize: 19.0, fontWeight: FontWeight.w100),
          ),
        ),
      ],
    );
  }
}

mixin SliverHelpers<T extends StatefulWidget> on State<T> {
  final scrollController = ScrollController();
  double top = 250;
  double opacity = 1;
  double scrollPosition = 0;
  double _getPositionFromTop() {
    final paddingTop = MediaQuery.of(context).padding.top;
    var position = 250 + paddingTop;
    const finalPosition = 0.0;

    if (scrollController.hasClients) {
      final offset = scrollController.offset;
      final isFinalPos = offset > position - finalPosition;
      if (isFinalPos) {
        position = finalPosition;
      } else {
        position = position - offset;
      }
    }
    return position;
  }

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      top = _getPositionFromTop();
      opacity = _opacity(top);
      scrollPosition = scrollController.offset;
    });
  }

  double _opacity(double top) => (top / 250).clamp(0.0, 1.0);
}

class MathUtils {
  /// normalizes the value.
  static double norm(double value, double min, double max) =>
      (value - min) / (max - min);

  /// Linear interpolation, same as `lerpDouble`
  /// no restrictions on `t` for range 0-1.
  static double lerp(
    double min,
    double max,
    double t,
  ) =>
      min + (max - min) * t;

  /// Like dart num::clamp() but adjusts min/max.
  static double clamp(double value, double min, double max) {
    double localMax = max;
    double localMin = min;
    if (localMin > localMax) {
      var tmp = localMax;
      localMax = localMin;
      localMin = tmp;
    }
    if (value < localMin) {
      return localMin;
    } else if (value > localMax) {
      return localMax;
    } else {
      return value;
    }
  }

  /// maps `srcValue` from `srcMin` and `srcMax` range ... to `dstMin` / `dstMax`
  /// range... optionally clamping the the output value when `clampDst` is true.
  static double map(
    double srcValue,
    double srcMin,
    double srcMax,
    double dstMin,
    double dstMax, [
    bool clampDst = false,
  ]) {
    final result = lerp(
      dstMin,
      dstMax,
      norm(srcValue, srcMin, srcMax),
    );
    if (clampDst) {
      return clamp(result, dstMin, dstMax);
    }
    return result;
  }
}
