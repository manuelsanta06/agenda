import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';


Future<String?> saveImageLocally(XFile? imageFile) async {
  if (imageFile == null) return null;

  try{
    final String newPath = p.join((await getApplicationDocumentsDirectory()).path, p.basename(imageFile.path));
    await File(imageFile.path).copy(newPath);
    
    return newPath;
  }catch (e) {
    print("Error guardando imagen: $e");
    return null;
  }
}

Future<XFile?> cropImage(XFile imageFile,List<CropAspectRatioPresetData> cropTypes) async {
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
  return croppedFile != null ? XFile(croppedFile.path) : null;
}

Future<XFile?> pickImage(BuildContext context,List<CropAspectRatioPresetData> cropTypes) async {
  final picker = ImagePicker();

  return showModalBottomSheet<XFile?>(
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

Future<XFile?> _pickFromSource(ImagePicker picker,ImageSource source,List<CropAspectRatioPresetData> cropTypes)async{
  final XFile? image = await picker.pickImage(source: source);
  if(image==null)return null;
  XFile? puta=await cropImage(image,cropTypes);
  if(puta==null)return null;
    return puta;
}
