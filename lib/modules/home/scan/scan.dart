import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tflite/tflite.dart';
// import 'package:tflite/tflite.dart';

import '../../../main.dart';

class Scan extends StatefulWidget {
  const Scan({Key? key}) : super(key: key);

  @override
  State<Scan> createState() => _ScanState();
}

class _ScanState extends State<Scan> with TickerProviderStateMixin {
  CameraImage? cameraImage;
  CameraController? cameraController;
  String output = '';

  void loadCamera() {
    cameraController = CameraController(cameras![0], ResolutionPreset.high);
    cameraController!.initialize().then((value) {
      if (!mounted) {
        return;
      } else {
        setState(() {
          cameraController!.startImageStream((imageStream) {
            cameraImage = imageStream;
            runModel();
          });
        });
      }
    });
  }

  Future<void> runModel() async {
    if (cameraImage != null && mounted) {
      var predictions = await Tflite.runModelOnFrame(
        bytesList: cameraImage!.planes.map((plane) {
          return plane.bytes;
        }).toList(),
        imageHeight: cameraImage!.height,
        imageWidth: cameraImage!.width,
        numResults: 2,
      );
      predictions!.forEach((element) {
        if (mounted) {
          setState(() {
            output = element['label'].replaceAll(new RegExp(r"\d"), "");
          });
        } else {
          return;
        }
      });
    }
  }

  Future<void> loadmodel() async {
    await Tflite.loadModel(
        model: "assets/model/model.tflite", labels: "assets/model/labels.txt");
  }

  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    loadCamera();
    loadmodel();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
  }

  @override
  void dispose() async {
    cameraController?.dispose();
    _controller.dispose();
    super.dispose();
  }

  String checkHealth() {
    if (output.contains("Healthy")) {
      _controller.forward();
      return "Heathy";
    } else {
      _controller.reverse();
      return "Unhealthy";
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: Text('Scan Food')),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Container(
              height: 350,
              width: 300,
              decoration: BoxDecoration(
                  border: Border.all(color: theme.primary, width: 5)),
              child: !cameraController!.value.isInitialized
                  ? Container()
                  : AspectRatio(
                      aspectRatio: cameraController!.value.aspectRatio,
                      child: CameraPreview(cameraController!),
                    ),
            ),
          ),
          Text(
            checkHealth(),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Lottie.asset("assets/images/loading/emoji_anim.json",
              controller: _controller, width: 250),
        ]),
      ),
    );
  }
}
