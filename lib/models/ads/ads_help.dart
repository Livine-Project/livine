import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../modules/categories/categories.dart';

class AdHelper {
  static String get nativeadunit {
    if (Platform.isAndroid) {
      return "ca-app-pub-1056698201610872/1548122447";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  late BannerAd nativeAdBanner;

  bool isnativeBannerAdLoaded = false;

  void nativeBannerFunction(BuildContext context) {
    nativeAdBanner = BannerAd(
        adUnitId: AdHelper.nativeadunit,
        size: AdSize.largeBanner,
        request: AdRequest(),
        listener: BannerAdListener(onAdLoaded: (_) {
          Patient.of(context)?.outsideState();
        }, onAdFailedToLoad: (ad, error) {
          ad.dispose();
        }));
    nativeAdBanner.load();
  }
}
