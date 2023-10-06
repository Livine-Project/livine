import 'dart:developer';
import 'dart:io';
import '../../constants/constants.dart';
import '../../features/get_recipes/domain/recipe/recipe.dart';
import '../device_info/device_info.dart';

Future<void> errorToDjango(dynamic error) async {
  await GetDeviceInfo.init();
  Uri url = Uri.parse("$restAPIURL/errors/");

  String? sdk = GetDeviceInfo.deviceSDK();
  String? brand = GetDeviceInfo.deviceBrand();
  String? version = GetDeviceInfo.deviceVersion();
  String device = Platform.isAndroid == true ? "Android" : "Windows";
  var response = await client.post(url, body: {
    "model": "$brand",
    "device_version": "$version",
    "device": "$device $sdk",
    "error": error,
  });

  log(response.body);
}
