import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'recipe.dart';

part 'recipe_types.freezed.dart';
part 'recipe_types.g.dart';

  final patientTypesProvider =
    FutureProvider<List<RecipeTypes>>((ref) => patientTypes());
    
Future<List<RecipeTypes>> patientTypes() async {
  final url = 'https://livine.pythonanywhere.com/api/types/?format=json';
  final response = await client.get(Uri.parse(url));
  final responseDe = await utf8.decode(response.bodyBytes);
  final recipeJson = await json.decode(responseDe);
  return recipeJson.map<RecipeTypes>((data) => RecipeTypes.fromJson((data))).toList();}

@freezed
class RecipeTypes with _$RecipeTypes {
  const factory RecipeTypes(
      int id,
      String type,
      String type_in_arabic,


     ) = _RecipeTypes;
  factory RecipeTypes.fromJson(Map<String, dynamic> json) => _$RecipeTypesFromJson(json);
}