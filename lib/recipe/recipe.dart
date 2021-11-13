import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';


final recipesProvider =
    FutureProvider<List<Recipe>>((ref) => retrieveRecipes());

final recipesProviderID =
    FutureProvider.family<Recipe, String>((ref, id){
      // final database = ref.watch(recipesProvider);
      print("ID IS : " + id.toString());
      return null;
    });
    
  Future<List<Recipe>> retrieveRecipes() async {
    Client client = http.Client();
    final url = 'https://livine.pythonanywhere.com/api/recipe?format=json';
    var response = await client.get(Uri.parse(url));
    var recipeJson = json.decode(response.body);
    return recipeJson.map<Recipe>((json)=> Recipe.fromMap(json)).toList();
  }

class Recipe {
  int id;
  String name;
  String imageURL;
  Recipe({
    @required this.id,
    @required this.name,
    @required this.imageURL,
  });

  Recipe copyWith({
    int id,
    String name,
    String imageURL,
  }) {
    return Recipe(
      id: id ?? this.id,
      name: name ?? this.name,
      imageURL: imageURL ?? this.imageURL,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'imageURL': imageURL,
    };
  }

  factory Recipe.fromMap(Map<String, dynamic> map) {
    return Recipe(
      id: map['id'],
      name: map['name'],
      imageURL: map['imageURL'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Recipe.fromJson(String source) => Recipe.fromMap(json.decode(source));

  @override
  String toString() => 'Recipe(id: $id, name: $name, imageURL: $imageURL)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Recipe &&
      other.id == id &&
      other.name == name &&
      other.imageURL == imageURL;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ imageURL.hashCode;
}
