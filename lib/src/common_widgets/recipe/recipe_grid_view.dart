import 'dart:developer';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../constants/constants.dart';
import '../../constants/shared_constants.dart';
import '../../features/auth/data/user.dart';
import '../../features/get_recipes/application/vegan_service.dart';
import '../../features/get_recipes/data/recipes.dart';
import '../../features/get_recipes/domain/recipe/recipe.dart';
import '../../features/get_recipes/presentation/recipe_details.dart';
import '../../features/loading/loading.dart';
import '../../translations/domain/translation_provider.dart';
import '../loading_grid_view.dart';
import 'recipe_card_widget.dart';

import '../../common_widgets/error_widget.dart';

class RecipesGridView extends ConsumerStatefulWidget {
  const RecipesGridView({
    Key? key,
    required this.pagingController,
  }) : super(key: key);

  final pagingController;

  @override
  ConsumerState<RecipesGridView> createState() => _RecipesGridViewState();
}

class _RecipesGridViewState extends ConsumerState<RecipesGridView> {
  static const _pageSize = 6;

  @override
  void initState() {
    super.initState();
    widget.pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      int recipesTypeData = ref.watch(userTypeProvider);
      bool isUserVegan = ref.watch(isVeganProvider);
      bool guest = ref.watch(guestProvider);

      final guestRecipes = await ref.watch(getRecipesProvider(
              context: context,
              id: recipesTypeData == 0 ? patientID : recipesTypeData,
              pageKey: pageKey)
          .future);

      final newItems = isGuest == false && guest == false
          ? await ref.watch(isUserVegan == true
              ? getVegRecipesProvider(
                      context: context,
                      id: recipesTypeData == 0 ? patientID : recipesTypeData,
                      pageKey: pageKey)
                  .future
              : getRecipesProvider(
                      context: context,
                      id: recipesTypeData == 0 ? patientID : recipesTypeData,
                      pageKey: pageKey)
                  .future)
          : guestRecipes;

      final isLastPage = newItems.length < _pageSize;
      if (mounted) {
        if (isLastPage) {
          widget.pagingController.appendLastPage(newItems);
        } else {
          final nextPageKey = pageKey + newItems.length;
          widget.pagingController.appendPage(newItems, nextPageKey.toInt());
        }
      }
    } catch (error) {
      widget.pagingController.error = error;
      log(error: "RECIPES", error.toString());
    }
  }

  void dispose() {
    widget.pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final word = TranslationRepo.translate(context);
    return PagedGridView<int, Recipe>(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      pagingController: widget.pagingController,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: rh.responsiveRecipes(context),
        mainAxisSpacing: 20,
        childAspectRatio: 0.8,
      ),
      builderDelegate: PagedChildBuilderDelegate(
        newPageErrorIndicatorBuilder: (context) => Loading(),
        firstPageErrorIndicatorBuilder: (context) =>
            ErrorCustomWidget(pagingController: widget.pagingController),
        firstPageProgressIndicatorBuilder: (context) => LoadingGridView(),
        newPageProgressIndicatorBuilder: (context) => LoadingGridView(),
        itemBuilder: (context, recipe, index) {
          return OpenContainer(
            openElevation: 0,
            closedElevation: 0,
            closedColor: Colors.transparent,
            openBuilder: (context, _) => RecipeDetails(
              id: recipe.id,
            ),
            transitionDuration: const Duration(milliseconds: 500),
            closedBuilder: (context, action) => RecipeCardNormal(
              id: recipe.id,
              name: recipe.name,
              foodImage: '${recipe.imageURL}',
              type: recipe.patient,
              difficulty: recipe.difficulty,
              time: "${recipe.time_taken} ${word!.minute.toUpperCase()}",
              dImage: "$restAPIMedia/${recipe.difficulty_image}",
            ),
          );
        },
      ),
    );
  }
}
