// import 'package:app/auth/register.dart';
// import 'package:app/auth/reset_password.dart';
import 'package:app/intro/base.dart';
import 'package:app/intro/boarding.dart';
import 'package:app/pages/calendar.dart';
import 'package:app/pages/settings.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Misc/Terms.dart';
import 'Misc/privacy.dart';
import 'Others/theme.dart';
import 'Recipes/eight.dart';
import 'Recipes/five.dart';
import 'Recipes/four.dart';
import 'Recipes/nine.dart';
import 'Recipes/one.dart';
import 'Recipes/seven.dart';
import 'Recipes/six.dart';
import 'Recipes/ten.dart';
import 'Recipes/three.dart';
import 'Recipes/two.dart';
import 'details/patient_detail.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'l10n/l10n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app/Others/theme.dart';

bool dark = false;
var email;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(ProviderScope(
    overrides: [
      sharedPrefProvider.overrideWithValue(
        await SharedPreferences.getInstance(),
      ),
    ],
    child: MyApp(),
  ));
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialAppWithTheme();
  }
}

final sharedPrefProvider =
    Provider<SharedPreferences>((ref) => throw UnimplementedError());
final themeProvider = ChangeNotifierProvider((ref) => ThemeNotifer(ref));



class MaterialAppWithTheme extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    // final theme = Provider.of<ThemeChanger>(context);
    final theme = watch(themeProvider);

    return MaterialApp(
      supportedLocales: L10n.all,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
    
      debugShowCheckedModeBanner: false,
      // home: email == null ? Login() : Navigation(),
      home: Navigation(),
      themeMode: theme.themeMode,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
    
      routes: {
        '/onboarding': (context) => OnBoarding(),
        '/food': (context) => Foods(),
        '/navigate': (context) => Navigation(),
        '/settings': (context) => Settings(),
        // '/login': (context) => Login(),
        // '/register': (context) => Register(),
        // '/reset_password': (context) => Reset_Password(),
        '/terms': (context) => Terms(),
        // '/calories_calc': (context) => Calculator(),
        '/calendar': (context) => Calendar(),
        '/privacy': (context) => Privacy(),
        // '/verify':(context) => VerifyScreen(),
        '/r1': (context) => Recipe(),
        '/r2': (context) => SecondRecipe(),
        '/r3': (context) => ThirdRecipe(),
        '/r4': (context) => FourRecipe(),
        '/r5': (context) => FiveRecipe(),
        '/r6': (context) => SixRecipe(),
        '/r7': (context) => SevenRecipe(),
        '/r8': (context) => EightRecipe(),
        '/r9': (context) => NineRecipe(),
        '/r10': (context) => TenRecipe(),
      },
    );
  }
}
