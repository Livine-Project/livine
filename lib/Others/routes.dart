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
import '../pristine/confirm_payment.dart';
import '../recipe/ingridents.dart';
import '../recipe/recipe_details.dart';

final baseRoutes = GoRouter(
      routes: [
        
        GoRoute(
          path: '/',
          builder: (context,state) =>  username ? Navigation() : Login(),

        ),
                GoRoute(
                  name: "OnBoarding",
          path: '/onboarding',
          builder: (context,state) =>  OnBoarding(),

        ),
        GoRoute(
          path: '/register',
          builder: (context,state) =>  Register(),

        ),
        GoRoute(
          path: '/details',
          builder: (context,state){
           return RecipeDetails(id: state.extra,);
           }

        ),
        GoRoute(
          path: '/navigate',
          builder: (context,state) =>  Navigation(),

        ),
        GoRoute(
          path: '/breakfast',
          builder: (context,state) =>  BreakFast(),

        ),
        GoRoute(
          path: '/dinner',
          builder: (context,state) =>  Dinner(),

        ),
        GoRoute(
          path: '/lunch',
          builder: (context,state) =>  Lunch(),

        ),
        GoRoute(
          path: '/snacks',
          builder: (context,state) =>  Snacks(),

        ),
        GoRoute(
          path: '/terms',
          builder: (context,state) =>  Terms(),

        ),
        GoRoute(
          path: '/privacy',
          builder: (context,state) =>  Privacy(),

        ),
        GoRoute(
          path: '/confirm',
          builder: (context,state) =>  ConfirmPayment(),

        ),
         GoRoute(
          path: '/themeSettings',
          builder: (context,state) =>  ThemeSettings(),

        ),
        GoRoute(
          path: '/ingridents',
          builder: (context,state) {
            
            return Ingridents(ingridentsRecipe: state.extra,);
            },

        ),]
);