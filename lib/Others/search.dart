import 'loading.dart';
import '../pages/home.dart';
import '../recipe/recipe.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate<Recipe> {


  List<Recipe>? recipesSearch;

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
          id: null,
          name: query, 
          foodImage: CachedNetworkImageProvider('https://livine.pythonanywhere.com/media/recipes/${query}.png'),
          type: 'Covid', 
          rating: '4.2',): 
          Loading(),
    );

  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final searchList = query.isEmpty
        ? recipesSearch!
        : recipesSearch!
            .where((element) => element.name.toLowerCase().startsWith(query.toLowerCase()))
            .toList();
    return ListView.builder(
        itemCount: searchList.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(
              Icons.replay_outlined,
            ),
            title: Text(searchList[index].name),
            onTap: () {
              query = searchList[index].name;
              showResults(context);
            },
          );
        },);
  }
}
