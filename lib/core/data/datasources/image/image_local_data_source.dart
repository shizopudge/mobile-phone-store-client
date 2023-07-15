import 'dart:io';

import 'package:image_picker/image_picker.dart';

import '../../../failure/failure.dart';

abstract interface class ImageLocalDataSource {
  Future<File?> pickImage();
  Future<List<File>> pickImages();
}

class ImageLocalDataSourceImpl implements ImageLocalDataSource {
  @override
  Future<File?> pickImage() async {
    try {
      final XFile? pickedFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedFile != null) return File(pickedFile.path);
      return null;
    } on Exception catch (e) {
      throw CacheFailure(message: e.toString());
    }
  }

  @override
  Future<List<File>> pickImages() async {
    try {
      final List<XFile> pickedFiles = await ImagePicker().pickMultiImage();
      final List<File> files = [];
      for (XFile file in pickedFiles) {
        files.add(File(file.path));
      }
      return files;
    } on Exception catch (e) {
      throw CacheFailure(message: e.toString());
    }
  }
}
