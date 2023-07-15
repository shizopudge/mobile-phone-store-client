import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../core/constants/type_defs.dart';
import '../../../../core/domain/entities/product.dart';
import '../../../../core/failure/failure.dart';
import '../../domain/repositories/create_edit_product_repository.dart';
import '../datasources/create_edit_product_remote_data_source.dart';

class CreateEditProductRepositoryImpl implements CreateEditProductRepository {
  final CreateEditProductRemoteDataSource remoteDataSource;

  const CreateEditProductRepositoryImpl({required this.remoteDataSource});

  @override
  FutureEither<Product> createProduct({
    required String modelId,
    required double cost,
    required String color,
    required String colorCode,
    required int storage,
    required int inStockCount,
    required int? discount,
  }) async {
    try {
      final res = await remoteDataSource.createProduct(
          modelId: modelId,
          cost: cost,
          color: color,
          colorCode: colorCode,
          storage: storage,
          inStockCount: inStockCount,
          discount: discount);
      return Right(Product.fromModel(res));
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(CasualFailure(message: e.toString()));
    }
  }

  @override
  FutureEither<Product> editProduct({
    required String id,
    required String modelId,
    required double cost,
    required String color,
    required String colorCode,
    required int storage,
    required int inStockCount,
    required int? discount,
  }) async {
    try {
      final res = await remoteDataSource.editProduct(
          id: id,
          modelId: modelId,
          cost: cost,
          color: color,
          colorCode: colorCode,
          storage: storage,
          inStockCount: inStockCount,
          discount: discount);
      return Right(Product.fromModel(res));
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(CasualFailure(message: e.toString()));
    }
  }

  @override
  FutureEither<void> uploadImages(
      {required String id, required List<File> images}) async {
    try {
      await remoteDataSource.uploadImages(id: id, images: images);
      return const Right(null);
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(CasualFailure(message: e.toString()));
    }
  }

  @override
  FutureEither<void> deleteImage(
      {required String id, required String imageLink}) async {
    try {
      await remoteDataSource.deleteImage(id: id, imageLink: imageLink);
      return const Right(null);
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(CasualFailure(message: e.toString()));
    }
  }

  @override
  FutureEither<void> deleteProduct(String id) async {
    try {
      await remoteDataSource.deleteProduct(id);
      return const Right(null);
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(CasualFailure(message: e.toString()));
    }
  }
}
