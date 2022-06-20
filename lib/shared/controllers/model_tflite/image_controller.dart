import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../../../main.dart';
import '../../constants/constants.dart';

class ImageController {
  final ImagePicker _picker = ImagePicker();
  File? image;
  bool isModelFromGallery = false;
  CameraImage? cameraImage;
  CameraController? cameraController;

  Future pickImageFromGallery(
    void Function(void Function()) setState,
    bool mounted,
    BuildContext context,
  ) async {
    final theme = Theme.of(context).colorScheme;
    try {
      final image = await _picker.pickImage(source: ImageSource.gallery);

      if (image == null) return;

      CroppedFile? cropped = await ImageCropper().cropImage(
        sourcePath: image.path,
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Crop the food',
              toolbarColor: theme.surface,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
        ],
        aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
      );

      final imageTemp = File(cropped!.path);

      setState(() {
        this.image = imageTemp;
        isModelFromGallery = true;
      });
    } on PlatformException catch (e) {
      print("Failed to pick image: $e");
    } finally {
      modelTF.runModelonGallery(image, mounted, setState);
    }
  }

  void loadCamera(
    bool mounted,
    void Function(void Function()) setState,
  ) async {
    cameraController = CameraController(cameras![0], ResolutionPreset.max);
    await cameraController!.initialize().then((value) {
      if (!mounted) {
        return;
      } else {
        setState(() {
          cameraController!.startImageStream((imageStream) {
            cameraImage = imageStream;

            if (mounted) {
              modelTF.runModelFrame(cameraImage, mounted, setState);
            }
          });
        });
      }
    });
  }
}
