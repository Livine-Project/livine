// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../../shared/constants/constants.dart';

part 'recipe.freezed.dart';
part 'recipe.g.dart';

Client client = http.Client();

// Recipes Provider By ID
final FutureProviderFamily<Recipe, int> recipesProviderID =
    FutureProvider.family<Recipe, int>((ref, id) async {
  final url = '$restAPIURL/recipe/$id?format=json';
  final response = await client.get(Uri.parse(url));
  final responseDe = utf8.decode(response.bodyBytes);
  final responseJson = json.decode(responseDe);
  return Recipe.fromJson(
      Map<String, dynamic>.from(responseJson as Map<dynamic, dynamic>));
});

final FutureProviderFamily recieveRecipesType =
    FutureProvider.family((ref, type) async {
  final url = '$restAPIURL/recipeType/$type?format=json';
  final response = await client.get(Uri.parse(url));
  final responseDe = utf8.decode(response.bodyBytes);
  final responseJson = json.decode(responseDe);

  return responseJson.map((job) => Recipe.fromJson(job)).toList();
});

// Freezed Recipe Class
@freezed
class Recipe with _$Recipe {
  const factory Recipe(
      int id,
      String name,
      String name_in_arabic,
      String type_in_arabic,
      String imageURL,
      String coverURL,
      String rating,
      String type,
      String video,
      String video_in_arabic,
      List ingridents,
      String difficulty,
      int time_taken,
      int calories,
      List directions,
      List directions_in_arabic,
      List ingridents_in_arabic) = _Recipe;
  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);
}

String changeDiffName(String difficulty, BuildContext context) {
  if (context.locale.languageCode == "ar") {
    if (difficulty.toUpperCase() == "EASY") {
      return "سهل";
    }
    if (difficulty.toUpperCase() == "MEDIUM") {
      return "وسط";
    }
    if (difficulty.toUpperCase() == "HARD") {
      return "صعب";
    }
  }
  return difficulty;
}

String changeDiffImage({String difficulty = '', bool isArabic = false}) {
  switch (difficulty.toUpperCase()) {
    case "EASY":
      difficulty = 'assets/images/difficulty/smile.png';
      return difficulty;

    case "MEDIUM":
      difficulty = 'assets/images/difficulty/wow.png';
      return difficulty;

    case "HARD":
      difficulty = 'assets/images/difficulty/sad.png';
      return difficulty;

    default:
      return difficulty;
  }
}
