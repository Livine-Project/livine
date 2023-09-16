import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../../constants/constants.dart';
import '../../../../../translations/domain/translation_provider.dart';
import '../../../application/vegan_service.dart';
import '../../../domain/recipe/recipe.dart';

part 'search.g.dart';

@riverpod
Future searchResults(Ref ref,
    {required int pk,
    required String query,
    required BuildContext context}) async {
  bool isUserVegan = ref.watch(isVeganProvider);
  final url = isUserVegan == true
      ? "$restAPIURL/recipe/veg/$pk?format=json&search=$query"
      : '$restAPIURL/patient/$pk?format=json&search=$query';
  final response = await client.get(Uri.parse(url), headers: {
    "Accept-Language": ref.watch(localeNotifierProvider).languageCode
  });
  final responseDe = utf8.decode(response.bodyBytes);
  final responseJson = json.decode(responseDe);
  return responseJson["results"].map((job) => Recipe.fromJson(job)).toList();
}
