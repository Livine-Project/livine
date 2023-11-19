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
  }) : super(key: key);

  @override
  ConsumerState<RecipesGridView> createState() => _RecipesGridViewState();
}

class _RecipesGridViewState extends ConsumerState<RecipesGridView> {
  static const _pageSize = 6;
  final PagingController<int, Recipe> _pagingController =
      PagingController(firstPageKey: 0);
  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      int recipesTypeData = ref.watch(userTypeProvider);
      bool isUserVegan = ref.watch(isVeganProvider);
      bool guest = ref.watch(guestProvider);

      final guestRecipes = await ref.watch(getRecipesProvider(
              id: recipesTypeData == 0 ? patientID : recipesTypeData,
              pageKey: pageKey)
          .future);

      final newItems = isGuest == false && guest == false
          ? await ref.watch(isUserVegan == true
              ? getVegRecipesProvider(
                      id: recipesTypeData == 0 ? patientID : recipesTypeData,
                      pageKey: pageKey)
                  .future
              : getRecipesProvider(
                      id: recipesTypeData == 0 ? patientID : recipesTypeData,
                      pageKey: pageKey)
                  .future)
          : guestRecipes;

      final isLastPage = newItems.length < _pageSize;
      if (mounted) {
        if (isLastPage) {
          _pagingController.appendLastPage(newItems);
        } else {
          final nextPageKey = pageKey + newItems.length;
          _pagingController.appendPage(newItems, nextPageKey.toInt());
        }
      }
    } catch (error) {
      _pagingController.error = error;
      log(error: "RECIPES", error.toString());
    }
  }

  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final word = TranslationRepo.translate(context);
    return PagedGridView<int, Recipe>(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      pagingController: _pagingController,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: rh.responsiveRecipes(context),
        mainAxisSpacing: 20,
        childAspectRatio: 0.8,
      ),
      builderDelegate: PagedChildBuilderDelegate(
        newPageErrorIndicatorBuilder: (context) => Loading(),
        firstPageErrorIndicatorBuilder: (context) =>
            ErrorCustomWidget(pagingController: _pagingController),
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
