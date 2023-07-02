import 'dart:io';

import '../../../constants/type_defs.dart';

abstract interface class ImageRepository {
  FutureEither<File?> pickImage();
}
