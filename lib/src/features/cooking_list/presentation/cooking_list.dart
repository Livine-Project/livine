import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:livine/src/common_widgets/loading/loading.dart';
import 'package:livine/src/common_widgets/recipe/recipe_user_card.dart';
import 'package:livine/src/constants/constants.dart';
import 'package:livine/src/features/cooking_list/data/cooking_list.dart';
import 'package:livine/src/translations/domain/translation_provider.dart';

class CookingList extends ConsumerWidget {
  const CookingList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userCookingList = ref.watch(getUserCookingListProvider);
    final word = TranslationRepo.translate(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(word!.cooking_history),
        ),
        body: userCookingList.when(
            data: (recipes) {
              return recipes.isNotEmpty
                  ? ListView.builder(
                      itemCount: recipes.length,
                      itemBuilder: (context, index) => RecipeUserCard(
                            imageURL: restAPIMedia + recipes[index].imageURL,
                            name: recipes[index].name,
                            onTap: () => context.push('/recipe/details',
                                extra: recipes[index].id),
                          ))
                  : Center(
                      child: Text("You haven't cooked a recipe yet"),
                    );
            },
            error: (e, s) {
              return Text("Error");
            },
            loading: () => Loading()));
  }
}
