import 'package:dio/dio.dart';

import '../../../../core/api/api_constants.dart';
import '../../../../core/api/dio_client.dart';
import '../../../../core/failure/failure.dart';
import '../../models/model/toggle_cart_wishlist/toggle_cart_wishlist_response_model.dart';

abstract interface class ProductsRemoteDataSource {
  Future<ToggleCartWishlistResponseModel> toggleCart(String id);
  Future<ToggleCartWishlistResponseModel> toggleWishlist(String id);
}

class ProductsRemoteDataSourceImpl implements ProductsRemoteDataSource {
  final DioClient dioClient;

  ProductsRemoteDataSourceImpl(this.dioClient);

  @override
  Future<ToggleCartWishlistResponseModel> toggleCart(String id) async {
    try {
      final res = await dioClient.dio.patch(
        '${ApiConstants.users}/cart/$id',
      );
      return ToggleCartWishlistResponseModel.fromJson(res.data);
    } on DioException catch (e) {
      final res = e.response;
      if (res != null) throw ServerFailure.fromJson(res.data);
      throw CasualFailure(message: e.toString());
    } catch (e) {
      throw CasualFailure(message: e.toString());
    }
  }

  @override
  Future<ToggleCartWishlistResponseModel> toggleWishlist(String id) async {
    try {
      final res = await dioClient.dio.patch(
        '${ApiConstants.users}/wishlist/$id',
      );
      return ToggleCartWishlistResponseModel.fromJson(res.data);
    } on DioException catch (e) {
      final res = e.response;
      if (res != null) throw ServerFailure.fromJson(res.data);
      throw CasualFailure(message: e.toString());
    } catch (e) {
      throw CasualFailure(message: e.toString());
    }
  }
}
