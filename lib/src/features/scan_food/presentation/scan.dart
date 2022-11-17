import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
// import 'package:tflite/tflite.dart';

import '../../../constants/constants.dart';

class Scan extends StatefulWidget {
  const Scan({Key? key}) : super(key: key);

  @override
  State<Scan> createState() => _ScanState();
}

class _ScanState extends State<Scan> with TickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();

    modelTF.loadmodel();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
  }

  @override
  void dispose() async {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Scan Food'), centerTitle: true),
      body: Column(children: [
        Expanded(
          child: imageController.image != null
              ? Image.file(
                  imageController.image!,
                  width: 200,
                  height: 200,
                  errorBuilder: (context, error, stackTrace) {
                    return Center(
                      child: Text(
                        'Error: $error',
                      ),
                    );
                  },
                )
              : Container(),
        ),
        const SizedBox(
          height: 20,
        ),
        Column(
          children: [
            Text(
              modelTF.checkHealth(setState, controller),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    imageController.pickImageFromCamera(
                        setState, mounted, context);
                  },
                  child: Row(
                    children: const [
                      Icon(Icons.camera_alt),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Use Camera'),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          theme.tertiaryContainer)),
                  onPressed: () {
                    imageController.pickImageFromGallery(
                        setState, mounted, context);
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.photo_library,
                        color: theme.onTertiaryContainer,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Use Gallery',
                        style: TextStyle(color: theme.onTertiaryContainer),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Lottie.asset("assets/images/loading/emoji_anim.json",
                controller: controller, width: 200),
          ],
        ),
      ]),
    );
  }
}
