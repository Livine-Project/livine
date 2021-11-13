import 'dart:convert';

import 'package:app/Others/loading.dart';
import 'package:app/pages/home.dart';
import 'package:app/recipe/recipe.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class DataSearch extends SearchDelegate {
  List<Recipe> recipes = [];
  Client client = http.Client();

  Future<List<Recipe>> retrieveRecipes() async {
    recipes = [];
    final url = 'https://livine.pythonanywhere.com/api/recipe?format=json';
    var response = await client.get(Uri.parse(url));
    var recipeJson = json.decode(response.body);
    for (var recipe in recipeJson) {
      recipes.add(Recipe.fromMap(recipe));
    }

    return recipes;
  }

  List<Recipe> recipesSearch;
  DataSearch({this.recipesSearch});
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => Navigator.pop(context),
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    
          return Padding(
      padding: const EdgeInsets.all(10.0),
      child: query.isNotEmpty ? RecipeCardNormal(
          name: query, 
          foodImage: CachedNetworkImageProvider('https://livine.pythonanywhere.com/media/recipes/$query.png'),
          type: 'Covid', 
          rating: '4.2'): 
          Loading(),
    );

  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var searchList = query.isEmpty
        ? recipesSearch
        : recipesSearch
            .where((element) => element.name.startsWith(query))
            .toList();
    return ListView.builder(
        itemCount: searchList.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(
              Icons.replay_outlined,
            ),
            title: Text("${searchList[index].name}"),
            onTap: () {
              query = searchList[index].name;
              showResults(context);
            },
          );
        });
  }
}
