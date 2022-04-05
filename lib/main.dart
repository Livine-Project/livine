// import 'package:app/auth/register.dart';
// import 'package:app/auth/reset_password.dart';
// ignore_for_file: depend_on_referenced_packages, prefer_typing_uninitialized_variables, type_annotate_public_apis

import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'Others/loading.dart';
import 'Others/routes.dart';
import 'Settings/Theme/theme.dart';
import 'l10n/l10n.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:responsive_framework/responsive_framework.dart';

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

    final _router = baseRoutes;

      
    
    return MaterialApp.router(
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      supportedLocales: L10n.all,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
    
      debugShowCheckedModeBanner: false,
      builder: (context,widget) => ResponsiveWrapper.builder(
        ClampingScrollWrapper.builder(context, widget!),
        breakpoints: const [
            ResponsiveBreakpoint.resize(480, name: MOBILE),
            ResponsiveBreakpoint.autoScale(800, name: TABLET),
            ResponsiveBreakpoint.resize(1000, name: DESKTOP),

        ]
      ),

      // home: username ? Navigation() : Login(),
      themeMode: theme.themeMode,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),

      
      // routes: {
      //   '/onboarding': (context) => OnBoarding(),
      //   '/navigate': (context) => Navigation(),
      //   '/bugReport': (context) => BugReport(),
      //   '/themeSettings': (context) => ThemeSettings(),
      //   '/breakfast' : (context) => BreakFast(),
      //   '/dinner' : (context) => Dinner(),
      //   '/lunch' : (context) => Lunch(),
      //   '/snacks' : (context) => Snacks(),
      //   '/login': (context) => Login(),
      //   '/register': (context) => Register(),
      //   '/details': (context) => RecipeDetails(),

      //   // '/scan': (context) => ScanObject(),

      //   // '/reset_password': (context) => Reset_Password(),

      //   '/terms': (context) => Terms(),
      //   '/privacy': (context) => Privacy(),

      //   '/confirm': (context) => ConfirmPayment(),

      // },
      
    );
  }
}
