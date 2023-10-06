import 'dart:io';

import 'src/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'src/constants/constants.dart';
import 'src/shared/cache/cache_helper.dart';
import 'src/features/get_recipes/application/vegan_service.dart';
import 'package:device_preview/device_preview.dart';

import 'src/shared/device_info/device_info.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

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
        builder: (context) => const MyApp(),
      ),
    ),
  );

  await CacheHelper.init();
  await GetDeviceInfo.init();
  final isVegan = await container.read(veganServiceProvider).getIsVegan();
  container.read(isVeganProvider.notifier).state = isVegan;
  if (Platform.isAndroid) {
    notificationControl.init();
  }
}

final sharedPrefProvider =
    Provider<SharedPreferences>((ref) => throw UnimplementedError());
