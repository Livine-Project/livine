// import 'dart:developer';
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:image_cropper/image_cropper.dart';
// import 'package:image_picker/image_picker.dart';

// import '../../../../constants/constants.dart';

// class ImageController {
//   final ImagePicker _picker = ImagePicker();
//   File? image;
//   bool isModelFromGallery = false;

//   Future pickImageFromGallery(
//     void Function(void Function()) setState,
//     bool mounted,
//     BuildContext context,
//   ) async {
//     final theme = Theme.of(context).colorScheme;
//     try {
//       final image = await _picker.pickImage(source: ImageSource.gallery);

//       if (image == null) return;

//       CroppedFile? cropped = await ImageCropper().cropImage(
//         sourcePath: image.path,
//         uiSettings: [
//           AndroidUiSettings(
//               toolbarTitle: 'Crop the food',
//               toolbarColor: theme.surface,
//               initAspectRatio: CropAspectRatioPreset.original,
//               lockAspectRatio: false),
//         ],
//         aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
//       );

//       final imageTemp = File(cropped!.path);

//       setState(() {
//         this.image = imageTemp;
//         isModelFromGallery = true;
//       });
//     } on PlatformException catch (e) {
//       log("Failed to pick image: $e");
//     } finally {
//       modelTF.runModelonGallery(image, mounted, setState);
//     }
//   }

//   Future pickImageFromCamera(
//     void Function(void Function()) setState,
//     bool mounted,
//     BuildContext context,
//   ) async {
//     try {
//       final image = await _picker.pickImage(source: ImageSource.camera);

//       if (image == null) return;



//       final imageTemp = File(image.path);

//       setState(() {
//         this.image = imageTemp;
//         isModelFromGallery = true;
//       });
//     } on PlatformException catch (e) {
//       log("Failed to pick image: $e");
//     } finally {
//       modelTF.runModelonGallery(image, mounted, setState);
//     }
//   }

  
// }
