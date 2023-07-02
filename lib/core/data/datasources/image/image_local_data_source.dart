import 'dart:io';

import 'package:image_picker/image_picker.dart';

import '../../../failure/failure.dart';

abstract interface class ImageLocalDataSource {
  Future<File?> pickImage();
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
}
