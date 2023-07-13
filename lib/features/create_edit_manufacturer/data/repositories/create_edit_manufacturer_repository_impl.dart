import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../core/constants/type_defs.dart';
import '../../../../core/domain/entities/manufacturer.dart';
import '../../../../core/failure/failure.dart';
import '../../domain/repositories/create_edit_manufacturer_repository.dart';
import '../datasources/create_edit_manufacturer_remote_data_source.dart';

class CreateEditManufacturerRepositoryImpl
    implements CreateEditManufacturerRepository {
  final CreateEditManufacturerRemoteDataSource remoteDataSource;

  CreateEditManufacturerRepositoryImpl({required this.remoteDataSource});
  @override
  FutureEither<Manufacturer> createManufacturer({required String name}) async {
    try {
      final res = await remoteDataSource.createManufacturer(name: name);
      return Right(Manufacturer.fromModel(res));
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(CasualFailure(message: e.toString()));
    }
  }

  @override
  FutureEither<Manufacturer> editManufacturer(
      {required String id, required String name}) async {
    try {
      final res = await remoteDataSource.editManufacturer(id: id, name: name);
      return Right(Manufacturer.fromModel(res));
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(CasualFailure(message: e.toString()));
    }
  }

  @override
  FutureEither<String> uploadImage(
      {required String id, required File image}) async {
    try {
      final String imageId =
          await remoteDataSource.uploadImage(id: id, image: image);
      return Right(imageId);
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(CasualFailure(message: e.toString()));
    }
  }

  @override
  FutureEither<void> deleteImage(String id) async {
    try {
      await remoteDataSource.deleteImage(id);
      return const Right(null);
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(CasualFailure(message: e.toString()));
    }
  }
}
