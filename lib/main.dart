// import 'package:app/auth/register.dart';
// import 'package:app/auth/reset_password.dart';
// ignore_for_file: depend_on_referenced_packages, prefer_typing_uninitialized_variables, type_annotate_public_apis


import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'modules/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:responsive_framework/responsive_framework.dart';

import 'modules/Settings/Theme/theme.dart';

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
      connectivityResult == ConnectivityResult.wifi ||
      connectivityResult == ConnectivityResult.ethernet) {
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

final sharedPrefProvider =
    Provider<SharedPreferences>((ref) => throw UnimplementedError());
final themeProvider = ChangeNotifierProvider((ref) => ThemeNotifer(ref));
