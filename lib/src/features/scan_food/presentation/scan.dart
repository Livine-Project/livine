import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

class ScanDesktop extends HookWidget {
  const ScanDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final chosenFile = useState<File?>(null);
    return Scaffold(
        body: Column(
      children: [
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Image"),
              SizedBox(width: 300),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () async {
                    FilePickerResult? result = await FilePicker.platform
                        .pickFiles(
                            allowMultiple: false,
                            allowedExtensions: ['jpg', 'png', 'jpeg']);
                    if (result != null) {
                      File file = File(result.files.single.path!);
                      chosenFile.value = file;
                    } else {
                      context.pop();
                    }
                  },
                  child: CircleAvatar(
                    radius: 200,
                    child: chosenFile.value?.path.isNotEmpty == true
                        ? null
                        : Text("Select Image"),
                    backgroundImage: chosenFile.value?.path.isNotEmpty == true
                        ? FileImage(chosenFile.value!.absolute)
                        : null,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    ));
  }
}
