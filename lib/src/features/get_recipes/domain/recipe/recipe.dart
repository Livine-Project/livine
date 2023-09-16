// ignore_for_file: non_constant_identifier_names

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
      List ingridents,
      List directions,
      String patient,
      String name,
      String imageURL,
      String difficulty,
      bool isVegetarian,
      String difficulty_image,
      int time_taken,
      int calories,
      String video,
      String created_at) = _Recipe;
  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);
}

