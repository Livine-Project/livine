// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorites.freezed.dart';
part 'favorites.g.dart';

@freezed
class FavoritesData with _$FavoritesData {
  const factory FavoritesData(
      List id, List name, List imageURL) = _FavoritesData;
  factory FavoritesData.fromJson(Map<String, dynamic> json) =>
      _$FavoritesDataFromJson(json);
}
