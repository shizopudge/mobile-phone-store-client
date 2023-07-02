import '../../../constants/type_defs.dart';
import '../../repositories/auth/auth_repository.dart';
import '../usecase.dart';

class RefreshTokens implements UseCase<void, NoParams> {
  final AuthRepository repository;

  const RefreshTokens(this.repository);
  @override
  FutureEither<void> call(NoParams params) async =>
      await repository.refreshTokens();
}
