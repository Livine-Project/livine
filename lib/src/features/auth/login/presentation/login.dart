// ignore_for_file: type_annotate_public_apis

import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:iconsax/iconsax.dart';
import 'package:livine/src/features/auth/application/auth_service.dart';
import 'package:livine/src/shared/cache/cache_helper.dart';

import '../../../../common_widgets/auth/auth_widget.dart';
import '../../../../translations/locale_keys.g.dart';
import '../../data/user.dart';

class Login extends ConsumerStatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  ConsumerState<Login> createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {
  Client client = http.Client();
  final _username = TextEditingController();
  final _password = TextEditingController();

  bool _obscureText = true;
  bool isLoading = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void validateLoginForm() {
    final form = _formKey.currentState!;
    if (form.validate()) {
      setState(() {
        isLoading = true;
      });
      ref
          .read(authHelperProvider)
          .logintoDjango(
              context, _username, _password, mounted, isLoading, setState)
          .then((value) => setState(() {
                isLoading = false;
              }));
    } else {
      debugPrint('form is invalid');
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> validateGuest() async {
    CacheHelper.setBool('isGuest', true);
    CacheHelper.setBool('username', true);
    CacheHelper.remove("userID");
    ref.read(guestProvider.notifier).update((state) => true);
    if (!mounted) return;

    if (Platform.isAndroid || Platform.isIOS) {
      GoRouter.of(context).goNamed('OnBoarding');
    } else {
      GoRouter.of(context).go('/navigate');
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Scaffold(
        body: Row(
      children: [
        Expanded(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    textInputAction: TextInputAction.next,
                    validator: (u) {
                      if (u!.isEmpty) {
                        return context.locale.languageCode == "en"
                            ? "Please enter your username"
                            : "من فضلك ادخل اسم المستخدم";
                      }
                      if (u.contains(" ")) {
                        return context.locale.languageCode == "en"
                            ? "No space allowed in username"
                            : "يجب ان لا يكون هناك مسافة في اسم المستخدم";
                      }
                      return null;
                    },
                    controller: _username,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      labelText: LocaleKeys.username.tr(),
                      labelStyle: const TextStyle(fontSize: 15),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextFormField(
                    validator: (p) {
                      if (p!.length < 6 && p.isNotEmpty) {
                        return context.locale.languageCode == "en"
                            ? "Password needs to be atleast 9 characters "
                            : "يجب أن تتكون كلمة المرور من 9 أحرف على الأقل";
                      } else if (p.isEmpty) {
                        return context.locale.languageCode == "en"
                            ? "Please enter your password "
                            : "من فضلك أدخل كلمة السر";
                      }
                      return null;
                    },
                    controller: _password,
                    obscureText: _obscureText,
                    onFieldSubmitted: (_) => validateLoginForm(),
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText ? Iconsax.eye_slash5 : Iconsax.eye,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                      labelText: LocaleKeys.password.tr(),
                      labelStyle: const TextStyle(fontSize: 15),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 5),
                  child: GestureDetector(
                    onTap: () => context.push('/reset_password'),
                    child: Text(
                      LocaleKeys.Forget_your_password.tr(),
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Kine',
                        color: theme.tertiary,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                authButton(
                    isLoading: isLoading,
                    text: LocaleKeys.Sign_in.tr(),
                    onPressed: validateLoginForm,
                    context: context),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          LocaleKeys.no_account.tr(),
                          style: const TextStyle(
                              fontFamily: 'Kine', fontWeight: FontWeight.w100),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () => context.push('/register'),
                          child: Text(
                            LocaleKeys.Sign_up.tr(),
                            style: TextStyle(
                              fontSize: 15.0,
                              color: theme.tertiary,
                              fontFamily: 'Kine',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                authButton(
                    isLoading: false,
                    text: LocaleKeys.continue_as_guest.tr(),
                    textColor: theme.onSecondaryContainer,
                    onPressed: validateGuest,
                    context: context,
                    color: theme.secondaryContainer),
              ],
            ),
          ),
        ),
        Visibility(
          visible: Platform.isWindows,
          child: Expanded(
              flex: 2,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20)),
                child: Image.asset(
                  'assets/images/windows/login.webp',
                  fit: BoxFit.cover,
                ),
              )),
        ),
      ],
    ));
  }
}
