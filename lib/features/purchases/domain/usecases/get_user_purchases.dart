import 'package:equatable/equatable.dart';

import '../../../../core/constants/type_defs.dart';
import '../../../../core/domain/usecases/usecase.dart';
import '../entities/purchase_response.dart';
import '../repositories/purchases_repository.dart';

class GetUserPurchases
    implements UseCase<PurchasesResponse, GetUserPurchasesParams> {
  final PurchasesRepository repository;

  const GetUserPurchases(this.repository);
  @override
  FutureEither<PurchasesResponse> call(GetUserPurchasesParams params) async =>
      await repository.getUserPurchases(
          query: params.query, page: params.page, limit: params.limit);
}

class GetUserPurchasesParams extends Equatable {
  final String query;
  final int page;
  final int limit;

  const GetUserPurchasesParams({
    required this.query,
    required this.page,
    required this.limit,
  });

  @override
  List<Object?> get props => [query, page, limit];
}
