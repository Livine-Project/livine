// import 'package:app/auth/register.dart';
// import 'package:app/auth/reset_password.dart';
// ignore_for_file: depend_on_referenced_packages, prefer_typing_uninitialized_variables, type_annotate_public_apis

import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'Others/loading.dart';
import 'Settings/Feedback/bug_report.dart';
import 'Settings/Misc/privacy.dart';
import 'Settings/Misc/terms.dart';
import 'Settings/Theme/theme.dart';
import 'Settings/Theme/theme_settings.dart';
import 'auth/login.dart';
import 'auth/register.dart';
import 'categories/breakfast.dart';
import 'categories/dinner.dart';
import 'categories/lunch.dart';
import 'categories/snacks.dart';
import 'intro/base.dart';
import 'intro/boarding.dart';
import 'l10n/l10n.dart';
import 'recipe/recipe_details.dart';
import 'package:connectivity/connectivity.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool username = false;
var connectivityResult;
// List<CameraDescription>? cameras;
FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();

  final SharedPreferences prefs = await SharedPreferences.getInstance();
   username = prefs.getBool('username') ?? false;


  final AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');
  final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
  );

  flutterLocalNotificationsPlugin.initialize(initializationSettings);

 connectivityResult = await Connectivity().checkConnectivity();
  if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
  runApp(ProviderScope(
    overrides: [
      sharedPrefProvider.overrideWithValue(
        await SharedPreferences.getInstance(),
      ),
    ],
    child: MyApp(),
    // child: DevicePreview(
    //   builder:(context) => MyApp()
    //   ),
  ),);
    
  } else {
      runApp(ProviderScope(
    overrides: [
      sharedPrefProvider.overrideWithValue(
        await SharedPreferences.getInstance(),
      ),
    ],
    child: NoConnection(),
  ),);}


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
  Widget build(BuildContext context, WidgetRef watch) {

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
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);

    return MaterialApp(
      supportedLocales: L10n.all,
      localizationsDelegates: const [
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

        // '/scan': (context) => ScanObject(),

        // '/reset_password': (context) => Reset_Password(),
        '/terms': (context) => Terms(),
        // '/calories_calc': (context) => Calculator(),
        '/privacy': (context) => Privacy(),
        // '/verify':(context) => VerifyScreen(),
      },
    );
  }
}
