import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/user.dart';
import '../../application/auth_service.dart';
import '../../../../constants/constants.dart';
import '../../../get_recipes/domain/recipe/recipe.dart';

final FutureProvider<UserData> userDataProvider =
    FutureProvider<UserData>((ref) async {
  final url = Uri.parse('$restAPIURL/user/?format=json');
  final token = ref.watch(authHelperProvider).getToken();

  final response = await client.get(
    url,
    headers: token != '' ? {'Authorization': 'Token ${token}'} : {},
  );

  return UserData.fromJson(json.decode(response.body));
});
