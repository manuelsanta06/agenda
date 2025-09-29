import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'dart:io';

Future<File?> cropImage(XFile imageFile,List<CropAspectRatioPresetData> cropTypes) async {
  final croppedFile = await ImageCropper().cropImage(
    sourcePath: imageFile.path,
    uiSettings: [
      AndroidUiSettings(
        toolbarTitle: 'Recortar Imagen',
        toolbarColor: Colors.deepPurple,
        toolbarWidgetColor: Colors.white,
        initAspectRatio: CropAspectRatioPreset.square,
        lockAspectRatio: true,
        aspectRatioPresets: cropTypes,
      ),
      IOSUiSettings(
        title: 'Recortar Imagen',
        aspectRatioPresets: cropTypes,
      ),
    ],
  );
  return croppedFile != null ? File(croppedFile.path) : null;
}

Future<Image?> pickImage(BuildContext context,List<CropAspectRatioPresetData> cropTypes) async {
  final picker = ImagePicker();

  return showModalBottomSheet<Image?>(
    context: context,
    builder: (BuildContext context) {
      return SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text("Galería"),
              onTap: () async {
                Navigator.of(context).pop(
                  await _pickFromSource(picker, ImageSource.gallery,cropTypes)
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text("Cámara"),
              onTap: () async {
                Navigator.of(context).pop(
                  await _pickFromSource(picker, ImageSource.camera,cropTypes),
                );
              },
            ),
          ],
        ),
      );
    },
  );
}

Future<Image?> _pickFromSource(ImagePicker picker,ImageSource source,List<CropAspectRatioPresetData> cropTypes)async{
  final XFile? image = await picker.pickImage(source: source);
  if(image==null)return null;
  File? puta=await cropImage(image,cropTypes);
  if(puta==null)return null;
    return Image.file(
        File(puta.path)
    );
}
