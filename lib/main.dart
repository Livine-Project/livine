// import 'package:app/auth/register.dart';
// import 'package:app/auth/reset_password.dart';
// ignore_for_file: depend_on_referenced_packages, prefer_typing_uninitialized_variables, type_annotate_public_apis

import 'dart:io';

import 'package:auto_updater/auto_updater.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:window_manager/window_manager.dart';

import 'modules/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'modules/Settings/Theme/theme.dart';

import 'shared/constants/constants.dart';
import 'shared/controllers/cache/cache_helper.dart';
import 'translations/codegen_loader.g.dart';

var connectivityResult;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!Platform.isWindows) {
    MobileAds.instance.initialize();
  }

  await EasyLocalization.ensureInitialized();

  await CacheHelper.init();

  notificationControl.init();

  if (Platform.isWindows) {
    await windowManager.ensureInitialized();

    WindowOptions windowOptions = const WindowOptions(
      size: Size(1300, 750),
      minimumSize: Size(1100, 750),
      center: true,
      backgroundColor: Colors.transparent,
      skipTaskbar: false,
      title: "Livine",
      titleBarStyle: TitleBarStyle.hidden,
    );
    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();

      await windowManager.focus();
    });

    String feedURL = '$restAPIMedia/media/appcast.xml';

    await autoUpdater.setFeedURL(feedURL);
    await autoUpdater.checkForUpdates();
  }

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
            supportedLocales: const [Locale('en'), Locale('ar')],
            path: 'assets/translations',
            fallbackLocale: const Locale('en'),
            assetLoader: const CodegenLoader(),
            child: const MyApp()),
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
        child: const NoConnection(),
      ),
    );
  }
}

final sharedPrefProvider =
    Provider<SharedPreferences>((ref) => throw UnimplementedError());
final themeProvider = ChangeNotifierProvider((ref) => ThemeNotifer(ref));
