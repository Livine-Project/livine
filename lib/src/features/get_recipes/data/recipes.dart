import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/constants.dart';
import '../../../translations/domain/translation_provider.dart';
import '../domain/recipe/recipe.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipes.g.dart';

@riverpod
Future<Recipe> recipesDetails(Ref ref,
    {required int id, required BuildContext context}) async {
  final url = '$restAPIURL/recipe/$id?format=json';
  final response = await client.get(Uri.parse(url), headers: {
    'Accept-Language': ref.watch(localeNotifierProvider).languageCode,
  });
  final responseDe = utf8.decode(response.bodyBytes);
  final responseJson = json.decode(responseDe);
  return Recipe.fromJson(
      Map<String, dynamic>.from(responseJson as Map<dynamic, dynamic>));
}

@riverpod
Future getRecipes(Ref ref,
    {required int id,
    required int pageKey,
    required BuildContext context}) async {
  final url = '$restAPIURL/patient/$id?format=json&page=$pageKey';
  final response = await client.get(Uri.parse(url), headers: {
    'Accept-Language': ref.watch(localeNotifierProvider).languageCode
  });

  final responseDe = utf8.decode(response.bodyBytes);
  var responseJson = json.decode(responseDe);
  var recipesList =
      responseJson["results"].map((job) => Recipe.fromJson(job)).toList();
  return recipesList;
}

@riverpod
Future getVegRecipes(Ref ref,
    {required int id,
    required int pageKey,
    required BuildContext context}) async {
  final url = '$restAPIURL/recipe/veg/$id?format=json&page=$pageKey';
  final response = await client.get(Uri.parse(url), headers: {
    'Accept-Language': ref.watch(localeNotifierProvider).languageCode
  });
  final responseDe = utf8.decode(response.bodyBytes);
  var responseJson = json.decode(responseDe);
  var recipesList =
      responseJson["results"].map((job) => Recipe.fromJson(job)).toList();
  return recipesList;
}
