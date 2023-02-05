import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';

import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:livine/src/shared/error_django/error_django.dart';
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
  FlutterError.onError = (details) {
    if (kReleaseMode) {
      errorToDjango(details);
    } else {
      FlutterError.dumpErrorToConsole(details);
    }
  };

  WidgetsFlutterBinding.ensureInitialized();

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
  await EasyLocalization.ensureInitialized();
  await CacheHelper.init();

  final isVegan = await container.read(veganServiceProvider).getIsVegan();
  container.read(isVeganProvider.notifier).state = isVegan;
  if (Platform.isAndroid) {
    MobileAds.instance.initialize();
    notificationControl.init();
  }
}

final sharedPrefProvider =
    Provider<SharedPreferences>((ref) => throw UnimplementedError());
