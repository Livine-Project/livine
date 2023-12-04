import 'dart:io';

import 'package:github/github.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:livine/src/shared/device_info/device_info.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher_string.dart';

enum UpdateAvailableState {
  updateAvailable,
  updateNotAvailable;
}

final checkUpdateProvider =
    Provider<PackageInfoService>(PackageInfoServiceImpl.new);

abstract class PackageInfoService {
  Future<PackageInfo> getPackageInfo();

  Future<UpdateAvailableState> checkIfUpdateAvailable();

  Future<void> downloadUpdates();
}

class PackageInfoServiceImpl implements PackageInfoService {
  final GitHub github = GitHub();
  final githubRepoSlug = RepositorySlug.full('Livine-Project/livine');
  PackageInfoServiceImpl(Ref ref) : super();

  @override
  Future<PackageInfo> getPackageInfo() => PackageInfo.fromPlatform();

  int getExtendedVersionNumber(String version) {
    // Note that if you want to support bigger version cells than 99,
    // just increase the returned versionCells multipliers
    List versionCells = version.split('.');
    versionCells = versionCells.map((i) => int.parse(i)).toList();
    return versionCells[0] * 10000 + versionCells[1] * 100 + versionCells[2];
  }

  @override
  Future<UpdateAvailableState> checkIfUpdateAvailable() async {
    final packageInfo = await getPackageInfo();

    final currentVersion = packageInfo.version;
    final latestRelease =
        await github.repositories.getLatestRelease(githubRepoSlug);
    final latestVersion = latestRelease.tagName?.substring(1);
    if (latestVersion == null) return UpdateAvailableState.updateNotAvailable;
    final _currentVersion = getExtendedVersionNumber(currentVersion);
    final _latestVersion = getExtendedVersionNumber(latestVersion);

    return _currentVersion < _latestVersion
        ? UpdateAvailableState.updateAvailable
        : UpdateAvailableState.updateNotAvailable;
  }

  Future<void> downloadUpdates() async {
    final latestRelease =
        await github.repositories.getLatestRelease(githubRepoSlug);
    final os = Platform.operatingSystem;
    String? installUrl;
    switch (os) {
      case "windows":
        installUrl = latestRelease.assets!
            .firstWhere((element) => element.name!.contains('setup.exe'))
            .browserDownloadUrl;
        if (installUrl == null) return;
        await launchUrlString(installUrl);
        break;

      case "android":
        List<String>? supportedAbis = GetDeviceInfo.deviceABI();
        if (supportedAbis!.contains("armeabi-v7a")) {
          installUrl = latestRelease.assets!
              .firstWhere((element) => element.name!.contains('armeabi-v7a'))
              .browserDownloadUrl;

        } else if (supportedAbis.contains("arm64-v8a")) {
          installUrl = latestRelease.assets!
              .firstWhere(
                  (element) => element.name!.contains('arm64-v8a'))
              .browserDownloadUrl;
        } else if (supportedAbis.contains("x86_64")) {
          installUrl = latestRelease.assets!
              .firstWhere((element) => element.name!.contains('x86_64'))
              .browserDownloadUrl;
        }
        if (installUrl == null) return;
        await launchUrlString(installUrl);

        break;
      default:
    }
  }
}
