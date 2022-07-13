// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:livine/shared/controllers/cache/cache_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/recipe/recipe.dart';
import '../../../models/user/user.dart';
import '../../../modules/auth/login.dart';
import '../../constants/constants.dart';
import '../../constants/shared_constants.dart';
import 'auth_classes.dart';

class AuthHelper {
  bool isLoading = false;

  Future<void> logintoDjango({
    required TextEditingController username,
    required TextEditingController password,
    required WidgetRef ref,
    required BuildContext context,
    required void Function(void Function()) setState,
    required bool mounted,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    const url = '$restAPIURL/login/';
    final response = await client.post(
      Uri.parse(url),
      body: {
        'username': username.text,
        'password': password.text,
      },
    );
    final responseJson = await json.decode(response.body);
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
        if (!mounted) return;
        context.goNamed('OnBoarding');
      }
    } else {
      if (!mounted) return;

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

  Future<void> validateGuest(
      WidgetRef ref, BuildContext context, bool mounted) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isGuest', true);

    await prefs.setBool('username', true);
    ref.read(guestProvider.notifier).update((state) => true);
    if (!mounted) return;

    GoRouter.of(context).goNamed('OnBoarding');
  }

  Future<void> logOut(BuildContext context, WidgetRef ref, bool guest) async {
    const url = '$restAPIURL/logout/';
    final response = await client.post(
      Uri.parse(url),
      headers: {
        'Authorization': 'Token ${getToken(ref)}',
      },
    );

    final emptyError = response.body.contains("No credentials provided");
    if (response.statusCode == 204) {
      CacheHelper.remove('username');

      context.go('/login');
    } else if (isGuest || guest || emptyError) {
      CacheHelper.remove('isGuest');

      context.go('/login');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(context.locale.languageCode == "en"
            ? 'Something went wrong'
            : "هناك خطأ ما"),
      ));
    }
  }

  String? getToken(WidgetRef ref) {
    final tokenLocale = ref.read(userTokenProvider.notifier).state;
    if (tokenLocale.isNotEmpty) {
      log("Token", name: tokenLocale);
      return tokenLocale;
    } else {
      return CacheHelper.getString("token");
    }
  }

  Future<void> getUser(WidgetRef ref) async {
    if (testID != 0) {
      ref.read(userIDProvider.notifier).update((state) => testID);
    }
  }
}
