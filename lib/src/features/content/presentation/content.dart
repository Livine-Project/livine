import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../constants/constants.dart';
import '../../../shared/cache/cache_helper.dart';
import '../../../translations/domain/translation_provider.dart';
import '../../auth/data/user.dart';

import '../../auth/application/auth_service.dart';
import '../../auth/profiles/data/get_user_data.dart';
import '../../loading/loading.dart';

class ChooseContent extends StatefulWidget {
  const ChooseContent({Key? key}) : super(key: key);

  @override
  State<ChooseContent> createState() => _ChooseContentState();
}

class _ChooseContentState extends State<ChooseContent> {
  @override
  Widget build(BuildContext context) {
    final word = TranslationRepo.translate(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 50,
      ),
      body: SingleChildScrollView(
        child: Consumer(
          builder: (context, ref, child) {
            final guest = ref.watch(guestProvider);
            final data = ref.watch(userDataProvider).asData?.value;
            return ResponsiveRowColumn(
              columnMainAxisAlignment: MainAxisAlignment.spaceEvenly,
              layout: rh.devicePortrait(context)
                  ? ResponsiveRowColumnType.COLUMN
                  : ResponsiveRowColumnType.ROW,
              children: [
                ResponsiveRowColumnItem(
                  rowFlex: 1,
                  child: Options(
                    title: word?.general ?? "",
                    description: word?.healthy ?? "",
                    networkImage:
                        'https://media.istockphoto.com/photos/healthy-lifestyle-concept-clean-food-good-health-dietary-in-heart-picture-id953674568?k=20&m=953674568&s=612x612&w=0&h=x_gq29MRpRyhdDIgwF5PVhdXAbINmaBUKMgs27w7i6s=',
                    onpressed: () async {
                      await CacheHelper.setInt("patientID", 5);
                      ref.watch(userTypeProvider.notifier).state = 5;

                      if (!mounted) return;
                      guest == false
                          ? ref.read(authHelperProvider).updateUser(
                              context,
                              data?.username ?? "",
                              data?.email ?? "",
                              5,
                              data?.isVegan ?? false)
                          : null;
                      context.go('/navigate');
                    },
                  ),
                ),
                ResponsiveRowColumnItem(
                  child: SizedBox(
                    width: 20,
                    height: rh.deviceHeight(context) * 0.05,
                  ),
                ),
                ResponsiveRowColumnItem(
                  rowFlex: 1,
                  child: Options(
                    title: word?.per_situation ?? "",
                    description: word?.patient ?? "",
                    networkImage:
                        'https://media.istockphoto.com/photos/its-the-season-of-sneezes-picture-id1085020818?b=1&k=20&m=1085020818&s=170667a&w=0&h=d4AbNzh6ztl2XV-oUo36FitS45O1AUraO2wJhOP5Roo=',
                    onpressed: () => context.push('/content_patient'),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class Options extends StatelessWidget {
  const Options({
    Key? key,
    required this.networkImage,
    required this.title,
    required this.description,
    required this.onpressed,
  }) : super(key: key);

  final String networkImage;
  final String title;
  final String description;
  final void Function() onpressed;

  @override
  Widget build(BuildContext context) {
    final word = TranslationRepo.translate(context);

    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(30.0),
          child: CachedNetworkImage(
              imageUrl: networkImage,
              fit: BoxFit.cover,
              width: double.infinity,
              height: rh.devicePortrait(context)
                  ? rh.deviceHeight(context) * 0.15
                  : rh.deviceHeight(context) * 0.35,
              errorWidget: (context, url, error) => const Icon(Icons.error),
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Loading()),
        ),
        const SizedBox(height: 20),
        Text(
          title,
          style: TextStyle(fontSize: 20.0),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: Text(description,
              textAlign: TextAlign.center, style: TextStyle(fontSize: 15.0)),
        ),
        const SizedBox(
          height: 10,
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
                          color: textColor ?? theme.onPrimaryContainer),
                    ),
            ),
          );
        }(
            onPressed: onpressed,
            isLoading: false,
            text: word?.choose ?? "Choose",
            context: context)
      ],
    );
  }
}
