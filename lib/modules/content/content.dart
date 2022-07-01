import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/user/user.dart';

import '../../translations/locale_keys.g.dart';

class ChooseContent extends StatefulWidget {
  const ChooseContent({Key? key}) : super(key: key);

  @override
  State<ChooseContent> createState() => _ChooseContentState();
}

class _ChooseContentState extends State<ChooseContent> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Consumer(
              builder: (context, ref, child) {
                return Column(
                  children: [
                    Options(
                      theme: theme,
                      title: LocaleKeys.General.tr(),
                      description: LocaleKeys.healthy.tr(),
                      networkImage:
                          'https://media.istockphoto.com/photos/healthy-lifestyle-concept-clean-food-good-health-dietary-in-heart-picture-id953674568?k=20&m=953674568&s=612x612&w=0&h=x_gq29MRpRyhdDIgwF5PVhdXAbINmaBUKMgs27w7i6s=',
                      onpressed: () async {
                        final SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        prefs.setString("UserType", "General");
                        ref.watch(userTypeProvider.notifier).state = "General";

                        context.go('/navigate');
                      },
                    ),
                    Options(
                      theme: theme,
                      title: LocaleKeys.per_situation.tr(),
                      description: LocaleKeys.patient.tr(),
                      networkImage:
                          'https://media.istockphoto.com/photos/its-the-season-of-sneezes-picture-id1085020818?b=1&k=20&m=1085020818&s=170667a&w=0&h=d4AbNzh6ztl2XV-oUo36FitS45O1AUraO2wJhOP5Roo=',
                      onpressed: () => context.push('/content_patient'),
                    ),
                  ],
                );
              },
            ),
          ),
          IconButton(
              padding: EdgeInsets.only(top: 30),
              onPressed: () => context.pop(),
              icon: Icon(Icons.arrow_back))
        ],
      ),
    );
  }
}

class Options extends StatelessWidget {
  const Options({
    Key? key,
    required this.theme,
    required this.networkImage,
    required this.title,
    required this.description,
    required this.onpressed,
  }) : super(key: key);

  final ColorScheme theme;
  final String networkImage;
  final String title;
  final String description;
  final void Function() onpressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CachedNetworkImage(
            imageUrl: networkImage,
            fit: BoxFit.cover,
            width: double.infinity,
            height: 250,
            errorWidget: (context, url, error) => Icon(Icons.error),
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                CircularProgressIndicator(
                  value: downloadProgress.progress,
                )),
        SizedBox(height: 20),
        Text(
          title,
          style: TextStyle(fontFamily: 'Kine', fontSize: 20.0),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: Text(description,
              textAlign: TextAlign.center,
              style: TextStyle(fontFamily: 'Kine', fontSize: 15.0)),
        ),
        GestureDetector(
          onTap: onpressed,
          child: Container(
            width: 150,
            height: 50,
            decoration: BoxDecoration(
                color: theme.primaryContainer,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Icon(
              Icons.navigate_next_sharp,
            ),
          ),
        ),
        Divider(),
      ],
    );
  }
}
