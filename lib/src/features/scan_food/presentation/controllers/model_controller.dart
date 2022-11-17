import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';


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

  String checkHealth(
      void Function(void Function()) setState, AnimationController controller) {
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
      return 'Choose';
    }
  }



}
