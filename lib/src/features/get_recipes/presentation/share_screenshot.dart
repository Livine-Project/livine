import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

import '../../../translations/domain/translation_provider.dart';

class ShareRecipe extends StatefulWidget {
  const ShareRecipe({super.key, required this.data});
  final data;

  @override
  State<ShareRecipe> createState() => _ShareRecipeState();
}

class _ShareRecipeState extends State<ShareRecipe> {
  ScreenshotController screenShotController = ScreenshotController();

  saveScreenShot() {
    screenShotController
        .capture(delay: Duration(milliseconds: 10))
        .then((image) async {
      if (image != null) {
        final directory = await getApplicationDocumentsDirectory();
        final imagePath = await File('${directory.path}/image.png').create();
        await imagePath.writeAsBytes(image);

        /// Share Plugin
        await Share.shareXFiles([XFile(imagePath.path)])
            .then((value) => context.pop());
      }
    });
  }

  @override
  void initState() {
    super.initState();
    saveScreenShot();
  }

  @override
  Widget build(BuildContext context) {
    final word = TranslationRepo.translate(context);
    return Screenshot(
      controller: screenShotController,
      
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 270,
                  height: 300,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: CachedNetworkImage(
                            imageUrl: widget.data['image'],
                            fit: BoxFit.cover,
                            width: 270,
                            height: 200,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.data['name'],
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontFamily: 'Kine'),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RecipeTag(
                              text:
                                  "${widget.data["calories"]} ${word!.calories}",
                            ),
                            RecipeTag(
                              text: "${widget.data["difficulty"]}",
                            ),
                            RecipeTag(
                                text: "${widget.data["time"]} ${word.minute}"),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 70),
                child: Text(
                  word.livine,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onSecondary),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RecipeTag extends StatelessWidget {
  const RecipeTag({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.secondary,
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
        ),
      ),
    );
  }
}
