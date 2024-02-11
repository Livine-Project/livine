import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:livine/src/constants/constants.dart';
import 'package:livine/src/features/auth/application/auth_service.dart';
import 'package:livine/src/features/get_recipes/domain/recipe/recipe.dart';
import 'package:livine/src/translations/domain/translation_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cooking_list.g.dart';

@riverpod
Future<List<Recipe>> getUserCookingList(Ref ref) async {
  final url = '$restAPIURL/user/cooking/';
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
Future<bool> addCookingList(Ref ref, {required int recipeID}) async {
  final url = '$restAPIURL/user/cooking/add/';
  final response = await client.post(
    Uri.parse(url),
    headers: {
      'Authorization': 'Token ${ref.read(authHelperProvider).getToken()}',
    },
    body: {
      "recipe_id": "$recipeID",
    },
    encoding: Encoding.getByName('application/json'),
  );

  return response.statusCode == 200;
}
