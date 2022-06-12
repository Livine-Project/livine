import 'package:flutter/cupertino.dart';

import 'package:go_router/go_router.dart';
import '../../../main.dart';
import '../../../modules/Settings/notifications_settings/notifications_settings_view.dart';
import '../../../modules/auth/login.dart';
import '../../../modules/auth/register.dart';
import '../../../modules/home/scan/scan.dart';
import '../../../modules/recipe/ingridents.dart';
import '../../../modules/Settings/Misc/privacy.dart';
import '../../../modules/Settings/Misc/terms.dart';
import '../../../modules/Settings/Theme/theme_settings.dart';
import '../../../modules/Settings/languages.dart';
import '../../../modules/Settings/settings.dart';
import '../../../modules/categories/breakfast.dart';
import '../../../modules/categories/dinner.dart';
import '../../../modules/categories/lunch.dart';
import '../../../modules/categories/snacks.dart';
import '../../../modules/content/content.dart';
import '../../../modules/content/content_patients.dart';
import '../../../modules/pristine/confirm_payment.dart';
import '../../../modules/recipe/recipe_details.dart';
import '../intro/base.dart';
import '../intro/boarding.dart';
import '../recipe/web_view_widget.dart';

final baseRoutes = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => username ? Navigation() : Login(),
  ),
  GoRoute(
    name: "OnBoarding",
    path: '/onboarding',
    builder: (context, state) => OnBoarding(),
  ),
  GoRoute(
    path: '/register',
    builder: (context, state) => Register(),
  ),
  GoRoute(
    path: '/login',
    builder: (context, state) => Login(),
  ),
  GoRoute(
    path: '/scan',
    builder: (context, state) => Scan(),
  ),
  GoRoute(
      path: '/details',
      pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: RecipeDetails(id: state.extra),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var begin = Offset(0.0, 1.0);
            var end = Offset(0.0, 0.0);
            var tween = Tween(begin: begin, end: end);
            var offsetAnimation = animation.drive(tween);
            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          })),
  GoRoute(
    path: '/navigate',
    builder: (context, state) => Navigation(),
  ),
  GoRoute(
    path: '/languages',
    builder: (context, state) => Languages(),
  ),
  GoRoute(
    path: '/settings',
    builder: (context, state) => SettingsWidget(),
  ),
  GoRoute(
    path: '/breakfast',
    builder: (context, state) => BreakFast(),
  ),
  GoRoute(
    path: '/dinner',
    builder: (context, state) => Dinner(),
  ),
  GoRoute(
    path: '/lunch',
    builder: (context, state) => Lunch(),
  ),
  GoRoute(
    path: '/snacks',
    builder: (context, state) => Snacks(),
  ),
  GoRoute(
    path: '/terms',
    builder: (context, state) => Terms(),
  ),
  GoRoute(
    path: '/privacy',
    builder: (context, state) => Privacy(),
  ),
  GoRoute(
    path: '/confirm',
    builder: (context, state) => ConfirmPayment(),
  ),
  GoRoute(
    path: '/themeSettings',
    builder: (context, state) => ThemeSettings(),
  ),
  GoRoute(
    path: '/notifications_settings',
    name: "Notifications Settings",
    builder: (context, state) => NotificationsSettings(),
  ),
  GoRoute(
    path: '/ingridents',
    builder: (context, state) {
      return Ingridents(
        ingridentsRecipe: state.extra,
      );
    },
  ),
  GoRoute(
    name: "Content",
    path: '/choose_content',
    builder: (context, state) => ChooseContent(),
  ),
  GoRoute(
    name: "Content_Patient",
    path: '/content_patient',
    builder: (context, state) => ContentPatient(),
  ),
  GoRoute(
    name: "recipeVideo",
    path: '/recipe_video',
    builder: (context, state) {
      return RecipeVideoWidget(url: state.extra.toString());
    },
  ),
]);
