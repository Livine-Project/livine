import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:livine/src/features/cooking_list/presentation/cooking_list.dart';
import 'package:livine/src/features/get_recipes/presentation/recipe_details.dart';

import '../common_widgets/recipe/web_view_widget.dart';
import '../constants/shared_constants.dart';
import '../features/auth/favorites/presentation/favorites.dart';
import '../features/auth/login/presentation/login.dart';
import '../features/auth/profiles/presentation/update_profile.dart';
import '../features/auth/register/presentation/register.dart';
import '../features/auth/reset_password/presentation/reset_password.dart';
import '../features/auth/reset_password/presentation/reset_password_confirm.dart';
import '../features/auth/reset_password/presentation/token_validate.dart';
import '../features/auth/welcome/presentation/welcome.dart';
import '../features/content/presentation/content.dart';
import '../features/content/presentation/content_patients.dart';
import '../features/cooking/presentation/cooking.dart';
import '../features/get_recipes/presentation/ingridents.dart';
import '../features/get_recipes/presentation/share_screenshot.dart';
import '../features/meals/presentation/categories.dart';
import '../features/navigation/presentation/base.dart';
import '../features/onboarding/presentation/boarding.dart';
import '../features/settings/presentation/Misc/privacy.dart';
import '../features/settings/presentation/Misc/terms.dart';
import '../features/settings/presentation/accessibility/accessibility.dart';
import '../features/settings/presentation/languages/languages.dart';
import '../features/settings/presentation/notifications/notifications_settings_view.dart';
import '../features/settings/presentation/settings.dart';
import '../features/settings/presentation/theme/theme_settings.dart';

final baseRoutes = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    path: '/',
    builder: (context, state) =>
        username ? const Navigation() : const Welcome(),
  ),
  GoRoute(
    name: "OnBoarding",
    path: '/onboarding',
    builder: (context, state) => OnBoarding(),
  ),
  GoRouteTransition(path: '/login', screen: Login()),
  GoRouteTransition(path: '/register', screen: Register()),
  GoRouteTransition(path: '/navigate', screen: Navigation()),
  GoRouteTransition(path: '/languages', screen: Languages()),
  GoRouteTransition(path: '/settings', screen: SettingsWidget()),
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
  GoRouteTransition(path: '/terms', screen: Terms()),
  GoRouteTransition(path: '/privacy', screen: Privacy()),
  GoRouteTransition(path: '/themeSettings', screen: ThemeSettings()),
  GoRouteTransition(
      path: '/notifications_settings', screen: NotificationsSettings()),
  GoRoute(
    path: '/ingridents',
    builder: (context, state) {
      return Ingridents(
        ingridentsRecipe: state.extra,
      );
    },
  ),
  GoRoute(
    path: '/recipe/details',
    builder: (context, state) {
      return RecipeDetails(
        id: state.extra,
      );
    },
  ),
  GoRouteTransition(path: '/content_patient', screen: ContentPatient()),
  GoRouteTransition(path: '/choose_content', screen: ChooseContent()),
  GoRouteTransition(path: '/update_profile', screen: UpdateProfile()),
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
  GoRouteTransition(path: '/favorites', screen: Favorites()),
  GoRoute(
    path: '/cooking',
    builder: (context, state) {
      return Cooking(
        data: state.extra,
      );
    },
  ),
  GoRouteTransition(path: '/cooking_list', screen: CookingList()),
  GoRouteTransition(path: '/accessibility', screen: Accessibility()),
  GoRoute(
    path: '/share_recipe',
    builder: (context, state) {
      return ShareRecipe(
        data: state.extra!,
      );
    },
  ),
]);

GoRoute GoRouteTransition({required String path, required Widget screen}) {
  return GoRoute(
    path: path,
    pageBuilder: (context, state) => CustomTransitionPage<void>(
      key: state.pageKey,
      child: screen,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1, 0);
        const end = Offset.zero;
        const curve = Curves.easeIn;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(child: child, position: offsetAnimation);
      },
    ),
  );
}
