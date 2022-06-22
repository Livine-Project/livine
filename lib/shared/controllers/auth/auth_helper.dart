import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/recipe/recipe.dart';
import '../../../models/user/user.dart';
import '../../../modules/auth/login.dart';
import '../../constants/constants.dart';
import 'auth_classes.dart';

class AuthHelper {
  bool isLoading = false;

  Future<void> logintoDjango({
    required TextEditingController username,
    required TextEditingController password,
    required WidgetRef ref,
    required BuildContext context,
    required void Function(void Function()) setState,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final url = '$restAPIURL/login/';
    final response = await client.post(
      Uri.parse(url),
      body: {
        'username': username.text,
        'password': password.text,
      },
    );
    final responseJson = await json.decode(response.body);
    print(responseJson);
    final errorinLogin = responseJson['non_field_errors'];
    if (response.statusCode == 200) {
      final loginJson = LoginResponse.fromJson(
          Map<String, dynamic>.from(responseJson as Map<dynamic, dynamic>));
      if (loginJson.token!.isNotEmpty) {
        await prefs.setBool('username', true);

        int userloginID = responseJson['data']['user_id'];

        await prefs.setInt("userID", userloginID);

        ref
            .read(userIDProvider.notifier)
            .update((state) => state = userloginID);

        ref.read(guestProvider.notifier).update((state) => false);

        GoRouter.of(context).goNamed('OnBoarding');
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(errorinLogin is List ? errorinLogin.first : errorinLogin),
      ));
      setState(() {
        isLoading = false;
      });
    }
    
  }

  void validateAuthForm(
      {required dynamic formKey,
      required void Function(Function()) setState,
      required void Function() function}) async {
    final form = formKey.currentState;
    if (form.validate()) {
      setState(() {
        isLoading = true;
      });
      function;
    } else {
      debugPrint('form is invalid');
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> validateGuest(WidgetRef ref, BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isGuest', true);

    await prefs.setBool('username', true);
    ref.read(guestProvider.notifier).update((state) => true);

    GoRouter.of(context).goNamed('OnBoarding');
  }
}
