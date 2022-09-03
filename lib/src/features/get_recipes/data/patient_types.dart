import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/constants.dart';
import '../domain/recipe/recipe.dart';
import '../domain/recipe/recipe_types.dart';

final patientTypesProvider =
    FutureProvider<List<RecipeTypes>>((ref) => patientTypes());

Future<List<RecipeTypes>> patientTypes() async {
  const url = '$restAPIURL/allPatients/?format=json';
  final response = await client.get(Uri.parse(url));
  final responseDe = utf8.decode(response.bodyBytes);
  final recipeJson = await json.decode(responseDe);
  return recipeJson
      .map<RecipeTypes>((data) => RecipeTypes.fromJson((data)))
      .toList();
}
