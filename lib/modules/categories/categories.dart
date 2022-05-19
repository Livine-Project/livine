// import 'package:cloud_firestore/cloud_firestore.dart';
// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'package:flutter/material.dart';

import '../../main.dart';
import '../../models/ads/ads_help.dart';
import '../../shared/components/recipe/food_category_widget.dart';
import '../../translations/locale_keys.g.dart';

class Patient extends StatefulWidget {
  @override
  _PatientState createState() => _PatientState();
}

class _PatientState extends State<Patient> {
  int screenCrossCount() {
    if (ResponsiveWrapper.of(context).isTablet) {
      return 1;
    } else if (ResponsiveWrapper.of(context).isMobile) {
      if (ResponsiveWrapper.of(context).orientation == Orientation.portrait)
        return 1;
      else {
        return 2;
      }
    }
    return 1;
  }

  late BannerAd _nativeAdBanner;

  bool _isnativeBannerAdLoaded = false;

  void nativeBannerFunction() {
    _nativeAdBanner = BannerAd(
        adUnitId: AdHelper.nativeadunit,
        size: AdSize.largeBanner,
        request: AdRequest(),
        listener: BannerAdListener(onAdLoaded: (_) {
          setState(() {
            _isnativeBannerAdLoaded = true;
          });
        }, onAdFailedToLoad: (ad, error) {
          ad.dispose();
        }));
    _nativeAdBanner.load();
  }

  @override
  void initState() {
    super.initState();
    nativeBannerFunction();
  }

  @override
  void dispose() {
    _nativeAdBanner.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 8.0, right: 8.0),
          child: OrientationBuilder(
            builder: ((context, orientation) => GridView.count(
              physics: BouncingScrollPhysics(),
                  crossAxisCount: screenCrossCount(),
                  childAspectRatio: 4 / 2.8,
                  shrinkWrap: true,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 10,
                  children: [
                    FoodCategory(
                      navigate: '/breakfast',
                      name: LocaleKeys.Breakfast.tr(),
                      image:
                          "https://top10cairo.com/wp-content/uploads/2015/12/best-breakfast-places-cairo-696x364.jpg",
                      color: Color(0xfff3f37c9),
                    ),
                    FoodCategory(
                      navigate: '/lunch',
                      name: LocaleKeys.Lunch.tr(),
                      image:
                          "https://media.istockphoto.com/photos/keto-diet-foods-picture-id1096945386?b=1&k=20&m=1096945386&s=170667a&w=0&h=whc_B9ltl294rfVBmpu84DB5QxQGjof8KGtAvXjDDfw=",
                      color: Color(0xfff3f37c9),
                    ),
                    if (_isnativeBannerAdLoaded &&
                        testID != 10 &&
                        kReleaseMode) ...[
                      Container(
                        height: _nativeAdBanner.size.height.toDouble(),
                        width: _nativeAdBanner.size.width.toDouble(),
                        child: AdWidget(ad: _nativeAdBanner),
                      ),
                    ],
                    FoodCategory(
                      navigate: '/dinner',
                      name: LocaleKeys.Dinner.tr(),
                      image:
                          "https://images.unsplash.com/photo-1611765083444-a3ce30f1c885?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGRpbm5lcnxlbnwwfHwwfHw%3D&w=1000&q=80",
                      color: (Colors.tealAccent[400])!,
                    ),
                    FoodCategory(
                      navigate: '/snacks',
                      name: LocaleKeys.Snacks.tr(),
                      image:
                          "https://images.unsplash.com/photo-1621939514649-280e2ee25f60?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8c25hY2t8ZW58MHx8MHx8&w=1000&q=80",
                      color: (Colors.tealAccent[400])!,
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
