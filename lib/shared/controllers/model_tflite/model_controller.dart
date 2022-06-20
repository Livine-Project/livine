import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';

import '../../constants/constants.dart';

class ModelTFLite {
  String output = '';
  int index = 1;
  double confidence = 0;
  bool isModelFromGallery = false;

  bool isVisible = false;

  Future<void> loadmodel() async {
    await Tflite.loadModel(
        model: "assets/model/model.tflite", labels: "assets/model/labels.txt");
  }

  Future runModelonGallery(File? image, bool mounted,
      void Function(void Function()) setState) async {
    if (image != null && mounted) {
      var predictions = await Tflite.runModelOnImage(path: image.path);
      var firstPredictions = predictions?.first;
      var lastPredictions = predictions?.last;

      setState(() {
        isModelFromGallery = true;
      });
      if (firstPredictions.values.first > lastPredictions.values.first) {
        setState(() {
          confidence = firstPredictions.values.first;
          output = firstPredictions!['label'];
          index = firstPredictions!['index'];
        });
      } else {
        setState(() {
          confidence = lastPredictions.values.first;
          output = lastPredictions!['label'];
          index = lastPredictions!['index'];
        });
      }
    }
  }

  String checkHealth(void Function(void Function()) setState,AnimationController controller) {
    print("index" + index.toString());
    if (index == 0 && output.isNotEmpty) {
      setState(() {
        isVisible = true;
      });
      controller.forward();
      return "Healthy";
    } else if (index == 1 && output.isNotEmpty) {
      controller.reverse();
      setState(() {
        isVisible = true;
      });
      return "Unhealthy";
    } else {
      setState(() {
        isVisible = false;
      });
      return '';
    }
  }

  Future<void> runModelFrame(CameraImage? cameraImage, bool mounted,
      void Function(void Function()) setState) async {
    if (cameraImage != null && mounted && imageController.image== null) {
      setState(() {
        isModelFromGallery = false;
      });
      if (mounted) {
         var predictions = await Tflite.runModelOnFrame(
        bytesList: cameraImage.planes.map((plane) {
          return plane.bytes;
        }).toList(),
        imageHeight: cameraImage.height,
        imageWidth: cameraImage.width,
        numResults: 2,
        
      );
      var firstPredictions = predictions?.first;
      var lastPredictions = predictions?.last;

      if (firstPredictions.values.first > lastPredictions.values.first) {
        if (mounted) {
          setState(() {
            confidence = firstPredictions.values.first;
            output = firstPredictions!['label'];
            index = firstPredictions!['index'];
          });
        }
      } else {
        setState(() {
          if (mounted) {
            confidence = lastPredictions.values.first;
            output = lastPredictions!['label'];
            index = lastPredictions!['index'];
          }
        });
      }
      }
     
      
    }
  }
    Future<dynamic> release() => Tflite.close();

}
