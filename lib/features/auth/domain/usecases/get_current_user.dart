import '../../../../core/constants/type_defs.dart';
import '../../../../core/domain/entities/current_user.dart';
import '../../../../core/domain/usecases/usecase.dart';
import '../repositories/auth_repository.dart';

class GetCurrentUser implements UseCase<CurrentUser, NoParams> {
  final AuthRepository repository;

  const GetCurrentUser(this.repository);
  @override
  FutureEither<CurrentUser> call(NoParams params) async =>
      await repository.getCurrentUser();
}
