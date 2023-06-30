import '../../../../core/constants/type_defs.dart';
import '../../../auth/domain/entities/current_user.dart';
import '../../domain/repositories/profile_edit_repository.dart';
import '../datasources/profile_edit_remote_data_source.dart';

class ProfileEditRepositoryImpl implements ProfileEditRepository {
  final ProfileEditRemoteDataSource remoteDataSource;

  ProfileEditRepositoryImpl(
    this.remoteDataSource,
  );
  @override
  FutureEither<CurrentUser> editProfile(
      {required String email,
      required String username,
      required String password,
      required String? newPassword}) {
    throw UnimplementedError();
  }
}
