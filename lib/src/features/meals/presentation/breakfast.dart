// ignore_for_file: prefer_typing_uninitialized_variables, type_annotate_public_apis

import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constants/constants.dart';
import '../../../translations/domain/translation_provider.dart';

class BreakFast extends StatelessWidget {
  const BreakFast({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final word = TranslationRepo.translate(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(word?.breakfast ?? ''),
        centerTitle: true,
        elevation: 1.2,
        // ignore: use_full_hex_values_for_flutter_colors
      ),
      body: OrientationBuilder(
        builder: (context, orientation) => RawScrollbar(
          thumbColor: colorScheme(context).tertiary,
          thickness: 5,
          radius: const Radius.circular(10),
          child: GridView.count(
            crossAxisCount: rh.responsiveMeals(context),
            childAspectRatio: 0.6,
            physics: const BouncingScrollPhysics(),
            children: [
              Category(
                url: 'https://www.youtube.com/watch?v=618QsMaVXp8',
                image:
                    'https://images.unsplash.com/photo-1648326311535-21895c185fbb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
                name: word?.shakshuka,
              ),
              Category(
                url: 'https://www.youtube.com/watch?v=bXntiogB8rA',
                image:
                    'https://scrummylane.com/wp-content/uploads/2019/06/crustless-quiche-8.jpg',
                name: word?.crustless_Quiche,
              ),
              Category(
                url: 'https://www.youtube.com/watch?v=n76noIAaAuY',
                image:
                    'https://frescadostortillas.com/wp-content/uploads/2020/11/Slow-Cooker-Chipotle-Chicken-Burrito-010.jpg',
                name: word?.burrito,
              ),
              Category(
                url: 'https://www.youtube.com/watch?v=4STUMnTxcsA',
                image:
                    'https://sallysbakingaddiction.com/wp-content/uploads/2019/01/baked-oatmeal-5.jpg',
                name: word?.baked_Oatmeal,
              ),
              Category(
                url: 'https://www.youtube.com/watch?v=Sncq3NLw_PY',
                image:
                    'https://joyfoodsunshine.com/wp-content/uploads/2019/09/easy-cinnamon-apples-recipe-2.jpg',
                name: word?.apple_Cinnamon_Oat,
              ),
              Category(
                url: 'https://www.youtube.com/watch?v=0W9lXaHcXL4',
                image:
                    'https://ichef.bbci.co.uk/food/ic/food_16x9_832/recipes/bananabread_85720_16x9.jpg',
                name: word?.banana_Bread,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Category extends StatelessWidget {
  const Category({
    Key? key,
    required this.image,
    required this.name,
    required this.url,
  }) : super(key: key);

  final image;
  final name;
  final url;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () async {
          if (Platform.isAndroid || Platform.isIOS) {
            context.go("/recipe_video", extra: url);
          } else {
            if (!await launchUrl(Uri.parse(url))) {
              throw 'Could not launch $url';
            }
          }
        },
        child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: 10.0,
          child: Column(
            children: [
              CachedNetworkImage(
                height: 210.0,
                width: 400.0,
                fit: BoxFit.cover,
                imageUrl: image,
              ),
              const SizedBox(height: 10.0),
              FittedBox(
                child: Text(
                  name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17.0,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
