import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/constants.dart';
import '../../../translations/domain/translation_provider.dart';
import '../domain/recipe/recipe.dart';
import '../domain/recipe/patients.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'patients.g.dart';

@riverpod
Future<List<Patients>> getPatients(Ref ref,
    {required BuildContext context}) async {
  final response = await client.get(
      Uri.parse('$restAPIURL/allPatients/?format=json'),
      headers: {"Accept-Language": ref.watch(localeNotifierProvider).languageCode});
  final responseDe = utf8.decode(response.bodyBytes);
  final recipeJson = await json.decode(responseDe);
  return recipeJson.map<Patients>((data) => Patients.fromJson((data))).toList();
}
