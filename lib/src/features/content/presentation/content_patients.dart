import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:livine/src/common_widgets/cacheLottie/cache_lottie.dart';

import '../../../constants/constants.dart';
import '../../../translations/domain/translation_provider.dart';
import '../../auth/data/user.dart';
import '../../../common_widgets/loading/loading.dart';
import '../../auth/application/auth_service.dart';
import '../../../shared/cache/cache_helper.dart';
import '../../auth/profiles/data/get_user_data.dart';
import '../../get_recipes/data/patients.dart';

class ContentPatient extends StatefulWidget {
  const ContentPatient({Key? key}) : super(key: key);

  @override
  State<ContentPatient> createState() => _ContentPatientState();
}

class _ContentPatientState extends State<ContentPatient> {
  int? checkedIndex;
  @override
  Widget build(BuildContext context) {
    final word = TranslationRepo.translate(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          word?.choose_content ?? "",
          style: const TextStyle(fontFamily: 'Kine'),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: HookConsumer(
        builder: ((context, ref, child) {
          final recipesData = ref.watch(getPatientsProvider);
          final guest = ref.watch(guestProvider);

          final userData = ref.watch(userDataProvider).asData?.value;
          return recipesData.when(
              data: (data) {
                return Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Column(
                      children: [
                        Expanded(
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount:
                                  rh.deviceWidth(context) > 600 ? 4 : 3,
                              childAspectRatio: 2 / 3,
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
                                      ? colorScheme(context).secondary
                                      : colorScheme(context).surface,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      CacheLottie(path: data[index].json ?? ""),
                                      Text(
                                        data[index].name,
                                        style: TextStyle(
                                          color: checkedIndex == index
                                              ? colorScheme(context).onSecondary
                                              : colorScheme(context).onSurface,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: IconButton.filled(
                          iconSize: 25,
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
                                  SnackBar(
                                      content:
                                          Text(word!.please_select_situation)));
                            }
                          },
                          icon: Icon(Icons.arrow_forward_outlined)),
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
    );
  }
}
