// import 'package:app/auth/register.dart';
// import 'package:app/auth/reset_password.dart';
// ignore_for_file: depend_on_referenced_packages, prefer_typing_uninitialized_variables, type_annotate_public_apis

import 'package:easy_localization/easy_localization.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'Others/loading.dart';
import 'Others/routes.dart';
import 'Settings/Theme/theme.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'translations/codegen_loader.g.dart';

bool username = false;
var testID;
var connectivityResult;
var userType;
// List<CameraDescription>? cameras;
FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  await EasyLocalization.ensureInitialized();

  final SharedPreferences prefs = await SharedPreferences.getInstance();
  username = prefs.getBool('username') ?? false;
  testID = prefs.getInt('userID');
  userType = prefs.getString("UserType");
    final AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');
  final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
  );

  flutterLocalNotificationsPlugin.initialize(initializationSettings);

  connectivityResult = await Connectivity().checkConnectivity();
  if (connectivityResult == ConnectivityResult.mobile ||
      connectivityResult == ConnectivityResult.wifi) {
    runApp(
      ProviderScope(
        overrides: [
          sharedPrefProvider.overrideWithValue(
            await SharedPreferences.getInstance(),
          ),
        ],
        child: EasyLocalization(
            supportedLocales: [Locale('en'), Locale('ar')],
            path: 'assets/translations',
            fallbackLocale: Locale('en'),
            assetLoader: CodegenLoader(),
            child: MyApp()),
        // child: DevicePreview(

        //   builder:(context) => MyApp()
        //   ),
      ),
    );
  } else {
    runApp(
      ProviderScope(
        overrides: [
          sharedPrefProvider.overrideWithValue(
            await SharedPreferences.getInstance(),
          ),
        ],
        child: NoConnection(),
      ),
    );
  }
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
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      builder: (context, widget) => ResponsiveWrapper.builder(
          ClampingScrollWrapper.builder(context, widget!),
          breakpoints: const [
            ResponsiveBreakpoint.resize(480, name: MOBILE),
            ResponsiveBreakpoint.autoScale(800, name: TABLET),
            ResponsiveBreakpoint.resize(1000, name: DESKTOP),
          ]),
      themeMode: theme.themeMode,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
    );
  }
}
