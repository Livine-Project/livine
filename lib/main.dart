// import 'package:app/auth/register.dart';
// import 'package:app/auth/reset_password.dart';
// ignore_for_file: depend_on_referenced_packages, prefer_typing_uninitialized_variables, type_annotate_public_apis

import 'dart:io';

import 'package:easy_localization/easy_localization.dart';

import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:window_manager/window_manager.dart';

import 'src/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'src/constants/constants.dart';
import 'src/shared/cache/cache_helper.dart';
import 'src/features/get_recipes/application/vegan_service.dart';
import 'src/translations/codegen_loader.g.dart';
import 'package:device_preview/device_preview.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isAndroid) {
    MobileAds.instance.initialize();
    notificationControl.init();

  }

  await EasyLocalization.ensureInitialized();

  await CacheHelper.init();


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


   
  }
  final container = ProviderContainer(
    overrides: [
      sharedPrefProvider.overrideWithValue(
        await SharedPreferences.getInstance(),
      ),
    ],
  );
  final isVegan = await container.read(veganServiceProvider).getIsVegan();
  container.read(isVeganProvider.state).state = isVegan;

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: DevicePreview(
        enabled: false,
        tools: [
          ...DevicePreview.defaultTools,
        ],
        builder: (context) => EasyLocalization(
            supportedLocales: const [Locale('en'), Locale('ar')],
            path: 'assets/translations',
            fallbackLocale: const Locale('en'),
            assetLoader: const CodegenLoader(),
            child: const MyApp()),
      ),
    ),
  );
}

final sharedPrefProvider =
    Provider<SharedPreferences>((ref) => throw UnimplementedError());
