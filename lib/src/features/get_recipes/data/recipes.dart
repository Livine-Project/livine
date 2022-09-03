import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/constants.dart';
import '../domain/recipe/recipe.dart';

final FutureProviderFamily<Recipe, int> recipesProviderID =
    FutureProvider.family<Recipe, int>((ref, id) async {
  final url = '$restAPIURL/recipe/$id?format=json';

  final response = await client
      .get(Uri.parse(url));
  final responseDe = utf8.decode(response.bodyBytes);
  final responseJson = json.decode(responseDe);
  return Recipe.fromJson(
      Map<String, dynamic>.from(responseJson as Map<dynamic, dynamic>));
});

final FutureProviderFamily recieveRecipesType =
    FutureProvider.family((ref, id) async {
  final url = '$restAPIURL/patient/$id?format=json';

  final response = await client
      .get(Uri.parse(url));
  final responseDe = utf8.decode(response.bodyBytes);
  var responseJson = json.decode(responseDe);
  return responseJson.map((job) => Recipe.fromJson(job)).toList();
});

final FutureProviderFamily vegeRecipesProvider =
    FutureProvider.family((ref, id) async {
  final url = '$restAPIURL/recipe/veg/$id?format=json';

  final response = await client
      .get(Uri.parse(url));
  final responseDe = utf8.decode(response.bodyBytes);
  final responseJson = json.decode(responseDe);

  return responseJson.map((job) => Recipe.fromJson(job)).toList();
});
