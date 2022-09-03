import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/constants.dart';

class RecipeCardNormal extends StatefulWidget {
  const RecipeCardNormal({
    Key? key,
    required this.id,
    required this.name,
    required this.foodImage,
    required this.type,
    required this.time,
    required this.difficulty,
    required this.dImage,
  }) : super(key: key);

  final int id;
  final String name;
  final String foodImage;
  final String type;
  final String time;
  final String difficulty;
  final String dImage;

  @override
  State<RecipeCardNormal> createState() => _RecipeCardNormalState();
}

class _RecipeCardNormalState extends State<RecipeCardNormal> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(10.0),
                                bottom: Radius.circular(10.0)),
                            child: CachedNetworkImage(
                              imageUrl: widget.foodImage,
                              height: 140,
                              width: rh.deviceWidth(context) / 2,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ]),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                        child: Container(
                          width: 140.0,
                          height: 60.0,
                          decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer
                                  .withOpacity(0.3)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Center(
                                  child: Text(
                                    widget.name,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.0,
                                        fontFamily:
                                            context.locale.languageCode == "en"
                                                ? 'Kine'
                                                : GoogleFonts.notoKufiArabic()
                                                    .fontFamily,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimaryContainer),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      widget.time.toUpperCase(),
                                      style: TextStyle(
                                          fontSize: 12.0,
                                          fontFamily:
                                              context.locale.languageCode ==
                                                      "en"
                                                  ? 'Kine'
                                                  : GoogleFonts.notoKufiArabic()
                                                      .fontFamily,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimaryContainer),
                                    ),
                                    const SizedBox(
                                      width: 5.0,
                                    ),
                                    Text(
                                      "|",
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .tertiary),
                                    ),
                                    const SizedBox(
                                      width: 5.0,
                                    ),
                                    Text(
                                      widget.difficulty.toUpperCase(),
                                      style: TextStyle(
                                          fontSize: 12.0,
                                          fontFamily:
                                              context.locale.languageCode ==
                                                      "en"
                                                  ? 'Kine'
                                                  : GoogleFonts.notoKufiArabic()
                                                      .fontFamily,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimaryContainer),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ],
    );
  }
}
