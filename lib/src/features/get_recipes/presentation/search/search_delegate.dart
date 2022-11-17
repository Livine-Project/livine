import 'dart:developer';

import 'package:animations/animations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common_widgets/recipe/recipe_card_widget.dart';
import '../../../../constants/constants.dart';
import '../../../../constants/shared_constants.dart';
import '../../../auth/data/user.dart';
import '../../../loading/loading.dart';
import '../../domain/recipe/recipe.dart';
import '../recipe_details.dart';
import 'data/search.dart';

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Iconsax.close_square),
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
      icon: const Icon(Iconsax.arrow_left),
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
          data: (data) {
            return GridView.builder(
              physics: const BouncingScrollPhysics(),
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
                  transitionDuration: const Duration(milliseconds: 500),
                  closedBuilder: (context, action) => RecipeCardNormal(
                    key: Key("K"),
                    id: recipe.id,
                    name: context.locale.languageCode == "en"
                        ? recipe.name
                        : recipe.name_in_arabic,
                    foodImage: '${recipe.imageURL}',
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

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(
            Icons.food_bank_rounded,
          ),
          onTap: () {
            query = context.locale.languageCode == "en"
                ? suggestions[index]
                : suggestionsAR[index];
            showResults(context);
          },
          title: Text(context.locale.languageCode == "en"
              ? suggestions[index]
              : suggestionsAR[index]),
        );
      },
    );
  }
}
