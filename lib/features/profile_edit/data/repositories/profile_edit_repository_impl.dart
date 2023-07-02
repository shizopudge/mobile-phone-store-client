import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../core/constants/type_defs.dart';
import '../../../../core/domain/entities/current_user.dart';
import '../../../../core/failure/failure.dart';
import '../../domain/repositories/profile_edit_repository.dart';
import '../datasources/profile_edit_remote_data_source.dart';

class ProfileEditRepositoryImpl implements ProfileEditRepository {
  final ProfileEditRemoteDataSource remoteDataSource;

  ProfileEditRepositoryImpl(
    this.remoteDataSource,
  );
  @override
  FutureEither<CurrentUser> editProfile({
    required String email,
    required String username,
    required String password,
    required String? newPassword,
  }) async {
    try {
      final res = await remoteDataSource.editProfile(
          email: email,
          username: username,
          password: password,
          newPassword: newPassword);
      final currentUser = CurrentUser.fromModel(res);
      return Right(currentUser);
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return const Left(UnknownFailure());
    }
  }

  @override
  FutureEither<String> uploadImage(File image) async {
    try {
      final res = await remoteDataSource.uploadImage(image);
      return Right(res);
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return const Left(UnknownFailure());
    }
  }

  @override
  FutureEither<void> deleteImage() async {
    try {
      await remoteDataSource.deleteImage();
      return const Right(null);
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return const Left(UnknownFailure());
    }
  }
}
