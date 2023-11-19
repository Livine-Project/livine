import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:livine/src/constants/constants.dart';
import 'package:livine/src/features/get_recipes/domain/recipe/recipe.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../translations/domain/translation_provider.dart';
import '../../auth/application/auth_service.dart';
import '../domain/planner_domain.dart';

part 'planner_data.g.dart';

@riverpod
Future<Map<String, Meal>>getMeals(Ref ref) async {
  final url = Uri.parse('$restAPIURL/recipe/plan/');
  final token = await ref.watch(authHelperProvider).getToken();

  final response = await client.get(url, headers: {
    'Accept-Language': ref.watch(localeNotifierProvider).languageCode,
    'Authorization': 'Token ${token}'
  });
  final responseDe = utf8.decode(response.bodyBytes);
  var responseJson = json.decode(responseDe);
  final breakfast = responseJson["breakfast"];
  final lunch = responseJson["lunch"];
  final dinner = responseJson["dinner"];
  
  return {
    "breakfast": Meal.fromJson(breakfast),
    "lunch": Meal.fromJson(lunch),
    "dinner": Meal.fromJson(dinner),
  };
}
