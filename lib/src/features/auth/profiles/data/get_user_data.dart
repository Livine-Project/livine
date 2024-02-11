import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/user.dart';
import '../../application/auth_service.dart';
import '../../../../constants/constants.dart';
import '../../../get_recipes/domain/recipe/recipe.dart';

final userDataProvider = FutureProvider<UserData>((ref) async {
  final url = Uri.parse('$restAPIURL/user/?format=json');

  final token = await ref.watch(authHelperProvider).getToken();
  Map<String, String> headers = {};
  if (token != '') {
    headers["Authorization"] = 'Token ${token}';
  }
  final response = await client.get(url, headers: headers);

  return UserData.fromJson(json.decode(response.body));
});


final userDataStreamProvider = StreamProvider<UserData>((ref) async* {
  while (true) {
    await Future.delayed(Duration(seconds: 3));
    final url = Uri.parse('$restAPIURL/user/?format=json');
    final token = await ref.watch(authHelperProvider).getToken();
    Map<String, String> headers = {};
    if (token != '') {
      headers["Authorization"] = 'Token ${token}';
    }
    final response = await client.get(url, headers: headers);

    yield UserData.fromJson(json.decode(response.body));
  }
});
