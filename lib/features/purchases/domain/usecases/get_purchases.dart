import 'package:equatable/equatable.dart';

import '../../../../core/constants/type_defs.dart';
import '../../../../core/domain/usecases/usecase.dart';
import '../entities/purchase_response.dart';
import '../repositories/purchases_repository.dart';

class GetPurchases implements UseCase<PurchasesResponse, GetPurchasesParams> {
  final PurchasesRepository repository;

  const GetPurchases(this.repository);
  @override
  FutureEither<PurchasesResponse> call(GetPurchasesParams params) async =>
      await repository.getPurchases(
          query: params.query, page: params.page, limit: params.limit);
}

class GetPurchasesParams extends Equatable {
  final String query;
  final int page;
  final int limit;

  const GetPurchasesParams({
    required this.query,
    required this.page,
    required this.limit,
  });

  @override
  List<Object?> get props => [query, page, limit];
}
