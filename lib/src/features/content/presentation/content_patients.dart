import 'dart:developer';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../constants/constants.dart';
import '../../../translations/domain/translation_provider.dart';
import '../../auth/data/user.dart';
import '../../loading/loading.dart';
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
                return Column(
                  children: [
                    Expanded(
                      child: RawScrollbar(
                        thumbColor: colorScheme(context).tertiary,
                        thickness: 5,
                        radius: const Radius.circular(10),
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount:
                                rh.deviceWidth(context) > 600 ? 4 : 2,
                            childAspectRatio: 0.7,
                          ),
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            print(data[index].image);
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
                                    ? colorScheme(context).tertiary
                                    : colorScheme(context).surface,
                                child: Stack(
                                  fit: StackFit.expand,
                                  children: [
                                    CachedNetworkImage(
                                      imageUrl:
                                          "$restAPIMedia/${data[index].image}",
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
                                              ? colorScheme(context)
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
                                                      data[index].name,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        color:
                                                            colorScheme(context)
                                                                .onSurface,
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
                    ({
                      required void Function() onPressed,
                      required bool isLoading,
                      required String text,
                      Color? color,
                      Color? textColor,
                      double width = 350,
                      required BuildContext context,
                    }) {
                      final theme = Theme.of(context).colorScheme;
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: MaterialButton(
                          onPressed: onPressed,
                          color: color ?? theme.primaryContainer,
                          elevation: 0,
                          minWidth: width,
                          height: 60,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: isLoading
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : Text(
                                  text,
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: textColor ??
                                          theme.onPrimaryContainer),
                                ),
                        ),
                      );
                    }(
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
                        text: word?.choose ?? "Choose",
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
