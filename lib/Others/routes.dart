import 'package:flutter/cupertino.dart';

import '../Settings/languages.dart';
import '../Settings/settings.dart';
import '../main.dart';
import 'package:go_router/go_router.dart';

import '../Settings/Misc/privacy.dart';
import '../Settings/Misc/terms.dart';
import '../Settings/Theme/theme_settings.dart';
import '../auth/login.dart';
import '../auth/register.dart';
import '../categories/breakfast.dart';
import '../categories/dinner.dart';
import '../categories/lunch.dart';
import '../categories/snacks.dart';
import '../intro/base.dart';
import '../intro/boarding.dart';
import '../pages/content/content.dart';
import '../pages/content/content_patients.dart';
import '../pristine/confirm_payment.dart';
import '../recipe/ingridents.dart';
import '../recipe/recipe_details.dart';

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
      path: '/details',
      pageBuilder: (context,state) => CustomTransitionPage(
        key: state.pageKey,
        child: RecipeDetails(id: state.extra),
        transitionsBuilder: (context,animation,secondaryAnimation,child){
          var begin = Offset(0.0,1.0);
          var end = Offset(0.0,0.0);
          var tween = Tween(begin: begin,end:end);
          var offsetAnimation = animation.drive(tween);
          return SlideTransition(position: offsetAnimation,child: child,);
        }

        )
      
      ),
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
]);
