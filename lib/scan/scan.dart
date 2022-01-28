// import 'package:app/main.dart';
// import 'package:app/scan/cameraView.dart';
// import 'package:app/scan/objectPainter.dart';
// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
// import 'package:google_ml_kit/google_ml_kit.dart';

// class ScanObject extends StatefulWidget {
//   const ScanObject({Key? key}) : super(key: key);
//   @override
//   _ScanObjectState createState() => _ScanObjectState();
// }

// class _ScanObjectState extends State<ScanObject> {

  
//   CameraController? controller;
//   LocalModel model = LocalModel("object_labeler.tflite");
//   ObjectDetector? objectDetector;

//   @override
//   void initState() {
//     super.initState();
//     // controller = CameraController(cameras![0], ResolutionPreset.max);
//     controller!.initialize().then((_) {
//     if (!mounted) {
//       return;
//     }
//     objectDetector = GoogleMlKit.vision.objectDetector(
//     CustomObjectDetectorOptions(model,
//       trackMutipleObjects: true, classifyObjects: true));

//   });

//   }
//   bool isBusy = false;
//   CustomPaint? customPaint;

//   @override
//   void dispose() {
//     controller?.dispose();
//     objectDetector!.close();
//     super.dispose();
//   }
//   @override
  
//   Widget build(BuildContext context) {
//     return CameraView(
//       title: 'Object Detector',
//       customPaint: customPaint,
//       onImage: (inputImage) {
//         processImage(inputImage);
//       },
//       initialDirection: CameraLensDirection.back,
//     );
//   }

//   Future<void> processImage(InputImage inputImage) async {
//     if (isBusy) return;
//     isBusy = true;
//     final result = await objectDetector!.processImage(inputImage);
//     print(result);
//     if (inputImage.inputImageData?.size != null &&
//         inputImage.inputImageData?.imageRotation != null &&
//         result.length > 0) {
//       final painter = ObjectDetectorPainter(
//           result,
//           inputImage.inputImageData!.imageRotation,
//           inputImage.inputImageData!.size);
//       customPaint = CustomPaint(painter: painter);
//     } else {
//       customPaint = null;
//     }
//     isBusy = false;
//     if (mounted) {
//       setState(() {});
//     }
//   }
// }
