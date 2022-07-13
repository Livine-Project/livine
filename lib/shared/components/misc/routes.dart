import 'package:flutter/cupertino.dart';

import 'package:go_router/go_router.dart';
import '../../../modules/Settings/notifications_settings/notifications_settings_view.dart';
import '../../../modules/auth/login.dart';
import '../../../modules/auth/register.dart';
import '../../../modules/auth/reset_password.dart';
import '../../../modules/auth/reset_password_confirm.dart';
import '../../../modules/auth/token_validate.dart';
import '../../../modules/home/scan/scan.dart';
import '../../../modules/meals/categories.dart';
import '../../../modules/profile/update_profile.dart';
import '../../../modules/recipe/ingridents.dart';
import '../../../modules/Settings/Misc/privacy.dart';
import '../../../modules/Settings/Misc/terms.dart';
import '../../../modules/Settings/Theme/theme_settings.dart';
import '../../../modules/Settings/languages.dart';
import '../../../modules/Settings/settings.dart';

import '../../../modules/content/content.dart';
import '../../../modules/content/content_patients.dart';
import '../../../modules/pristine/confirm_payment.dart';
import '../../../modules/recipe/recipe_details.dart';
import '../../../modules/trackers/water/glass_water.dart';
import '../../constants/shared_constants.dart';
import '../intro/base.dart';
import '../intro/boarding.dart';
import '../widgets/recipe/web_view_widget.dart';

final baseRoutes = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => username ? const Navigation() : const Login(),
  ),
  GoRoute(
    
    name: "OnBoarding",
    path: '/onboarding',
    builder: (context, state) => const OnBoarding(),
  ),
  GoRoute(
    path: '/register',
    builder: (context, state) => const Register(),
  ),
  GoRoute(
    path: '/login',
    name: "Login",
    builder: (context, state) => const Login(),
  ),
  GoRoute(
    path: '/scan',
    builder: (context, state) => const Scan(),
  ),
  GoRoute(
      path: '/details',
      pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: RecipeDetails(id: state.extra),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var begin = const Offset(0.0, 1.0);
            var end = const Offset(0.0, 0.0);
            var tween = Tween(begin: begin, end: end);
            var offsetAnimation = animation.drive(tween);
            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          })),
  GoRoute(
    path: '/navigate',
    builder: (context, state) => const Navigation(),
  ),
  GoRoute(
    path: '/languages',
    builder: (context, state) => const Languages(),
  ),
  GoRoute(
    path: '/settings',
    builder: (context, state) => const SettingsWidget(),
  ),
  GoRoute(
    path: '/breakfast',
    builder: (context, state) => const BreakFast(),
  ),
  GoRoute(
    path: '/dinner',
    builder: (context, state) => const Dinner(),
  ),
  GoRoute(
    path: '/lunch',
    builder: (context, state) => const Lunch(),
  ),
  GoRoute(
    path: '/snacks',
    builder: (context, state) => const Snacks(),
  ),
  GoRoute(
    path: '/terms',
    builder: (context, state) => const Terms(),
  ),
  GoRoute(
    path: '/privacy',
    builder: (context, state) => const Privacy(),
  ),
  GoRoute(
    path: '/confirm',
    builder: (context, state) => const ConfirmPayment(),
  ),
  GoRoute(
    path: '/themeSettings',
    builder: (context, state) => const ThemeSettings(),
  ),
  GoRoute(
    path: '/notifications_settings',
    name: "Notifications Settings",
    builder: (context, state) => const NotificationsSettings(),
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
    builder: (context, state) => const ChooseContent(),
  ),
  GoRoute(
    name: "Content_Patient",
    path: '/content_patient',
    builder: (context, state) => const ContentPatient(),
  ),
  GoRoute(
    name: "Update Profile",
    path: '/update_profile',
    builder: (context, state) {
      return const UpdateProfile();
    },
  ),
  GoRoute(
    name: "recipeVideo",
    path: '/recipe_video',
    builder: (context, state) {
      return RecipeVideoWidget(url: state.extra.toString());
    },
  ),
  GoRoute(
    name: "Reset Pass",
    path: '/reset_password',
    builder: (context, state) {
      return const ResetPassword();
    },
  ),
  GoRoute(
    path: '/token_validate',
    builder: (context, state) {
      return const TokenValidate();
    },
  ),
  GoRoute(
    path: '/confirm_pass',
    builder: (context, state) {
      return PasswordConfirmation(
        token: state.extra,
      );
    },
  ),
  GoRoute(
    path: '/glass_water',
    builder: (context, state) {
      return GlassWater(data: state.extra);
    },
  ),
]);
