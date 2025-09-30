import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cropperapp/cropped_image.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  File? _image; // Cropladığımız resmi saklayacak

  void pickImage(bool fromCamera) async {
    final picker = ImagePicker();
    XFile? pickedFile;

    if (fromCamera) {
      pickedFile = await picker.pickImage(source: ImageSource.camera);
    } else {
      pickedFile = await picker.pickImage(source: ImageSource.gallery);
    }

    if (pickedFile != null) {
      // Crop işlemi
      CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: pickedFile.path,
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: "Kırp",
            toolbarColor: Colors.blue,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false,
          ),
          IOSUiSettings(title: "Kırp"),
        ],
      );

      if (croppedFile != null) {
        setState(() {
          _image = File(croppedFile.path); // Görseli güncelle
        });

        // Eğer ayrı sayfada göstermek isterseniz
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => CroppedImage(image: croppedFile),
        //   ),
        // );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Material App Bar')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _image != null
                ? Image.file(_image!, width: 300)
                : Text("Henüz resim yok"),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => pickImage(true),
              child: Text("Kamera"),
            ),
            ElevatedButton(
              onPressed: () => pickImage(false),
              child: Text("Galeriden Seç"),
            ),
          ],
        ),
      ),
    );
  }
}
