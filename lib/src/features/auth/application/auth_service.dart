// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../shared/cache/cache_helper.dart';
import '../data/user.dart';
import '../../../constants/constants.dart';
import '../../../constants/shared_constants.dart';
import '../../get_recipes/domain/recipe/recipe.dart';
import '../profiles/data/get_user_data.dart';

final authHelperProvider = Provider(AuthService.new);

class AuthService {
  AuthService(this.ref) : super();

  final Ref ref;

  Future logintoDjango(
      BuildContext context,
      TextEditingController username,
      TextEditingController password,
      bool mounted,
      bool isLoading,
      void Function(void Function()) setState) async {
    try {
      const url = '$restAPIURL/login/';
      final response = await client.post(
        Uri.parse(url),
        body: {
          'username': username.text,
          'password': password.text,
        },
      );
      final responseJson = await json.decode(response.body);
      log("Response Json" + responseJson.toString());

      if (response.statusCode == 200) {
        CacheHelper.setBool("username", true);

        String userToken = responseJson['data']['token'];
        await CacheHelper.setString("token", userToken);
        ref.read(userTokenProvider.notifier).update((state) => userToken);
        if (!mounted) return null;
        if (Platform.isAndroid || Platform.isIOS) {
          if (isBoarded == false) {
            GoRouter.of(context).go('/onboarding');
          } else {
            GoRouter.of(context).go('/navigate');
          }
        } else {
          GoRouter.of(context).go('/navigate');
        }
      } else {
        final errorinLogin = responseJson['non_field_errors'];

        if (!mounted) return null;

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content:
              Text(errorinLogin is List ? errorinLogin.first : errorinLogin),
        ));
        setState(() {
          isLoading = false;
        });
      }
      return null;
    } catch (e) {
      log(error: "Error in Login", e.toString());
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Error occurred while logging in"),
      ));
    }
  }

  Future<String?> registertoDjango(
      BuildContext context,
      TextEditingController? username,
      TextEditingController? email,
      TextEditingController? password,
      bool? isLoading,
      bool? mounted,
      void Function(void Function()) setState) async {
    const url = '$restAPIURL/register/';
    final response = await client.post(
      Uri.parse(url),
      body: {
        'username': username?.text,
        'email': email?.text,
        'password': password?.text,
      },
    );

    if (response.statusCode == 200) {
      if (!mounted!) return null;
      GoRouter.of(context).go('/Login');
    } else {
      setState(() {
        isLoading = false;
      });
    }

    return response.body.toString();
  }

  Future<void> logOutfromDjango(BuildContext context) async {
    const url = '$restAPIURL/logout/';

    final response = await client.post(Uri.parse(url), headers: {
      'Authorization': 'Token ${getToken()}',
    });

    if (response.statusCode == 204) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Loggout out successfuly"),
      ));

      await CacheHelper.remove("username");
      await CacheHelper.remove("token");

      context.go('/login');
    } else {
      logOutAsGuest(context);
    }
  }

  Future<void> logOutAsGuest(
    BuildContext context,
  ) async {
    CacheHelper.remove("username");
    CacheHelper.remove("isGuest").then((value) => context.go('/login'));

    log(error: "isGuest", isGuest.toString());
  }

  String getToken() {
    final token = ref.watch(userTokenProvider);
    if (token.isNotEmpty) {
      return token;
    }
    return CacheHelper.getString("token") ?? '';
  }

  void deleteUser(BuildContext context) async {
    final url = '$restAPIURL/user/delete/';

    final response = await client.delete(Uri.parse(url), headers: {
      'Authorization': 'Token ${getToken()}',
    });

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Account deleted succcessfully"),
      ));

      await CacheHelper.clear();
      context.go('/login');
    } else {
      log("User not Deleted");
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Error deleting account"),
      ));
    }
  }

  Future<void> updateUser(BuildContext context, String username, String email,
      int patientID, bool isVegan) async {
    final url = '$restAPIURL/user/update/';
    final response = await client.post(Uri.parse(url), headers: {
      'Authorization': 'Token ${getToken()}',
    }, body: {
      "username": username,
      "email": email,
      "patient": "$patientID",
      "isVegan": "$isVegan"
    });
    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Account updated succcessfully"),
      ));
    } else {
      log(error: "User not updated", response.body);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Error updating account"),
      ));
    }
  }

  Future<String> getUserUsername() async {
    final userData = await ref.watch(userDataProvider.future);

    log(error: "Username", userData.toString());
    return userData.username ?? "";
  }
}
