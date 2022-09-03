// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_types.freezed.dart';
part 'recipe_types.g.dart';

@freezed
class RecipeTypes with _$RecipeTypes {
  const factory RecipeTypes(
    int id,
    String name,
    String name_in_arabic,
  ) = _RecipeTypes;
  factory RecipeTypes.fromJson(Map<String, dynamic> json) =>
      _$RecipeTypesFromJson(json);
}
