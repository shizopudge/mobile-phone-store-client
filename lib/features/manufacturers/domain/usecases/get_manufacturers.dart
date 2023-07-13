import 'package:equatable/equatable.dart';

import '../../../../core/constants/type_defs.dart';
import '../../../../core/domain/usecases/usecase.dart';
import '../entities/manufacturers_response.dart';
import '../repositories/manufacturers_repository.dart';

class GetManufacturers
    implements UseCase<ManufacturersResponse, GetManufacturersParams> {
  final ManufacturersRepository repository;

  GetManufacturers(this.repository);
  @override
  FutureEither<ManufacturersResponse> call(
          GetManufacturersParams params) async =>
      await repository.getManufacturers(
          query: params.query, page: params.page, limit: params.limit);
}

class GetManufacturersParams extends Equatable {
  final String query;
  final int page;
  final int limit;

  const GetManufacturersParams({
    required this.query,
    required this.page,
    required this.limit,
  });

  @override
  List<Object?> get props => [query, page, limit];
}
