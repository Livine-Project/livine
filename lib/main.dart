import 'dart:io';

import 'package:discord_rpc/discord_rpc.dart';

import 'src/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' as riverpod;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:window_manager/window_manager.dart';

import 'src/constants/constants.dart';
import 'src/shared/cache/cache_helper.dart';
import 'src/features/get_recipes/application/vegan_service.dart';
import 'package:device_preview/device_preview.dart';

import 'src/shared/device_info/device_info.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isWindows) {
    await windowManager.ensureInitialized();

    WindowOptions windowOptions = const WindowOptions(
      size: Size(1300, 750),
      minimumSize: Size(1100, 750),
      backgroundColor: Colors.transparent,
      skipTaskbar: false,
      titleBarStyle: TitleBarStyle.hidden,
    );
    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();

      await windowManager.focus();
    });
    DiscordRPC.initialize();
    DiscordRPC rpc = DiscordRPC(
      applicationId: '1159142586611675176',
    );
    rpc.start(autoRegister: true);
    rpc.updatePresence(
      DiscordPresence(
        state: 'Viewing recipes',
        details: '',
        startTimeStamp: DateTime.now().millisecondsSinceEpoch,
        largeImageKey: 'main',
        largeImageText: 'livine',
        smallImageKey: 'small_image',
        smallImageText: 'This text describes the small image.',
      ),
    );
  }

  final container = riverpod.ProviderContainer(
    overrides: [
      sharedPrefProvider.overrideWithValue(
        await SharedPreferences.getInstance(),
      ),
    ],
  );

  runApp(
    riverpod.UncontrolledProviderScope(
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
    riverpod.Provider<SharedPreferences>((ref) => throw UnimplementedError());
