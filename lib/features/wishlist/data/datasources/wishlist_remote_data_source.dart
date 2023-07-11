import 'package:dio/dio.dart';

import '../../../../core/api/api_constants.dart';
import '../../../../core/api/dio_client.dart';
import '../../../../core/data/models/cart_wishlist_response/cart_wishlist_response_model.dart';
import '../../../../core/failure/failure.dart';

abstract interface class WishlistRemoteDataSource {
  Future<CartWishlistResponseModel> getWishlist();
}

class WishlistRemoteDataSourceImpl implements WishlistRemoteDataSource {
  final DioClient dioClient;

  WishlistRemoteDataSourceImpl(this.dioClient);

  @override
  Future<CartWishlistResponseModel> getWishlist() async {
    try {
      final res = await dioClient.dio.get(
        '${ApiConstants.users}/wishlist/products',
      );
      return CartWishlistResponseModel.fromJson(res.data);
    } on DioException catch (e) {
      final res = e.response;
      if (res != null) throw ServerFailure.fromJson(res.data);
      throw CasualFailure(message: e.toString());
    } catch (e) {
      throw CasualFailure(message: e.toString());
    }
  }
}
