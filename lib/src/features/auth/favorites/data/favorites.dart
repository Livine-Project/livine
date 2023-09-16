import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../translations/domain/translation_provider.dart';
import '../../application/auth_service.dart';
import '../../../../constants/constants.dart';
import '../../../get_recipes/domain/recipe/recipe.dart';
import '../domain/favorites.dart';

part 'favorites.g.dart';

@riverpod
Future<FavoritesData> getFavorites(Ref ref,{required BuildContext context}) async{
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
  return FavoritesData.fromJson(responseJson["favorites"]);

}


Future<void> addFavorite({
  required WidgetRef ref,
  required int recipeID,
  required bool mounted,
  required BuildContext context,
}) async {
  final url = '$restAPIURL/addfavorite/';
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
    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("Successfully added to favorites"),
    ));
  } else {
    log(error: "Error adding to favorites", response.body);
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Error occurs while adding to favorites")));
  }
}

Future<void> deleteFavorite({
  required WidgetRef ref,
  required int recipeID,
  required bool mounted,
  required BuildContext context,
}) async {
  final url = '$restAPIURL/deletefavorite/';
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
    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Successfully deleted favorite $recipeID "),
    ));
  } else {
    log(error: "Error adding to favorites", response.body);
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Error occurs while deleting favorite")));
  }
}
