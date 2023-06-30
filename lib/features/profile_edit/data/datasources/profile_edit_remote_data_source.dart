import '../../../../core/api/dio_client.dart';
import '../../../auth/data/models/current_user/current_user_model.dart';

abstract interface class ProfileEditRemoteDataSource {
  Future<CurrentUserModel> editProfile();
}

class ProfileEditRemoteDataSourceImpl implements ProfileEditRemoteDataSource {
  final DioClient dioClient;

  ProfileEditRemoteDataSourceImpl(this.dioClient);
  @override
  Future<CurrentUserModel> editProfile() {
    throw UnimplementedError();
  }
}
