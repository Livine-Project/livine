import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../translations/domain/translation_provider.dart';
import '../../../contextmenu/domain/contextmenu.dart';
import '../../application/auth_service.dart';
import '../../../../constants/constants.dart';
import '../../../get_recipes/domain/recipe/recipe.dart';

part 'favorites.g.dart';

@riverpod
Future<List<Recipe>> getFavorites(Ref ref) async {
  final url = '$restAPIURL/user/favorite/';
  final response = await client.get(
    Uri.parse(url),
    headers: {
      'Accept-Language': ref.watch(localeNotifierProvider).languageCode,
      'Authorization': 'Token ${ref.read(authHelperProvider).getToken()}',
    },
  );
  final responseDe = utf8.decode(response.bodyBytes);
  final responseJson = json.decode(responseDe);

  return responseJson.map<Recipe>((json) => Recipe.fromJson(json)).toList();
}

@riverpod
Future<void> addFavorite(
  Ref ref, {
  required int recipeID,
}) async {
  final url = '$restAPIURL/addfavorite/';
  final scaffoldMessenger = ref.read(scaffoldMessengerPod);

  final response = await client.post(
    Uri.parse(url),
    headers: {
      'Authorization': 'Token ${ref.read(authHelperProvider).getToken()}',
    },
    body: {
      "id": "$recipeID",
    },
    encoding: Encoding.getByName('application/json'),
  );

  if (response.statusCode == 200) {
    scaffoldMessenger.showSnackBar(const SnackBar(
      content: Text("Successfully added to favorites"),
    ));
  } else {
    log(error: "Error adding to favorites", response.body);
    scaffoldMessenger.showSnackBar(const SnackBar(
        content: Text("Error occurs while adding to favorites")));
  }
}

@riverpod
Future<void> deleteFavorite(
  Ref ref, {
  required int recipeID,
}) async {
  final url = '$restAPIURL/deletefavorite/';
  final scaffoldMessenger = ref.read(scaffoldMessengerPod);

  final response = await client.post(
    Uri.parse(url),
    headers: {
      'Authorization': 'Token ${ref.read(authHelperProvider).getToken()}',
    },
    body: {
      "id": "$recipeID",
    },
    encoding: Encoding.getByName('application/json'),
  );

  if (response.statusCode == 200) {
    scaffoldMessenger.showSnackBar(SnackBar(
      content: Text("Successfully deleted recipe"),
    ));
  } else {
    log(error: "Error deleting favorites", response.body);
    scaffoldMessenger.showSnackBar(
        const SnackBar(content: Text("Error occurs while deleting favorite")));
  }
}

@riverpod
Future<String> isFavorited(Ref ref, {required int id}) async {
  final url = Uri.parse('$restAPIURL/recipe/$id/favorite/');
  final request = await client.get(
    url,
    headers: {
      'Authorization': 'Token ${ref.read(authHelperProvider).getToken()}',
    },
  );

  return request.body;
}
