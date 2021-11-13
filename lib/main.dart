// import 'package:app/auth/register.dart';
// import 'package:app/auth/reset_password.dart';
import 'package:app/Others/loading.dart';
import 'package:app/Settings/Feedback/bugReport.dart';
import 'package:app/Settings/Misc/Terms.dart';
import 'package:app/Settings/Misc/privacy.dart';
import 'package:app/Settings/Theme/themeSettings.dart';
import 'package:app/auth/login.dart';
import 'package:app/auth/register.dart';
import 'package:app/categories/breakfast.dart';
import 'package:app/categories/dinner.dart';
import 'package:app/categories/lunch.dart';
import 'package:app/categories/snacks.dart';
import 'package:app/intro/base.dart';
import 'package:app/intro/boarding.dart';
import 'package:app/pages/calendar.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Others/theme.dart';

import 'l10n/l10n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app/Others/theme.dart';
import 'package:device_preview/device_preview.dart';

import 'recipe/recipeDetails.dart';

var username;
var connectivityResult;
FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();
   username = prefs.getBool('username') ?? false;


  final AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/launcher_icon');
  InitializationSettings initializationSettings = new InitializationSettings(
    android: initializationSettingsAndroid
  );

  flutterLocalNotificationsPlugin.initialize(initializationSettings);

 connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
  runApp(ProviderScope(
    overrides: [
      sharedPrefProvider.overrideWithValue(
        await SharedPreferences.getInstance(),
      ),
    ],
    child: MyApp(),
  ));
    
  } else {
      runApp(ProviderScope(
    overrides: [
      sharedPrefProvider.overrideWithValue(
        await SharedPreferences.getInstance(),
      ),
    ],
    child: NoConnection(),
  ));}


}
    // child: DevicePreview(builder:(context) => MyApp()),

class NoConnection extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return NoConnectionMaterial();
  }
}

final sharedPrefProvider =
    Provider<SharedPreferences>((ref) => throw UnimplementedError());
final themeProvider = ChangeNotifierProvider((ref) => ThemeNotifer(ref));


class NoConnectionMaterial extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: NoConnectionWidget(),
    
    );
  }
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialAppWithTheme();
  }
}


class MaterialAppWithTheme extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
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
      locale: DevicePreview.locale(context), // Add the locale here
      builder: DevicePreview.appBuilder, // Add the builder here

      home: username ? Navigation() : Login(),
      themeMode: theme.themeMode,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
    
      routes: {
        '/onboarding': (context) => OnBoarding(),
        '/navigate': (context) => Navigation(),
        '/bugReport': (context) => BugReport(),
        '/themeSettings': (context) => ThemeSettings(),
        '/breakfast' : (context) => BreakFast(),
        '/dinner' : (context) => Dinner(),
        '/lunch' : (context) => Lunch(),
        '/snacks' : (context) => Snacks(),
        '/login': (context) => Login(),
        '/register': (context) => Register(),
        '/details': (context) => RecipeDetails(),
        // '/reset_password': (context) => Reset_Password(),
        '/terms': (context) => Terms(),
        // '/calories_calc': (context) => Calculator(),
        '/calendar': (context) => Calendar(),
        '/privacy': (context) => Privacy(),
        // '/verify':(context) => VerifyScreen(),
      },
    );
  }
}
