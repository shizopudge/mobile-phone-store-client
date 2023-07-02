import '../../../../core/constants/type_defs.dart';
import '../../../../core/domain/entities/current_user.dart';

abstract interface class LoginRepository {
  FutureEither<CurrentUser> login({
    required String email,
    required String password,
  });
  FutureEither<void> loginAsGuest();
  FutureEither<CurrentUser> register({
    required String email,
    required String username,
    required String password,
  });
}
