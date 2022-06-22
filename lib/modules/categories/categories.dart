// import 'package:cloud_firestore/cloud_firestore.dart';
// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'package:flutter/material.dart';

import '../../main.dart';
import '../../shared/components/widgets/recipe/food_category_widget.dart';
import '../../shared/constants/constants.dart';
import '../../translations/locale_keys.g.dart';

class Patient extends StatefulWidget {
  static _PatientState? of(BuildContext context) =>
      context.findAncestorStateOfType<_PatientState>();
  @override
  _PatientState createState() => _PatientState();
}

class _PatientState extends State<Patient> {
  @override
  void initState() {
    super.initState();
    adHelper.nativeBannerFunction(setState);
  }

  @override
  void dispose() {
    adHelper.nativeAdBanner.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.count(
          physics: BouncingScrollPhysics(),
          crossAxisCount: rh.responsiveCatogeries(context),
          childAspectRatio: 3 / 2,
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
            if (adHelper.isnativeBannerAdLoaded && testID != 10 && kReleaseMode) ...[
              Container(
                height: adHelper.nativeAdBanner.size.height.toDouble(),
                width: adHelper.nativeAdBanner.size.width.toDouble(),
                child: AdWidget(ad: adHelper.nativeAdBanner),
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
        ),
      )),
    );
  }
}
