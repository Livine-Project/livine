// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

part 'recipe.freezed.dart';
part 'recipe.g.dart';

Client client = http.Client();

@unfreezed
class Recipe with _$Recipe {
   factory Recipe(
      int id,
      List<String> ingridents,
      List<String> directions,
      String patient,
      String name,
      String imageURL,
      String difficulty,
      bool? isVegetarian,
      List tag,
      String difficulty_image,
      int time_taken,
      int calories,
      String video,
      DateTime? from_date,
      DateTime? to_date,
      String created_at) = _Recipe;
  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);
}

