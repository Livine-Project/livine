import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../../constants/constants.dart';
import '../../../application/vegan_service.dart';
import '../../../domain/recipe/recipe.dart';

part 'search.g.dart';

@riverpod
Future searchResults(Ref ref, {required int pk, required String query}) async {
  bool isUserVegan = ref.watch(isVeganProvider);
  final url = isUserVegan == true
      ? "$restAPIURL/recipe/veg/$pk?format=json&search=$query"
      : '$restAPIURL/patient/$pk?format=json&search=$query';
  final response = await client.get(Uri.parse(url));
  final responseDe = utf8.decode(response.bodyBytes);
  final responseJson = json.decode(responseDe);
  return responseJson["results"].map((job) => Recipe.fromJson(job)).toList();
}
