import 'dart:developer';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common_widgets/recipe/recipe_card_widget.dart';
import '../../../../constants/constants.dart';
import '../../../../constants/shared_constants.dart';
import '../../../../translations/domain/translation_provider.dart';
import '../../../auth/data/user.dart';
import '../../../../common_widgets/loading/loading.dart';
import '../recipe_details.dart';
import 'data/search.dart';

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.close),
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.west),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return HookConsumer(
      builder: (context, ref, child) {
        int recipesTypeData = ref.watch(userTypeProvider);
        final results = ref.watch(searchResultsProvider(
            query: query,
            pk: recipesTypeData == 0 ? patientID : recipesTypeData));
        return results.when(
          data: (recipes) {
            return GridView.builder(
              physics: const BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: rh.responsiveRecipes(context),
                mainAxisSpacing: 20,
                childAspectRatio: 5 / 7,
              ),
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                return OpenContainer(
                  openElevation: 0,
                  closedElevation: 0,
                  closedColor: Colors.transparent,
                  openBuilder: (context, _) => RecipeDetails(
                    id: recipes[index].id,
                  ),
                  transitionDuration: const Duration(milliseconds: 500),
                  closedBuilder: (context, action) => RecipeCardNormal(
                    id: recipes[index].id,
                    name: recipes[index].name,
                    foodImage: '${recipes[index].imageURL}',
                    type: recipes[index].patient,
                    difficulty: recipes[index].difficulty,
                    time: ref.watch(localeNotifierProvider).languageCode == "en"
                        ? "${recipes[index].time_taken} min"
                        : "${recipes[index].time_taken} دقيقة",
                    dImage: recipes[index].difficulty_image,
                  ),
                );
              },
            );
          },
          loading: () {
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: rh.responsiveRecipes(context),
                mainAxisSpacing: 20,
                childAspectRatio: 5 / 7,
              ),
              itemCount: 5,
              itemBuilder: (context, index) => const RecipeLoading(),
            );
          },
          error: (e, s) {
            log('$e\n$s');

            return e.toString().contains("SocketException")
                ? const Center(child: Text("No Network Connection"))
                : const Center(child: Text("An Error Occured"));
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = ["Pasta", "Onion", "Tomato", "Chicken"];
    List<String> suggestionsAR = ["خبز", "بصل", "طماطم", "دجاج"];

    return Consumer(
      builder: (context, ref, child) => ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(
              Icons.food_bank_rounded,
            ),
            onTap: () {
              query = ref.watch(localeNotifierProvider).languageCode == "en"
                  ? suggestions[index]
                  : suggestionsAR[index];
              showResults(context);
            },
            title: Text(ref.watch(localeNotifierProvider).languageCode == "en"
                ? suggestions[index]
                : suggestionsAR[index]),
          );
        },
      ),
    );
  }
}
