import '../../../../core/constants/type_defs.dart';
import '../../../auth/domain/entities/current_user.dart';

abstract interface class ProfileEditRepository {
  FutureEither<CurrentUser> editProfile({
    required String email,
    required String username,
    required String password,
    required String? newPassword,
  });
}
