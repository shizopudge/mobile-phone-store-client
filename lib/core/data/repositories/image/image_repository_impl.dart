import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../constants/type_defs.dart';
import '../../../domain/repositories/image/image_repository.dart';
import '../../../failure/failure.dart';
import '../../datasources/image/image_local_data_source.dart';

class ImageRepositoryImpl implements ImageRepository {
  final ImageLocalDataSource localDataSource;

  const ImageRepositoryImpl({required this.localDataSource});
  @override
  FutureEither<File?> pickImage() async {
    try {
      final res = await localDataSource.pickImage();
      return Right(res);
    } on Exception catch (e) {
      return Left(CasualFailure(message: e.toString()));
    }
  }

  @override
  FutureEither<List<File>> pickImages() async {
    try {
      final res = await localDataSource.pickImages();
      return Right(res);
    } on Exception catch (e) {
      return Left(CasualFailure(message: e.toString()));
    }
  }
}
