import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../constants/constants.dart';
import '../../../get_recipes/domain/recipe/recipe.dart';
import 'package:package_info_plus/package_info_plus.dart';

final updateServiceProvider = Provider((ref) => UpdateService(ref));

final getCurrentVersionProvider = FutureProvider<String>((ref) async {
  String version = await ref.watch(updateServiceProvider).getCurrentVersion();
  return version;
});
final getDeviceHardwareProvider = FutureProvider<List<String>>((ref) async {
  List<String> hardware =
      await ref.watch(updateServiceProvider).getDeviceHardware();
  return hardware;
});

class UpdateService {
  UpdateService(this.ref) : super();
  String currentVersion = '';
  String downloadUrl = '';
  String progress = "0.0";
  String? status;
  final Ref ref;

  Future<String> getCurrentVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    currentVersion = await packageInfo.version;
    return currentVersion;
  }

  Future<List<String>> getDeviceHardware() async {
    final deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      var build = await deviceInfo.androidInfo;
      return build.supportedAbis;
    }
    return [];
  }

  Future<bool> isUpdated(
      Function(Function()) setState, bool mounted, String hardwares) async {
    final response = await client
        .post(Uri.parse('$restAPIURL/update/'), body: {"hardware": hardwares});

    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (mounted) {
        setState(() {
          currentVersion = packageInfo.version;
          downloadUrl = data['download_url'];
        });
      }
      if (currentVersion == data['latest_version']) {
        return true;
      }
    } else {
      throw Exception('Failed to get updates');
    }
    return false;
  }

  // installUpdate(Function(Function()) setState, bool mounted) async {
  //   try {
  //     OtaUpdate()
  //         .execute(
  //       downloadUrl,
  //       destinationFilename: 'livine.apk',
  //     )
  //         .listen((OtaEvent event) {
  //       if (mounted) {
  //         setState(() {
  //           progress = event.value.toString();
  //           status = event.status.toString();
  //         });
  //       }
  //       print('EVENT: ${event.value} : ${event.status}');
  //     });
  //   } catch (e) {
  //     print('Failed to make OTA update. Details: $e');
  //   }
  // }
}
