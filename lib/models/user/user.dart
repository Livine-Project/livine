import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../recipe/recipe.dart';


part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class UserData with _$UserData {
  const factory UserData(int id, String username, String email) = _UserData;
  factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);
  
}

final FutureProviderFamily<UserData, int> userProviderID =
    FutureProvider.family<UserData, int>((ref, id) async {
  final url = 'https://livine.pythonanywhere.com/api/user/$id?format=json';
  final response = await client.get(Uri.parse(url));
  final responseJson = json.decode(response.body);
  return UserData.fromJson(
      Map<String, dynamic>.from(responseJson as Map<dynamic, dynamic>));
});

