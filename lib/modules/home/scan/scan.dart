import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
// import 'package:tflite/tflite.dart';

import '../../../shared/constants/constants.dart';

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
    imageController.loadCamera(mounted, setState);

    modelTF.loadmodel();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
  }

  @override
  void dispose() async {
    imageController.cameraController?.dispose();
    controller.dispose();
    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: Text('Scan Food | Beta '), centerTitle: true),
      body: Column(children: [
        Expanded(
          child: imageController.image != null
              ? Image.file(
                  imageController.image!,
                )
              : Container(),
        ),
        Visibility(
          visible: imageController.image == null,
          child: Container(
            height: 350,
            width: 300,
            decoration: BoxDecoration(
                border: Border.all(color: theme.primary, width: 5)),
            child: !imageController.cameraController!.value.isInitialized
                ? Container()
                : AspectRatio(
                    aspectRatio:
                        imageController.cameraController!.value.aspectRatio,
                    child: CameraPreview(imageController.cameraController!),
                  ),
          ),
        ),
        Column(
          children: [
            Center(
              child: ElevatedButton(
                  onPressed: () => imageController.pickImageFromGallery(
                      setState, mounted, context),
                  child: Text("Use Image from gallery")),
            ),
            Text(
              modelTF.checkHealth(setState, controller),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Visibility(
              visible: modelTF.isVisible,
              child: Lottie.asset("assets/images/loading/emoji_anim.json",
                  controller: controller, width: 200),
            ),
          ],
        ),
      ]),
    );
  }
}
