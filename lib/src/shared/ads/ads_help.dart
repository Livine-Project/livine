import 'dart:io';

import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdHelper {
  static String get nativeadunit {
    if (Platform.isAndroid) {
      return "ca-app-pub-1056698201610872/1548122447";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }

  bool isnativeBannerAdLoaded = false;

  late BannerAd nativeAdBanner;

  void nativeBannerFunction(void Function(void Function()) setState) {
    nativeAdBanner = BannerAd(
        adUnitId: AdHelper.nativeadunit,
        size: AdSize.largeBanner,
        request: const AdRequest(),
        listener: BannerAdListener(onAdLoaded: (_) {
          setState(() {
            isnativeBannerAdLoaded = true;
          });
        }, onAdFailedToLoad: (ad, error) {
          ad.dispose();
        }));
    nativeAdBanner.load();
  }
}
