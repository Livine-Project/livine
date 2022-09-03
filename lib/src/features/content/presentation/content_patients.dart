import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

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
    final theme = Theme.of(context).colorScheme;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            LocaleKeys.Iam_a.tr(),
            style: const TextStyle(fontFamily: 'Kine'),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Column(
          children: [
            Consumer(
              builder: ((context, ref, child) {
                final recipesData = ref.watch(patientTypesProvider);
                final guest = ref.watch(guestProvider);

                final userData = ref.watch(userDataProvider).asData?.value;
                return recipesData.when(
                    data: (data) {
                      return Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.7,
                            child: Center(
                              child: GridView.builder(
                                shrinkWrap: true,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
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
                                      color: checkedIndex == index
                                          ? theme.tertiary
                                          : theme.surface,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            context.locale.languageCode == 'en'
                                                ? "${data[index].name} Patient"
                                                : "مريض ${data[index].name_in_arabic}",
                                            style: TextStyle(
                                              color: checkedIndex == index
                                                  ? theme.onTertiary
                                                  : theme.onSurface,
                                              fontFamily: context.locale
                                                          .languageCode ==
                                                      "en"
                                                  ? 'Kine'
                                                  : GoogleFonts.notoKufiArabic()
                                                      .fontFamily,
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

                                  ref.watch(userTypeProvider.notifier).update(
                                      (state) => data[checkedIndex!].id);
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
                                          content: Text(
                                              "Please select your situation")));
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
          ],
        ));
  }
}
