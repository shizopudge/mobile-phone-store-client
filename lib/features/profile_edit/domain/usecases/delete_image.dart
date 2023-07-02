import '../../../../core/constants/type_defs.dart';
import '../../../../core/domain/usecases/usecase.dart';
import '../repositories/profile_edit_repository.dart';

class DeleteUserImage implements UseCase<void, NoParams> {
  final ProfileEditRepository repository;

  const DeleteUserImage(this.repository);
  @override
  FutureEither<void> call(NoParams params) async =>
      await repository.deleteImage();
}
