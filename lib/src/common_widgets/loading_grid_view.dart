import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../features/loading/loading.dart';

class LoadingGridView extends StatelessWidget {
  const LoadingGridView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
  }
}
