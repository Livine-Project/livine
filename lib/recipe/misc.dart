// ignore_for_file: use_full_hex_values_for_flutter_colors, avoid_print, type_annotate_public_apis

import 'package:easy_localization/easy_localization.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import 'package:url_launcher/url_launcher.dart';

import '../Others/colors.dart';
import '../Others/loading.dart';
import '../translations/locale_keys.g.dart';
import 'recipe.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailsBody extends StatefulWidget {
  const DetailsBody({Key? key, required this.id}) : super(key: key);
  final id;

  @override
  State<DetailsBody> createState() => _DetailsBodyState();
}

class _DetailsBodyState extends State<DetailsBody> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Consumer(
        builder: (context, ref, child) {
          final recipesData = ref.watch(recipesProviderID(widget.id));
          return recipesData.when(
            data: (data) {
              _launchURL() async {
                var url = context.locale.languageCode == "en"
                    ? data.video
                    : data.video_in_arabic;
                try {
                  await launch(url);
                } catch (e) {
                  print(e);
                }
              }

              return Column(
                children: [
                  ImageAndIcons(size: size, id: widget.id),
                  FoodTitle(
                    name: context.locale.languageCode == "en"
                        ? data.name
                        : data.name_in_arabic,
                    type: context.locale.languageCode == "en"
                        ? data.type
                        : data.type_in_arabic,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: size.width / 2,
                        height: 84,
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor:
                                Theme.of(context).brightness == Brightness.dark
                                    ? MaterialStateProperty.all<Color>(
                                        Colors.blueGrey)
                                    : MaterialStateProperty.all<Color>(
                                        thirdColor,
                                      ),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft:
                                            context
                                                        .locale.languageCode ==
                                                    "en"
                                                ? Radius.zero
                                                : Radius.circular(30.0),
                                        topRight:
                                            context.locale.languageCode == "en"
                                                ? Radius.circular(30.0)
                                                : Radius.zero))),
                          ),
                          onPressed: _launchURL,
                          child: Text(
                            LocaleKeys.Video.tr(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'Kine'),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: size.width / 2,
                        height: 84,
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor: Theme.of(context).brightness ==
                                    Brightness.dark
                                ? MaterialStateProperty.all<Color>(Colors.grey)
                                : MaterialStateProperty.all<Color>(
                                    secondaryColor,
                                  ),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft:
                                            context
                                                        .locale.languageCode ==
                                                    "en"
                                                ? Radius.circular(30.0)
                                                : Radius.zero,
                                        topRight:
                                            context.locale.languageCode == "en"
                                                ? Radius.zero
                                                : Radius.circular(30.0)))),
                          ),
                          onPressed: () => context.push('/ingridents',
                              extra: context.locale.languageCode == "en"
                                  ? data.ingridents
                                  : data.ingridents_in_arabic),
                          child: Text(
                            LocaleKeys.Ingridents.tr(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'Kine'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
            error: (e, s) => Loading(),
            loading: () => Loading(),
          );
        },
      ),
    );
  }
}

class FoodTitle extends StatelessWidget {
  const FoodTitle({
    Key? key,
    this.name,
    this.type,
  }) : super(key: key);
  final String? name;
  final String? type;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: RichText(
              text: TextSpan(
                children: <InlineSpan>[
                  WidgetSpan(
                      child: Container(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      name!,
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.grey[400]
                              : secondaryColor,
                          fontFamily: 'Kine'),
                    ),
                  )),
                  WidgetSpan(
                      child: Container(
                          padding: EdgeInsets.only(bottom: 12.0),
                          child: Text(
                            type!,
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Colors.white
                                    : thirdColor,
                                fontSize: 20,
                                fontFamily: 'kine'),
                          ))),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ImageAndIcons extends StatelessWidget {
  const ImageAndIcons({
    Key? key,
    required this.size,
    required this.id,
  }) : super(key: key);

  final Size size;
  final id;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.8,
            child: Consumer(
              builder: (context, ref, child) {
                final recipesData = ref.watch(recipesProviderID(id));
                return recipesData.when(
                  data: (data) {
                    return Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: IconButton(
                                  padding: EdgeInsets.only(
                                    top: size.height * 0.1,
                                    left: 10.0,
                                  ),
                                  icon: Icon(
                                    context.locale.languageCode == "en"
                                        ? FontAwesomeIcons.arrowLeft
                                        : FontAwesomeIcons.arrowRight,
                                    color: thirdColor,
                                  ),
                                  onPressed: () => context.pop(),
                                ),
                              ),
                              Spacer(),
                              IconCard(
                                image: 'assets/images/recipes/calories.jpg',
                              ),
                              Text("1789"),
                              IconCard(
                                image: 'assets/images/recipes/ingredients.png',
                              ),
                              IconCard(
                                image: 'assets/images/recipes/ingredients.png',
                              ),
                              IconCard(
                                image: 'assets/images/recipes/ingredients.png',
                              ),
                            ],
                          ),
                        ),
                        Transform.rotate(
                          angle: context.locale.languageCode == "en" ? 0 : 59.7,
                          child: Container(
                            height: size.height * 0.8,
                            width: size.width * 0.75,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(63),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 10),
                                  blurRadius: 100,
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.blueGrey[600]!.withOpacity(0.29)
                                      : secondaryColor.withOpacity(0.6),
                                )
                              ],
                              image: DecorationImage(
                                alignment: Alignment.centerLeft,
                                fit: BoxFit.cover,
                                image: CachedNetworkImageProvider(
                                  'https://livine.pythonanywhere.com/${data.imageURL}',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                  loading: () => Loading(),
                  error: (e, s) {
                    print('$e\n$s');
                    return Text(e.toString());
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class IconCard extends StatelessWidget {
  const IconCard({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.03),
      padding: EdgeInsets.all(8),
      height: 52,
      width: 52,
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.grey[600]
            : primaryColor,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 10),
            blurRadius: 22,
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.grey[400]!.withOpacity(0.22)
                : Colors.blueAccent[700]!.withOpacity(0.22),
          ),
          BoxShadow(
            offset: Offset(-15, -15),
            blurRadius: 20,
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.transparent
                : Colors.white,
          ),
        ],
      ),
      child: Image.asset(
        image,
        color: Color.fromARGB(255, 0, 0, 0),
      ),
    );
  }
}
