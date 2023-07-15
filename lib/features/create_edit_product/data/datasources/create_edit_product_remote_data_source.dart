import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/api/api_constants.dart';
import '../../../../core/api/dio_client.dart';
import '../../../../core/data/models/product/product_model.dart';
import '../../../../core/failure/failure.dart';

abstract interface class CreateEditProductRemoteDataSource {
  Future<ProductModel> createProduct({
    required String modelId,
    required double cost,
    required String color,
    required String colorCode,
    required int storage,
    required int inStockCount,
    required int? discount,
  });
  Future<ProductModel> editProduct({
    required String id,
    required String modelId,
    required double cost,
    required String color,
    required String colorCode,
    required int storage,
    required int inStockCount,
    required int? discount,
  });
  Future<void> uploadImages({
    required String id,
    required List<File> images,
  });
  Future<void> deleteImage({
    required String id,
    required String imageLink,
  });
  Future<void> deleteProduct(String id);
}

class CreateEditProductRemoteDataSourceImpl
    implements CreateEditProductRemoteDataSource {
  final DioClient dioClient;

  const CreateEditProductRemoteDataSourceImpl(this.dioClient);

  @override
  Future<ProductModel> createProduct({
    required String modelId,
    required double cost,
    required String color,
    required String colorCode,
    required int storage,
    required int inStockCount,
    required int? discount,
  }) async {
    try {
      final res = await dioClient.dio.post(
        ApiConstants.products,
        data: {
          'modelId': modelId,
          'cost': cost,
          'color': color,
          'colorCode': colorCode,
          'storage': storage,
          'inStockCount': inStockCount,
          'discount': discount
        },
      );
      return ProductModel.fromJson(res.data);
    } on DioException catch (e) {
      final res = e.response;
      if (res != null) throw ServerFailure.fromJson(res.data);
      throw CasualFailure(message: e.toString());
    } catch (e) {
      throw CasualFailure(message: e.toString());
    }
  }

  @override
  Future<ProductModel> editProduct({
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
      final res = await dioClient.dio.put(
        '${ApiConstants.products}/$id',
        data: {
          'modelId': modelId,
          'cost': cost,
          'color': color,
          'colorCode': colorCode,
          'storage': storage,
          'inStockCount': inStockCount,
          'discount': discount
        },
      );
      return ProductModel.fromJson(res.data);
    } on DioException catch (e) {
      final res = e.response;
      if (res != null) throw ServerFailure.fromJson(res.data);
      throw CasualFailure(message: e.toString());
    } catch (e) {
      throw CasualFailure(message: e.toString());
    }
  }

  @override
  Future<void> uploadImages({
    required String id,
    required List<File> images,
  }) async {
    try {
      final List<MultipartFile> files = [];
      for (File image in images) {
        final fileName = image.path.split('/').last;
        files.add(kIsWeb
            ? MultipartFile.fromBytes(await XFile(image.path).readAsBytes(),
                filename: fileName)
            : await MultipartFile.fromFile(image.path, filename: fileName));
      }
      await dioClient.dio.patch(
        '${ApiConstants.products}/images/$id',
        data: FormData.fromMap({
          'images': files,
        }),
      );
    } on DioException catch (e) {
      final res = e.response;
      if (res != null) throw ServerFailure.fromJson(res.data);
      throw CasualFailure(message: e.toString());
    } catch (e) {
      throw CasualFailure(message: e.toString());
    }
  }

  @override
  Future<void> deleteImage(
      {required String id, required String imageLink}) async {
    try {
      await dioClient.dio.delete(
        '${ApiConstants.products}/images/$id',
        data: {
          'imagesLinks': [imageLink],
        },
      );
    } on DioException catch (e) {
      final res = e.response;
      if (res != null) throw ServerFailure.fromJson(res.data);
      throw CasualFailure(message: e.toString());
    } catch (e) {
      throw CasualFailure(message: e.toString());
    }
  }

  @override
  Future<void> deleteProduct(String id) async {
    try {
      await dioClient.dio.delete(
        '${ApiConstants.products}/$id',
      );
    } on DioException catch (e) {
      final res = e.response;
      if (res != null) throw ServerFailure.fromJson(res.data);
      throw CasualFailure(message: e.toString());
    } catch (e) {
      throw CasualFailure(message: e.toString());
    }
  }
}
