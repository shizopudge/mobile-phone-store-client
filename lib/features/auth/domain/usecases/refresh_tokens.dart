import '../../../../core/constants/type_defs.dart';
import '../../../../core/domain/usecases/usecase.dart';
import '../repositories/auth_repository.dart';

class RefreshTokens implements UseCase<void, NoParams> {
  final AuthRepository repository;

  const RefreshTokens(this.repository);
  @override
  FutureEither<void> call(NoParams params) async =>
      await repository.refreshTokens();
}
