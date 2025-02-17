import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({super.key});

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  File? _imageFile;
  // pick image ...
  Future pickImage() async {
    // picker
    final ImagePicker picker = ImagePicker();

    // pick from gallery
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    // update image preview
    if (image != null) {
      setState(() {
        _imageFile = File(image.path);
      });
    }
  }

  // upload

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upload page"),
      ),
      body: Center(
        child: Column(
          children: [
            _imageFile != null
                ? Image.file(_imageFile!)
                : const Text("No image selected.."),

            // pick image button
            ElevatedButton(
                onPressed: pickImage, child: const Text("pick image"))
          ],
        ),
      ),
    );
  }
}
