import 'package:equatable/equatable.dart';

import '../../../../core/constants/enums.dart';
import '../../../../core/constants/type_defs.dart';
import '../../../../core/domain/usecases/usecase.dart';
import '../repositories/purchases_repository.dart';

class ChangePurchaseStatus
    implements UseCase<void, ChangePurchaseStatusParams> {
  final PurchasesRepository repository;

  const ChangePurchaseStatus(this.repository);
  @override
  FutureEither<void> call(ChangePurchaseStatusParams params) async =>
      await repository.changePurchase(id: params.id, status: params.status);
}

class ChangePurchaseStatusParams extends Equatable {
  final String id;
  final PurchaseStatus status;

  const ChangePurchaseStatusParams({
    required this.id,
    required this.status,
  });

  @override
  List<Object?> get props => [id, status];
}
