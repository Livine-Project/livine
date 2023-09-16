import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../constants/constants.dart';
import '../../auth/application/auth_service.dart';
import '../../get_recipes/domain/recipe/recipe.dart';


Future<String> addPoints({required WidgetRef ref,required int points})async{
    final url = '$restAPIURL/user/update/points/';

  final response = await client.put(
    Uri.parse(url),
    body: json.encode({"points": points}),
    headers: {
      'Authorization': 'Token ${ref.read(authHelperProvider).getToken()}',
      'Content-Type': 'application/json',
    },
  );
  print(response.body);
  if (response.statusCode == 200) {
    return "Successfully added points";
  }
  return "Error adding points";

}