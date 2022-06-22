import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdHelper {
  static String get nativeadunit {
    if (Platform.isAndroid) {
      return "ca-app-pub-1056698201610872/1548122447";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  bool isnativeBannerAdLoaded = false;
  bool isInlineBannerAdLoaded = false;

  final int inlineAdIndex = 2;

  late BannerAd nativeAdBanner;
  late BannerAd inlineBannerAd;

  void nativeBannerFunction(void Function(void Function()) setState) {
    nativeAdBanner = BannerAd(
        adUnitId: AdHelper.nativeadunit,
        size: AdSize.largeBanner,
        request: AdRequest(),
        listener: BannerAdListener(onAdLoaded: (_) {
          setState(() {
            isnativeBannerAdLoaded = true;
          });
        }, onAdFailedToLoad: (ad, error) {
          print(error);
          ad.dispose();
        }));
    nativeAdBanner.load();
  }

  void inlineAdBanner(void Function(void Function()) setState) {
    inlineBannerAd = BannerAd(
        size: AdSize.mediumRectangle,
        adUnitId: AdHelper.nativeadunit,
        listener: BannerAdListener(onAdLoaded: (_) {
          setState(() {
            isInlineBannerAdLoaded = true;
          });
        }, onAdFailedToLoad: (ad, error) {
          print(error);
          ad.dispose();
        }),
        request: AdRequest());
    inlineBannerAd.load();
  }

  int getListViewItemIndex(int index) {
    if (index >= inlineAdIndex && isInlineBannerAdLoaded && kReleaseMode) {
      return index -1 ;
    }
    return index;
  }
}
