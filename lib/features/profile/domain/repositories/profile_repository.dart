import 'dart:io';

import '../../../../core/constants/type_defs.dart';
import '../../../../core/domain/entities/current_user.dart';

abstract interface class ProfileRepository {
  FutureEither<CurrentUser> editProfile({
    required String email,
    required String username,
    required String password,
    required String? newPassword,
  });

  FutureEither<String> uploadImage(File image);

  FutureEither<void> deleteImage();
}
