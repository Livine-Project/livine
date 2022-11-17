import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/constants.dart';
import '../domain/recipe/recipe.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipes.g.dart';

final FutureProviderFamily<Recipe, int> recipesProviderID =
    FutureProvider.family<Recipe, int>((ref, id) async {
  final url = '$restAPIURL/recipe/$id?format=json';

  final response = await client.get(Uri.parse(url));
  final responseDe = utf8.decode(response.bodyBytes);
  final responseJson = json.decode(responseDe);
  return Recipe.fromJson(
      Map<String, dynamic>.from(responseJson as Map<dynamic, dynamic>));
});

@riverpod
Future getRecipes(Ref ref,
    {required int id, required int pageKey}) async {
  final url = '$restAPIURL/patient/$id?format=json&page=$pageKey';
  final response = await client.get(Uri.parse(url));
  final responseDe = utf8.decode(response.bodyBytes);
  var responseJson = json.decode(responseDe);
  var recipesList =
      responseJson["results"].map((job) => Recipe.fromJson(job)).toList();
  return recipesList;
}

@riverpod
Future getVegRecipes(Ref ref,
    {required int id, required int pageKey}) async {
  final url = '$restAPIURL/recipe/veg/$id?format=json&page=$pageKey';
  final response = await client.get(Uri.parse(url));
  final responseDe = utf8.decode(response.bodyBytes);
  var responseJson = json.decode(responseDe);
  var recipesList =
      responseJson["results"].map((job) => Recipe.fromJson(job)).toList();
  return recipesList;
}
