import 'package:equatable/equatable.dart';

import '../../../constants/type_defs.dart';
import '../../repositories/purchase/purchase_repository.dart';
import '../usecase.dart';

class OpenUrl implements UseCase<void, OpenUrlParams> {
  final PurchaseRepository repository;

  const OpenUrl(this.repository);
  @override
  FutureEither<void> call(OpenUrlParams params) async =>
      await repository.openUrl(params.url);
}

class OpenUrlParams extends Equatable {
  final String url;

  const OpenUrlParams({required this.url});

  @override
  List<Object?> get props => [url];
}
