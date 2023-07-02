import '../../../../core/constants/type_defs.dart';
import '../../../../core/domain/usecases/usecase.dart';
import '../repositories/login_repository.dart';

class LoginAsGuest implements UseCase<void, NoParams> {
  final LoginRepository repository;

  const LoginAsGuest(this.repository);
  @override
  FutureEither<void> call(NoParams params) async =>
      await repository.loginAsGuest();
}
