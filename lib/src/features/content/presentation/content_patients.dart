import 'dart:developer';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:livine/src/constants/constants.dart';

import '../../auth/data/user.dart';
import '../../loading/loading.dart';
import '../../auth/application/auth_service.dart';
import '../../../shared/cache/cache_helper.dart';
import '../../../common_widgets/auth/auth_widget.dart';
import '../../auth/profiles/data/get_user_data.dart';
import '../../get_recipes/data/patient_types.dart';
import '../../../translations/locale_keys.g.dart';

class ContentPatient extends StatefulWidget {
  const ContentPatient({Key? key}) : super(key: key);

  @override
  State<ContentPatient> createState() => _ContentPatientState();
}

class _ContentPatientState extends State<ContentPatient> {
  int? checkedIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.Iam_a.tr(),
          style: const TextStyle(fontFamily: 'Kine'),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: HookConsumer(
        builder: ((context, ref, child) {
          final recipesData = ref.watch(patientTypesProvider);
          final guest = ref.watch(guestProvider);

          final userData = ref.watch(userDataProvider).asData?.value;
          return recipesData.when(
              data: (data) {
                return Column(
                  children: [
                    Expanded(
                      child: RawScrollbar(
                        thumbColor: getColorScheme(context).tertiary,
                        thickness: 5,
                        radius: const Radius.circular(10),
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: rh.deviceWidth(context) > 600 ? 4 : 2,
                            childAspectRatio: 0.7,
                          ),
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  checkedIndex = index;
                                });
                                log(index.toString());
                              },
                              child: Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                color: checkedIndex == index
                                    ? getColorScheme(context).tertiary
                                    : getColorScheme(context).surface,
                                child: Stack(
                                  fit: StackFit.expand,
                                  children: [
                                    CachedNetworkImage(
                                      imageUrl:
                                          "$restAPIMedia/${data[index].imageURL}",
                                      fit: BoxFit.cover,
                                    ),
                                    ClipRRect(
                                      // Clip it cleanly.
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                          sigmaX:
                                              checkedIndex == index ? 10 : 0,
                                          sigmaY:
                                              checkedIndex == index ? 10 : 0,
                                        ),
                                        child: Container(
                                          color: checkedIndex == index
                                              ? getColorScheme(context)
                                                  .primaryContainer
                                                  .withOpacity(0.5)
                                              : Colors.transparent,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10),
                                            child: Align(
                                              alignment: Alignment.bottomCenter,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                child: Container(
                                                  width: 140.0,
                                                  height: 60.0,
                                                  decoration: BoxDecoration(
                                                      color: checkedIndex !=
                                                              index
                                                          ? Theme.of(context)
                                                              .colorScheme
                                                              .primaryContainer
                                                              .withOpacity(0.6)
                                                          : Colors.transparent),
                                                  child: Center(
                                                    child: Text(
                                                      context.locale
                                                                  .languageCode ==
                                                              'en'
                                                          ? "${data[index].name} Patient"
                                                          : "مريض ${data[index].name_in_arabic}",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        color: getColorScheme(
                                                                context)
                                                            .onSurface,
                                                        fontFamily: context
                                                                    .locale
                                                                    .languageCode ==
                                                                "en"
                                                            ? 'Kine'
                                                            : GoogleFonts
                                                                    .notoKufiArabic()
                                                                .fontFamily,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    authButton(
                        onPressed: () {
                          if (checkedIndex != null) {
                            CacheHelper.setInt(
                                'patientID', data[checkedIndex!].id);

                            ref
                                .watch(userTypeProvider.notifier)
                                .update((state) => data[checkedIndex!].id);
                            guest == false
                                ? ref.read(authHelperProvider).updateUser(
                                    context,
                                    userData?.username ?? "",
                                    userData?.email ?? "",
                                    data[checkedIndex!].id,
                                    userData?.isVegan ?? false)
                                : null;

                            if (!mounted) return;
                            context.go('/navigate');
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text("Please select your situation")));
                          }
                        },
                        isLoading: false,
                        text: context.locale.languageCode == "en"
                            ? "Continue"
                            : "التالي",
                        context: context)
                  ],
                );
              },
              error: (e, s) {
                log('$e\n$s');
                return kDebugMode ? Text(e.toString()) : const Loading();
              },
              loading: () => const Loading());
        }),
      ),
    );
  }
}
