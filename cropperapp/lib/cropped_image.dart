import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CroppedImage extends StatefulWidget {
  const CroppedImage({super.key, required image});

  get image => null;

  @override
  State<CroppedImage> createState() => _CroppedImageState();
}

class _CroppedImageState extends State<CroppedImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(5),
          child: InteractiveViewer(
              child: Image(
                  image: FileImage(widget.image.path))),
        ),
        ),
    );
  }
}
