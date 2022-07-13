import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:livine/shared/controllers/cache/cache_helper.dart';
import 'package:lottie/lottie.dart';

import '../../models/user/user.dart';
import '../../shared/constants/constants.dart';
import '../../shared/components/misc/loading.dart';
import '../../models/recipe/recipe_types.dart';
import '../../translations/locale_keys.g.dart';

class ContentPatient extends StatefulWidget {
  const ContentPatient({Key? key}) : super(key: key);

  @override
  State<ContentPatient> createState() => _ContentPatientState();
}

class _ContentPatientState extends State<ContentPatient> {
  int checkedIndex = 0;
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
                return recipesData.when(
                    data: (data) {
                      return Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.6,
                            child: Center(
                              child: GridView.builder(
                                shrinkWrap: true,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: rh.responsiveRecipes(context),
                                ),
                                itemCount: data.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () async {
                                      setState(() {
                                        checkedIndex = index;
                                      });
                                    },
                                    child: Card(
                                      color: checkedIndex == index
                                          ? theme.tertiary
                                          : theme.surface,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Lottie.network(data[index].image,
                                              width: 150),
                                          Text(
                                            context.locale.languageCode == 'en'
                                                ? "${data[index].type} Patient"
                                                : "مريض ${data[index].type_in_arabic}",
                                            style: TextStyle(
                                                color: checkedIndex == index
                                                    ? theme.onTertiary
                                                    : theme.onSurface),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              CacheHelper.setString(
                                  'userType', data[checkedIndex].type);
                              ref
                                  .watch(userTypeProvider.notifier)
                                  .update((state) => data[checkedIndex].type);
                              if (!mounted) return;
                              context.go('/navigate');
                            },
                            child: Container(
                              width: 150,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: theme.primaryContainer,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10))),
                              child: const Icon(
                                Icons.navigate_next_sharp,
                              ),
                            ),
                          ),
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
