// ignore_for_file: depend_on_referenced_packages, prefer_typing_uninitialized_variables, type_annotate_public_apis, dead_code

import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:livine/src/shared/connectivity/check_network.dart';
import '../../../common_widgets/no_connection.dart';
import '../../../common_widgets/recipe/recipe_grid_view.dart';

import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import '../../../shared/notifications/health_notification.dart';
import '../../../translations/locale_keys.g.dart';
import '../data/get_user_name.dart';
import 'search/search_delegate.dart';

class Home extends ConsumerStatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  @override
  void dispose() async {
    if (Platform.isAndroid) {
      adHelper.nativeAdBanner.dispose();
    }

    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    onlyAndroid();
  }

  onlyAndroid() async {
    if (Platform.isAndroid) {
      showNotification();

      adHelper.nativeBannerFunction(setState);
    }
  }

  @override
  Widget build(BuildContext context) {
    ConnectivityStatus network = ref.watch(checkNetworkProvider);
    String name = ref.watch(userNameProvider).valueOrNull ?? '';
    return network == ConnectivityStatus.On
        ? Scaffold(
            body: SafeArea(
              child: RawScrollbar(
                thumbColor: getColorScheme(context).tertiary,
                thickness: 5,
                radius: const Radius.circular(10),
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RichText(
                                    text: TextSpan(children: [
                                  TextSpan(
                                      text: "${LocaleKeys.Welcome.tr()}\n",
                                      style: TextStyle(
                                          fontSize: 35.0,
                                          fontFamily:
                                              context.locale.languageCode ==
                                                      "en"
                                                  ? 'Kine'
                                                  : GoogleFonts.notoKufiArabic()
                                                      .fontFamily,
                                          color: getColorScheme(context)
                                              .onSurface)),
                                  TextSpan(
                                      text: name,
                                      style: TextStyle(
                                        fontSize: 35.0,
                                        fontFamily: 'Kine',
                                        color:
                                            getColorScheme(context).onSurface,
                                        overflow: TextOverflow.ellipsis,
                                      ))
                                ])),
                                IconButton(
                                    onPressed: () {
                                      showSearch(
                                          context: context,
                                          delegate: CustomSearchDelegate());
                                    },
                                    icon: Icon(Iconsax.search_normal))
                              ],
                            )),
                        if (adHelper.isnativeBannerAdLoaded &&
                            kReleaseMode) ...[
                          Center(
                            child: SizedBox(
                              height: adHelper.nativeAdBanner.size.height
                                  .toDouble(),
                              width:
                                  adHelper.nativeAdBanner.size.width.toDouble(),
                              child: AdWidget(ad: adHelper.nativeAdBanner),
                            ),
                          ),
                        ],
                        const SizedBox(height: 20.0),
                        RecipesGridView(),
                      ]),
                ),
              ),
            ),
            floatingActionButton: Visibility(
              visible: Platform.isAndroid == true,
              child: FloatingActionButton(
                heroTag: "btn1",
                onPressed: () => context.push("/scan"),
                child: Image.asset(
                  'assets/images/icons/scan.png',
                  width: 40,
                  color: getColorScheme(context).onPrimaryContainer,
                ),
              ),
            ),
          )
        : NoConnection();
  }
}
