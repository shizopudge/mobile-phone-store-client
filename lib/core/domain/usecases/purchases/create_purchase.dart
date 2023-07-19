import 'package:equatable/equatable.dart';

import '../../../constants/type_defs.dart';
import '../../entities/create_purchase_response.dart';
import '../../repositories/purchase/purchase_repository.dart';
import '../usecase.dart';

class CreatePurchase
    implements UseCase<CreatePurchaseResponse, CreatePurchaseParams> {
  final PurchaseRepository repository;

  const CreatePurchase(this.repository);
  @override
  FutureEither<CreatePurchaseResponse> call(
          CreatePurchaseParams params) async =>
      repository.createPurchase(params.productIds);
}

class CreatePurchaseParams extends Equatable {
  final List<String> productIds;

  const CreatePurchaseParams({required this.productIds});

  @override
  List<Object?> get props => [productIds];
}
