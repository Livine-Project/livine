// ignore_for_file: non_constant_identifier_names

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

part 'recipe.freezed.dart';
part 'recipe.g.dart';

Client client = http.Client();

@freezed
class Recipe with _$Recipe {
  const factory Recipe(
    int id,
    String name,
    String name_in_arabic,
    String imageURL,
    String patient,
    String patient_in_arabic,
    String video,
    String video_in_arabic,
    List ingridents,
    List ingridents_in_arabic,
    String diff,
    bool isVegetarian,
    int time_taken,
    int calories,
    List directions,
    List directions_in_arabic,
  ) = _Recipe;
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
