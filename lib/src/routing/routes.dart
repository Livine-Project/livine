import 'package:go_router/go_router.dart';


import '../constants/shared_constants.dart';
import '../common_widgets/recipe/web_view_widget.dart';
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
import '../features/get_recipes/presentation/ingridents.dart';
import '../features/meals/presentation/categories.dart';
import '../features/navigation/presentation/base.dart';
import '../features/onboarding/presentation/boarding.dart';
import '../features/premium_pristine/presentation/confirm_payment.dart';
import '../features/scan_food/presentation/scan.dart';
import '../features/settings/presentation/Misc/privacy.dart';
import '../features/settings/presentation/Misc/terms.dart';
import '../features/settings/presentation/languages/languages.dart';
import '../features/settings/presentation/notifications/notifications_settings_view.dart';
import '../features/settings/presentation/settings.dart';
import '../features/settings/presentation/theme/theme_settings.dart';

final baseRoutes = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) =>
        username ? const Navigation() : const Welcome(),
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
    path: '/favorites',
    builder: (context, state) {
      return const Favorites();
    },
  ),
]);
