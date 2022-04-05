import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
part 'recipe.freezed.dart';
part 'recipe.g.dart';

Client client = http.Client();

final recipesProvider =
    FutureProvider<List<Recipe>>((ref) => retrieveRecipes());

// Recipes Provider By ID
final FutureProviderFamily<Recipe, int> recipesProviderID =
    FutureProvider.family<Recipe, int>((ref, id) async {
  final url = 'https://livine.pythonanywhere.com/api/recipe/$id?format=json';
  final response = await client.get(Uri.parse(url));
  final responseJson = json.decode(response.body);
  return Recipe.fromJson(
      Map<String, dynamic>.from(responseJson as Map<dynamic, dynamic>));
});

// RECIPES PROVIDER
Future<List<Recipe>> retrieveRecipes() async {
  const url = 'https://livine.pythonanywhere.com/api/recipe?format=json';
  final response = await client.get(Uri.parse(url));
  final recipeJson = await json.decode(response.body);
  return recipeJson.map<Recipe>((data) => Recipe.fromJson((data))).toList();
}

// Freezed Recipe Class
@freezed
class Recipe with _$Recipe {
  const factory Recipe(int id, String name, String imageURL, String rating,
      String type, String video, String ingridents) = _Recipe;
  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);
}
